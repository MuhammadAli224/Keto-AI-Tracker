import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../domain/repository/owner_repository.dart';
import '../../../domain/usecases/owner_access.dart';

part 'owner_auth_cubit.freezed.dart';

@freezed
sealed class OwnerAuthState with _$OwnerAuthState {
  const factory OwnerAuthState.idle() = AuthIdle;
  const factory OwnerAuthState.working() = AuthWorking;
  const factory OwnerAuthState.failure(OwnerError error) = AuthFailure;
}

class OwnerAuthCubit extends Cubit<OwnerAuthState>
    with CubitLifecycleMixin<OwnerAuthState> {
  OwnerAuthCubit(this._access) : super(const OwnerAuthState.idle());

  final OwnerAccess _access;
  static const _action = 'auth';

  Future<void> signIn(String email, String password) =>
      _perform(() => _access.signIn(email.trim(), password));

  Future<void> signOut() => _perform(_access.signOut);

  Future<void> _perform<T>(
    Future<Either<OwnerFailure, T>> Function() operation,
  ) async {
    if (isClosed || state is AuthWorking) return;
    final request = beginRequest(_action);
    emit(const OwnerAuthState.working());
    try {
      final result = await operation();
      if (!isCurrentRequest(_action, request)) return;
      emit(
        result.fold(
          (failure) => OwnerAuthState.failure(failure.error),
          (_) => const OwnerAuthState.idle(),
        ),
      );
    } finally {
      finishRequest(_action, request);
    }
  }
}
