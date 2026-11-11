import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../domain/meal_photo.dart';
import '../domain/meal_photo_access.dart';

part 'meal_photo_cubit.freezed.dart';

@freezed
abstract class MealPhotoState with _$MealPhotoState {
  const factory MealPhotoState({
    MealPhoto? photo,
    @Default(MealPhotoStatus.localOnly) MealPhotoStatus status,
    @Default(false) bool upload,
    @Default(false) bool ready,
    @Default(false) bool busy,
    @Default(false) bool failed,
  }) = _MealPhotoState;
}

class MealPhotoCubit extends Cubit<MealPhotoState>
    with CubitLifecycleMixin<MealPhotoState> {
  MealPhotoCubit(this._access, this.mealId)
    : _uid = _access.ownerUid,
      super(const MealPhotoState()) {
    _subscription = _access.watch(_uid, mealId).listen(
      (attachment) {
        if (isClosed) return;
        _linkedRef = attachment.photo?.ref;
        if (_changed) {
          emit(state.copyWith(ready: true));
        } else {
          emit(
            state.copyWith(
              photo: attachment.photo,
              status: attachment.status,
              upload: attachment.uploadApproved,
              ready: true,
            ),
          );
        }
      },
      onError: (Object _) =>
          safeEmit(state.copyWith(ready: true, failed: true)),
    );
  }

  final MealPhotoAccess _access;
  final String mealId;
  final String _uid;
  late final StreamSubscription<MealPhotoAttachment> _subscription;
  String? _linkedRef;
  bool _changed = false;
  static const _action = 'photo';

  bool get storageAvailable => _access.storageAvailable;

  bool get canRecover => _access.canRecover(_uid);

  Future<void> capture(MealPhotoSource source) =>
      _changePhoto(() => _access.capture(_uid, source));

  Future<void> redact(PhotoMask mask) async {
    final photo = state.photo;
    if (photo == null) return;
    await _changePhoto(() => _access.redact(_uid, photo, mask));
  }

  Future<void> _changePhoto(Future<MealPhoto?> Function() operation) async {
    if (isClosed || state.busy || !state.ready) return;
    final request = beginRequest(_action);
    emit(state.copyWith(busy: true, failed: false));
    try {
      final photo = await operation();
      if (!isCurrentRequest(_action, request)) {
        if (photo != null) await _discard(photo);
        return;
      }
      if (photo != null) {
        final previous = state.photo;
        _changed = true;
        emit(
          state.copyWith(
            photo: photo,
            upload: false,
            status: MealPhotoStatus.localOnly,
          ),
        );
        if (previous != null && previous.ref != _linkedRef) {
          await _discard(previous);
        }
      }
    } catch (_) {
      if (isCurrentRequest(_action, request)) {
        emit(state.copyWith(failed: true));
      }
    } finally {
      if (isCurrentRequest(_action, request)) emit(state.copyWith(busy: false));
      finishRequest(_action, request);
    }
  }

  void setUpload(bool value) {
    if (isClosed || state.busy || !storageAvailable || state.photo == null) {
      return;
    }
    _changed = true;
    emit(state.copyWith(upload: value));
  }

  Future<void> remove() async {
    if (isClosed || state.busy) return;
    final photo = state.photo;
    _changed = true;
    emit(
      state.copyWith(
        photo: null,
        upload: false,
        status: MealPhotoStatus.localOnly,
      ),
    );
    if (photo != null && photo.ref != _linkedRef) await _discard(photo);
  }

  Future<void> retry() async {
    if (isClosed || state.busy || _changed) return;
    try {
      await _access.retry(_uid, mealId);
    } catch (_) {
      safeEmit(state.copyWith(failed: true));
    }
  }

  Future<String?> commit() async {
    if (isClosed || state.busy || !state.ready) {
      throw StateError('Photo is busy');
    }
    final ref = state.photo?.ref;
    if (!_changed) return ref;
    final request = beginRequest(_action);
    emit(state.copyWith(busy: true, failed: false));
    try {
      await _access.link(_uid, mealId, state.photo, state.upload);
      _linkedRef = ref;
      _changed = false;
      return ref;
    } catch (_) {
      if (isCurrentRequest(_action, request)) {
        emit(state.copyWith(failed: true));
      }
      rethrow;
    } finally {
      if (isCurrentRequest(_action, request)) emit(state.copyWith(busy: false));
      finishRequest(_action, request);
    }
  }

  Future<void> _discard(MealPhoto photo) async {
    try {
      await _access.discard(_uid, photo);
    } catch (_) {}
  }

  @override
  Future<void> close() async {
    final photo = state.photo;
    final closing = super.close();
    await _subscription.cancel();
    if (photo != null && photo.ref != _linkedRef) await _discard(photo);
    return closing;
  }
}
