import 'meal_photo.dart';

abstract interface class MealPhotoRepository {
  bool get storageAvailable;
  bool canRecover(String uid);
  Stream<MealPhotoAttachment> watch(String uid, String mealId);
  Future<MealPhoto?> capture(String uid, MealPhotoSource source);
  Future<MealPhoto> redact(String uid, MealPhoto photo, PhotoMask mask);
  Future<void> discard(String uid, MealPhoto photo);
  Future<void> link(String uid, String mealId, MealPhoto? photo, bool upload);
  Future<void> retry(String uid, String mealId);
}

class MealPhotoAccess {
  const MealPhotoAccess(this._repository, this._confirmedUid);

  final MealPhotoRepository _repository;
  final String? Function() _confirmedUid;

  bool get storageAvailable => _repository.storageAvailable;

  bool canRecover(String uid) =>
      _confirmedUid() == uid && _repository.canRecover(uid);

  String get ownerUid =>
      _confirmedUid() ?? (throw StateError('No confirmed owner'));

  Stream<MealPhotoAttachment> watch(String uid, String mealId) async* {
    _check(uid);
    await for (final attachment in _repository.watch(uid, mealId)) {
      if (_confirmedUid() != uid) return;
      yield attachment;
    }
  }

  Future<MealPhoto?> capture(String uid, MealPhotoSource source) async {
    _check(uid);
    final photo = await _repository.capture(uid, source);
    if (_confirmedUid() != uid) {
      if (photo != null) await _repository.discard(uid, photo);
      throw StateError('Account changed');
    }
    return photo;
  }

  Future<MealPhoto> redact(String uid, MealPhoto photo, PhotoMask mask) async {
    _check(uid);
    final redacted = await _repository.redact(uid, photo, mask);
    if (_confirmedUid() != uid) {
      await _repository.discard(uid, redacted);
      throw StateError('Account changed');
    }
    return redacted;
  }

  // A route may discard its own unlinked file during account changes.
  Future<void> discard(String uid, MealPhoto photo) =>
      _repository.discard(uid, photo);

  Future<void> link(String uid, String mealId, MealPhoto? photo, bool upload) {
    _check(uid);
    return _repository.link(uid, mealId, photo, upload);
  }

  Future<void> deleteLinked(String mealId) =>
      link(ownerUid, mealId, null, false);

  Future<void> retry(String uid, String mealId) {
    _check(uid);
    return _repository.retry(uid, mealId);
  }

  void _check(String uid) {
    if (_confirmedUid() != uid) throw StateError('Account changed');
  }
}
