import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../../../core/time/owner_calendar.dart';
import '../../../domain/entities/progress.dart';
import '../../../domain/repository/progress_repository.dart';
import '../../../domain/usecases/progress_access.dart';

part 'progress_cubit.freezed.dart';

@freezed
abstract class ProgressState with _$ProgressState {
  const factory ProgressState({
    WeightHistory? history,
    WeeklyReport? report,
    ProgressError? historyError,
    ProgressError? reportError,
    ProgressError? writeError,
    @Default(false) bool reportLoading,
  }) = _ProgressState;
}

class ProgressCubit extends Cubit<ProgressState>
    with CubitLifecycleMixin<ProgressState> {
  ProgressCubit(this._access, this.calendar) : super(const ProgressState());

  final ProgressAccess _access;
  final OwnerCalendar calendar;
  StreamSubscription<Either<ProgressFailure, WeightHistory>>? _weights;
  int? _waterGoal;

  String newId() => _access.newId();

  Future<void> loadWeights() async {
    if (isClosed) return;
    const key = 'weights';
    final request = beginRequest(key);
    emit(state.copyWith(historyError: null));
    await _weights?.cancel();
    if (!isCurrentRequest(key, request)) return;
    _weights = _access.watchWeights().listen((result) {
      if (!isCurrentRequest(key, request)) return;
      emit(
        result.fold(
          (failure) => state.copyWith(historyError: failure.error),
          (history) => state.copyWith(history: history, historyError: null),
        ),
      );
    }, onDone: () => finishRequest(key, request));
  }

  Future<void> loadReport(int waterGoal) async {
    if (isClosed) return;
    _waterGoal = waterGoal;
    const key = 'report';
    final request = beginRequest(key);
    emit(state.copyWith(reportLoading: true, reportError: null));
    try {
      final result = await _access.loadWeek(
        calendar,
        calendar.date(DateTime.now()),
        waterGoal,
      );
      if (!isCurrentRequest(key, request)) return;
      emit(
        result.fold(
          (failure) =>
              state.copyWith(reportLoading: false, reportError: failure.error),
          (report) => state.copyWith(report: report, reportLoading: false),
        ),
      );
    } finally {
      finishRequest(key, request);
    }
  }

  Future<void> save(WeightEntry entry) =>
      _write(entry.id, () => _access.saveWeight(entry));

  Future<void> delete(WeightEntry entry) =>
      _write(entry.id, () => _access.deleteWeight(entry));

  Future<void> _write(
    String id,
    Future<Either<ProgressFailure, WeightEntry>> Function() operation,
  ) async {
    if (isClosed) return;
    final key = 'write:$id';
    final request = beginRequest(key);
    emit(state.copyWith(writeError: null));
    try {
      final result = await operation();
      if (!isCurrentRequest(key, request)) return;
      result.fold(
        (failure) => emit(state.copyWith(writeError: failure.error)),
        (_) {
          final goal = _waterGoal;
          if (goal != null) unawaited(loadReport(goal));
        },
      );
    } finally {
      finishRequest(key, request);
    }
  }

  @override
  Future<void> close() async {
    final closing = super.close();
    await _weights?.cancel();
    return closing;
  }
}
