import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/domain/request_cancellation.dart';
import '../../../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../domain/ai_assistance.dart';
import '../../../domain/ai_assistance_access.dart';

part 'ai_assistance_cubit.freezed.dart';

@freezed
abstract class AiAssistanceState with _$AiAssistanceState {
  const factory AiAssistanceState({
    @Default(false) bool busy,
    AiFailure? failure,
    MealEstimate? meal,
    CoachReply? reply,
  }) = _AiAssistanceState;
}

class AiAssistanceCubit extends Cubit<AiAssistanceState>
    with CubitLifecycleMixin<AiAssistanceState> {
  AiAssistanceCubit(this._access, this._identity, this._confirmedUid)
    : _owner = _confirmedUid(),
      super(const AiAssistanceState()) {
    _identity.addListener(_ownerChanged);
  }

  final AiAssistanceAccess _access;
  final Listenable _identity;
  final String? Function() _confirmedUid;
  final String? _owner;

  void _ownerChanged() {
    if (_confirmedUid() != _owner) clear();
  }

  @override
  Future<void> close() {
    _identity.removeListener(_ownerChanged);
    return super.close();
  }

  static const _action = 'gateway';
  bool get available =>
      _owner != null && _confirmedUid() == _owner && _access.available;

  Future<void> interpret(
    String mealId,
    String photoRef,
    String locale, {
    required bool consent,
  }) => _run(
    (request) async => AiAssistanceState(
      meal: await _access.interpret(
        mealId: mealId,
        photoRef: photoRef,
        locale: locale,
        consent: consent,
        cancellation: request,
      ),
    ),
  );

  Future<void> coach(
    String message,
    String locale, {
    required bool includeGoals,
    required bool consent,
  }) => _run(
    (request) async => AiAssistanceState(
      reply: await _access.coach(
        message: message,
        locale: locale,
        includeGoals: includeGoals,
        consent: consent,
        cancellation: request,
      ),
    ),
  );

  void clear() {
    if (isClosed || state == const AiAssistanceState()) return;
    final cancellation = beginRequest(_action);
    finishRequest(_action, cancellation);
    emit(const AiAssistanceState());
  }

  Future<void> _run(
    Future<AiAssistanceState> Function(RequestCancellation) operation,
  ) async {
    if (isClosed || state.busy || !available) return;
    final request = beginRequest(_action);
    emit(const AiAssistanceState(busy: true));
    try {
      final result = await operation(request);
      if (isCurrentRequest(_action, request)) emit(result);
    } catch (error) {
      if (isCurrentRequest(_action, request)) {
        emit(
          AiAssistanceState(
            failure: error is AiFailure ? error : AiFailure.unavailable,
          ),
        );
      }
    } finally {
      finishRequest(_action, request);
    }
  }
}
