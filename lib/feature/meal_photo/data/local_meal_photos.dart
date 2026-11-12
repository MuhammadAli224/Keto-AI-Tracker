import 'dart:io';
import 'dart:isolate';

import 'package:flutter/services.dart';
import 'package:hive_ce/hive.dart';
import 'package:image/image.dart' as image;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../domain/meal_photo.dart';

class LocalMealPhotos {
  LocalMealPhotos(this._picker, this._box);

  final ImagePicker _picker;
  final Box<dynamic> _box;
  static const _channel = MethodChannel('keto_tracker/photos');
  static const _interruptedOwner = 'mealPhotoPickerOwner';
  static final _refPattern = RegExp(r'^[a-f0-9-]{36}$');

  Future<Directory> _ownerDirectory(String uid) async {
    final base = await _channel.invokeMethod<String>('privateDirectory');
    if (base == null) throw StateError('Photo directory unavailable');
    return Directory(path.join(base, Uri.encodeComponent(uid)));
  }

  Future<File> file(String uid, String ref) async {
    if (!_refPattern.hasMatch(ref)) {
      throw const FormatException('Invalid photo reference');
    }
    final directory = await _ownerDirectory(uid);
    return File(path.join(directory.path, '$ref.jpg'));
  }

  bool canRecover(String uid) =>
      Platform.isAndroid && _box.get(_interruptedOwner) == uid;

  Future<MealPhoto?> capture(String uid, MealPhotoSource source) async {
    XFile? selected;
    if (source == MealPhotoSource.recovery) {
      if (!canRecover(uid)) return null;
      final response = await _picker.retrieveLostData();
      selected = response.files?.firstOrNull;
      await _box.delete(_interruptedOwner);
      if (response.exception != null) throw response.exception!;
    } else {
      if (Platform.isAndroid) await _box.put(_interruptedOwner, uid);
      try {
        selected = await _picker.pickImage(
          source: source == MealPhotoSource.camera
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 2048,
          maxHeight: 2048,
          imageQuality: 90,
          requestFullMetadata: false,
        );
      } finally {
        if (Platform.isAndroid) await _box.delete(_interruptedOwner);
      }
    }
    if (selected == null) return null;
    try {
      if (await selected.length() > 24 * 1024 * 1024) {
        throw const FormatException('Image too large');
      }
      return await _save(uid, await selected.readAsBytes());
    } finally {
      final temporary = await getTemporaryDirectory();
      if (path.isWithin(temporary.path, selected.path)) {
        try {
          await File(selected.path).delete();
        } on FileSystemException {
          // The picker may already have removed its temporary copy.
        }
      }
    }
  }

  Future<MealPhoto> redact(String uid, MealPhoto photo, PhotoMask mask) async {
    final original = await file(uid, photo.ref);
    return _save(uid, await original.readAsBytes(), mask: mask);
  }

  Future<void> discard(String uid, String ref) async {
    final target = await file(uid, ref);
    if (await target.exists()) await target.delete();
  }

  Future<MealPhoto> _save(
    String uid,
    Uint8List bytes, {
    PhotoMask? mask,
  }) async {
    final result = await Isolate.run(() => _prepareImage(bytes, mask));
    final ref = const Uuid().v4();
    final output = await file(uid, ref);
    await output.parent.create(recursive: true);
    try {
      await output.writeAsBytes(result.$1, flush: true);
      return MealPhoto(
        ref: ref,
        localPath: output.path,
        width: result.$2,
        height: result.$3,
      );
    } catch (_) {
      if (await output.exists()) await output.delete();
      rethrow;
    }
  }
}

(Uint8List, int, int) _prepareImage(Uint8List input, PhotoMask? mask) {
  final decoded = image.decodeImage(input);
  if (decoded == null || decoded.width * decoded.height > 24 * 1024 * 1024) {
    throw const FormatException('Unsupported image');
  }
  final oriented = image.bakeOrientation(decoded);
  final bounded = oriented.width > 1600 || oriented.height > 1600
      ? image.copyResize(
          oriented,
          width: oriented.width >= oriented.height ? 1600 : null,
          height: oriented.height > oriented.width ? 1600 : null,
        )
      : oriented;
  // Copy pixels into a new image, dropping EXIF, GPS and text metadata.
  final clean = image.Image(
    width: bounded.width,
    height: bounded.height,
    numChannels: 3,
  );
  image.compositeImage(clean, bounded);
  if (mask != null) {
    int pixel(double fraction, int size) =>
        (fraction * size).round().clamp(0, size - 1);
    image.fillRect(
      clean,
      x1: pixel(mask.left, clean.width),
      y1: pixel(mask.top, clean.height),
      x2: pixel(mask.right, clean.width),
      y2: pixel(mask.bottom, clean.height),
      color: image.ColorRgb8(0, 0, 0),
    );
  }
  for (final quality in const [84, 72, 60, 45]) {
    final data = image.encodeJpg(clean, quality: quality);
    if (data.length <= 2 * 1024 * 1024) {
      return (data, clean.width, clean.height);
    }
  }
  throw const FormatException('Compressed image too large');
}
