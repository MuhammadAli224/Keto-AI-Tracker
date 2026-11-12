import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../domain/entities/owner_profile.dart';
import '../../../domain/repository/owner_repository.dart';
import '../../../domain/usecases/owner_access.dart';

part 'owner_profile_cubit.freezed.dart';

@freezed
sealed class OwnerProfileState with _$OwnerProfileState {
  const factory OwnerProfileState.loading() = ProfileLoading;
  const factory OwnerProfileState.ready(
    OwnerProfileSnapshot snapshot, {
    @Default(false) bool saving,
    OwnerError? saveError,
  }) = ProfileReady;
  const factory OwnerProfileState.failure(OwnerError error) = ProfileFailure;
}

class OwnerProfileCubit extends Cubit<OwnerProfileState>
    with CubitLifecycleMixin<OwnerProfileState> {
  OwnerProfileCubit(this._access, this.uid)
    : super(const OwnerProfileState.loading()) {
    subscribe();
  }

  final OwnerAccess _access;
  final String uid;
  StreamSubscription<Either<OwnerFailure, OwnerProfileSnapshot>>? _subscription;
  static const _save = 'save';
  static const _watch = 'watch';

  Future<void> subscribe() async {
    if (isClosed) return;
    final request = beginRequest(_watch);
    emit(const OwnerProfileState.loading());
    await _subscription?.cancel();
    if (!isCurrentRequest(_watch, request)) return;
    _subscription = _access.watchProfile(uid).listen((result) {
      if (!isCurrentRequest(_watch, request)) return;
      final current = state;
      emit(
        result.fold(
          (failure) => OwnerProfileState.failure(failure.error),
          (snapshot) => OwnerProfileState.ready(
            snapshot,
            saving: current is ProfileReady && current.saving,
            saveError: current is ProfileReady ? current.saveError : null,
          ),
        ),
      );
    }, onDone: () => finishRequest(_watch, request));
  }

  Future<void> save(
    OwnerProfile profile, {
    double? latestWeightKg,
    bool weightEdited = false,
  }) async {
    final current = state;
    if (isClosed || current is! ProfileReady || current.saving) return;
    if (current.snapshot.profile == null &&
        current.snapshot.sync != ProfileSync.confirmed) {
      return;
    }
    final request = beginRequest(_save);
    emit(current.copyWith(saving: true, saveError: null));
    try {
      final recordWeight =
          current.snapshot.profile?.isConfirmed == true &&
          latestWeightKg != null &&
          weightEdited &&
          latestWeightKg != profile.currentWeightKg;
      final saved = latestWeightKg != null && !recordWeight
          ? profile.copyWith(
              currentWeightKg:
                  current.snapshot.profile?.currentWeightKg ??
                  profile.currentWeightKg,
            )
          : profile;
      final result = await _access.saveProfile(
        uid,
        saved,
        recordWeight: recordWeight,
      );
      final latest = state;
      if (!isCurrentRequest(_save, request) || latest is! ProfileReady) return;
      emit(
        latest.copyWith(
          saving: false,
          saveError: result.fold((failure) => failure.error, (_) => null),
        ),
      );
    } finally {
      finishRequest(_save, request);
    }
  }

  @override
  Future<void> close() async {
    final closing = super.close();
    await _subscription?.cancel();
    return closing;
  }
}
