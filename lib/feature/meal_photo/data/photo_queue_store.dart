import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../domain/meal_photo.dart';

class QueuedPhoto {
  const QueuedPhoto({
    required this.mealId,
    required this.status,
    required this.uploadApproved,
    required this.remoteMayExist,
    this.ref,
    this.width,
    this.height,
  });

  final String mealId;
  final MealPhotoStatus status;
  final bool uploadApproved;
  final bool remoteMayExist;
  final String? ref;
  final int? width;
  final int? height;

  QueuedPhoto transition(MealPhotoStatus next, {bool? remoteMayExist}) =>
      QueuedPhoto(
        mealId: mealId,
        status: next,
        uploadApproved: uploadApproved,
        remoteMayExist: remoteMayExist ?? this.remoteMayExist,
        ref: ref,
        width: width,
        height: height,
      );
}

class PhotoQueueStore {
  const PhotoQueueStore(this._box);
  final Box<dynamic> _box;

  String _prefix(String uid) => 'mealPhoto:${Uri.encodeComponent(uid)}:';
  String _key(String uid, String mealId) => '${_prefix(uid)}$mealId';

  QueuedPhoto? read(String uid, String mealId) {
    final raw = _box.get(_key(uid, mealId));
    if (raw is! String) return null;
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return QueuedPhoto(
      mealId: mealId,
      status: MealPhotoStatus.values.byName(json['status'] as String),
      uploadApproved: json['uploadApproved'] == true,
      remoteMayExist: json['remoteMayExist'] == true,
      ref: json['ref'] as String?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );
  }

  Iterable<QueuedPhoto> list(String uid) sync* {
    final prefix = _prefix(uid);
    for (final key in _box.keys.whereType<String>().where(
      (key) => key.startsWith(prefix),
    )) {
      final row = read(uid, key.substring(prefix.length));
      if (row != null) yield row;
    }
  }

  Stream<void> changes(String uid, String mealId) =>
      _box.watch(key: _key(uid, mealId)).map((_) {});

  Future<void> put(String uid, QueuedPhoto record) => _box.put(
    _key(uid, record.mealId),
    jsonEncode({
      'status': record.status.name,
      'uploadApproved': record.uploadApproved,
      'remoteMayExist': record.remoteMayExist,
      'ref': record.ref,
      'width': record.width,
      'height': record.height,
    }),
  );

  Future<void> remove(String uid, String mealId) =>
      _box.delete(_key(uid, mealId));
}
