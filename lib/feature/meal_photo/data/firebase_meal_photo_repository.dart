import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../domain/meal_photo.dart';
import '../domain/meal_photo_access.dart';
import 'local_meal_photos.dart';
import 'photo_queue_store.dart';

class FirebaseMealPhotoRepository implements MealPhotoRepository {
  FirebaseMealPhotoRepository(
    this._files,
    this._queue,
    this._auth,
    this._connectivity,
  ) {
    if (storageAvailable) {
      _network = _connectivity.onConnectivityChanged.listen((_) => _resume());
    }
  }

  final LocalMealPhotos _files;
  final PhotoQueueStore _queue;
  final FirebaseAuth _auth;
  final Connectivity _connectivity;
  StreamSubscription<List<ConnectivityResult>>? _network;
  String? _owner;
  bool _running = false;
  bool _requested = false;
  UploadTask? _upload;
  String? _activeMeal;
  final _versions = <String, int>{};

  @override
  bool get storageAvailable =>
      const bool.fromEnvironment('MEAL_PHOTO_STORAGE_ENABLED');

  @override
  bool canRecover(String uid) => _files.canRecover(uid);

  void activate(String? uid) {
    if (_owner == uid) return;
    _owner = uid;
    final upload = _upload;
    if (upload != null) {
      unawaited(
        upload.cancel().then<void>(
          (_) {},
          onError: (Object _, StackTrace __) {},
        ),
      );
    }
    _resume();
  }

  bool _isOwner(String uid) => uid == _owner && _auth.currentUser?.uid == uid;

  @override
  Stream<MealPhotoAttachment> watch(String uid, String mealId) async* {
    yield await _attachment(uid, mealId);
    await for (final _ in _queue.changes(uid, mealId)) {
      yield await _attachment(uid, mealId);
    }
  }

  Future<MealPhotoAttachment> _attachment(String uid, String mealId) async {
    final record = _queue.read(uid, mealId);
    if (record == null) return const MealPhotoAttachment();
    final ref = record.ref;
    MealPhoto? photo;
    if (ref != null && record.width != null && record.height != null) {
      final file = await _files.file(uid, ref);
      if (await file.exists()) {
        photo = MealPhoto(
          ref: ref,
          localPath: file.path,
          width: record.width!,
          height: record.height!,
        );
      }
    }
    return MealPhotoAttachment(
      photo: photo,
      status: record.status,
      uploadApproved: record.uploadApproved,
    );
  }

  @override
  Future<MealPhoto?> capture(String uid, MealPhotoSource source) =>
      _files.capture(uid, source);

  @override
  Future<MealPhoto> redact(String uid, MealPhoto photo, PhotoMask mask) =>
      _files.redact(uid, photo, mask);

  @override
  Future<void> discard(String uid, MealPhoto photo) =>
      _files.discard(uid, photo.ref);

  @override
  Future<void> link(
    String uid,
    String mealId,
    MealPhoto? photo,
    bool upload,
  ) async {
    if (!_isOwner(uid)) throw StateError('Account changed');
    _bump(uid, mealId);
    if (_activeMeal == mealId && _upload != null) await _upload!.cancel();
    if (!_isOwner(uid)) throw StateError('Account changed');

    final previous = _queue.read(uid, mealId);
    final approved = upload && photo != null && storageAvailable;
    final remote = previous?.remoteMayExist ?? false;
    final sameUpload =
        approved &&
        previous?.ref == photo.ref &&
        previous?.status == MealPhotoStatus.uploaded;
    if (photo == null && !remote) {
      await _queue.remove(uid, mealId);
    } else {
      await _queue.put(
        uid,
        QueuedPhoto(
          mealId: mealId,
          status: sameUpload
              ? MealPhotoStatus.uploaded
              : approved
              ? MealPhotoStatus.queued
              : remote
              ? MealPhotoStatus.removing
              : MealPhotoStatus.localOnly,
          uploadApproved: approved,
          remoteMayExist: remote,
          ref: photo?.ref,
          width: photo?.width,
          height: photo?.height,
        ),
      );
    }
    final replaced = previous?.ref;
    if (replaced != null && replaced != photo?.ref) {
      try {
        await _files.discard(uid, replaced);
      } catch (_) {
        // The linked record is already committed.
      }
    }
    _resume();
  }

  @override
  Future<void> retry(String uid, String mealId) async {
    if (!_isOwner(uid)) return;
    final record = _queue.read(uid, mealId);
    if (record == null) return;
    if (record.status == MealPhotoStatus.failed && record.uploadApproved) {
      await _queue.put(uid, record.transition(MealPhotoStatus.queued));
    } else if (record.status == MealPhotoStatus.removeFailed) {
      await _queue.put(uid, record.transition(MealPhotoStatus.removing));
    }
    _resume();
  }

  String _key(String uid, String mealId) => '$uid/$mealId';
  void _bump(String uid, String mealId) => _versions.update(
    _key(uid, mealId),
    (value) => value + 1,
    ifAbsent: () => 1,
  );

  void _resume() {
    if (!storageAvailable || _owner == null) return;
    if (_running) {
      _requested = true;
      return;
    }
    _running = true;
    unawaited(_drain());
  }

  Future<void> _drain() async {
    try {
      do {
        _requested = false;
        final uid = _owner;
        if (uid == null || !_isOwner(uid)) return;
        final network = await _connectivity.checkConnectivity();
        if (network.isEmpty ||
            network.every((type) => type == ConnectivityResult.none)) {
          return;
        }
        for (final record in _queue.list(uid).toList()) {
          if (!_isOwner(uid)) break;
          if (record.status == MealPhotoStatus.removing) {
            await _transfer(uid, record, remove: true);
          } else if (record.uploadApproved &&
              (record.status == MealPhotoStatus.queued ||
                  record.status == MealPhotoStatus.uploading)) {
            await _transfer(uid, record);
          }
        }
      } while (_requested);
    } catch (_) {
      // Pending operations stay on disk for a later connectivity event or retry.
    } finally {
      _running = false;
    }
  }

  Future<void> _transfer(
    String uid,
    QueuedPhoto record, {
    bool remove = false,
  }) async {
    final saved = _queue.read(uid, record.mealId);
    if (saved?.ref != record.ref ||
        saved?.status != record.status ||
        saved?.uploadApproved != record.uploadApproved) {
      return;
    }
    final key = _key(uid, record.mealId);
    final version = _versions[key];
    bool current() => _isOwner(uid) && version == _versions[key];
    if (!current()) return;
    final reference = FirebaseStorage.instance.ref(
      'users/$uid/mealPhotos/${record.mealId}.jpg',
    );
    _activeMeal = record.mealId;
    try {
      if (remove) {
        try {
          await reference.delete().timeout(const Duration(seconds: 30));
        } on FirebaseException catch (error) {
          if (error.code != 'object-not-found') rethrow;
        }
        if (!current()) return;
        if (record.ref == null) {
          await _queue.remove(uid, record.mealId);
        } else {
          await _queue.put(
            uid,
            record.transition(MealPhotoStatus.localOnly, remoteMayExist: false),
          );
        }
        return;
      }
      final ref = record.ref;
      if (ref == null) throw StateError('No photo to upload');
      final file = await _files.file(uid, ref);
      if (!await file.exists()) throw StateError('Local photo missing');
      if (!current()) return;
      await _queue.put(
        uid,
        record.transition(MealPhotoStatus.uploading, remoteMayExist: true),
      );
      if (!current()) return;
      final task = reference.putFile(
        file,
        SettableMetadata(contentType: 'image/jpeg'),
      );
      _upload = task;
      try {
        await task.timeout(const Duration(seconds: 60));
      } on TimeoutException {
        await task.cancel();
        rethrow;
      }
      if (current()) {
        await _queue.put(
          uid,
          record.transition(MealPhotoStatus.uploaded, remoteMayExist: true),
        );
      }
    } catch (error) {
      if (!current()) return;
      final canRetry =
          error is TimeoutException ||
          error is FirebaseException &&
              const {
                'canceled',
                'retry-limit-exceeded',
                'network-request-failed',
                'unavailable',
              }.contains(error.code);
      final failed = remove
          ? (canRetry ? MealPhotoStatus.removing : MealPhotoStatus.removeFailed)
          : (canRetry ? MealPhotoStatus.queued : MealPhotoStatus.failed);
      final latest = _queue.read(uid, record.mealId);
      if (latest != null && current()) {
        await _queue.put(uid, latest.transition(failed));
      }
    } finally {
      _upload = null;
      _activeMeal = null;
    }
  }

  Future<void> dispose() async {
    activate(null);
    await _network?.cancel();
  }
}
