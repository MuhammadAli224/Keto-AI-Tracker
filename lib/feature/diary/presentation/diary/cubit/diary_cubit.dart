import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../../../core/time/owner_calendar.dart';
import '../../../domain/entities/meal_entry.dart';
import '../../../domain/repository/diary_repository.dart';
import '../../../domain/usecases/diary_access.dart';

part 'diary_cubit.freezed.dart';

@freezed
sealed class DiaryState with _$DiaryState {
  const factory DiaryState.loading(DateTime date) = DiaryLoading;
  const factory DiaryState.failure(DateTime date, DiaryError error) =
      DiaryFailed;
  const factory DiaryState.ready(
    DateTime date,
    DiaryDay day, {
    @Default(false) bool awaitingWrites,
    DiaryError? writeError,
  }) = DiaryReady;
}

class DiaryCubit extends Cubit<DiaryState>
    with CubitLifecycleMixin<DiaryState> {
  DiaryCubit(this._access, this.calendar)
    : super(DiaryState.loading(calendar.date(DateTime.now())));

  final DiaryAccess _access;
  final OwnerCalendar calendar;
  StreamSubscription<Either<DiaryFailure, DiaryDay>>? _subscription;
  final _writes = <String>{};
  static const _watch = 'watch';

  String newId() => _access.newId();

  Future<void> selectDay(DateTime date) async {
    if (isClosed) return;
    final request = beginRequest(_watch);
    emit(DiaryState.loading(date));
    await _subscription?.cancel();
    if (!isCurrentRequest(_watch, request)) return;
    _subscription = _access.watchDay(calendar.dayKey(date)).listen((result) {
      if (!isCurrentRequest(_watch, request)) return;
      final previous = state;
      emit(
        result.fold(
          (failure) => DiaryState.failure(date, failure.error),
          (day) => DiaryState.ready(
            date,
            day,
            awaitingWrites: _writes.isNotEmpty,
            writeError: previous is DiaryReady ? previous.writeError : null,
          ),
        ),
      );
    }, onDone: () => finishRequest(_watch, request));
  }

  Future<void> save(MealEntry meal) =>
      _write(meal.id, () => _access.save(meal));

  Future<void> delete(MealEntry meal) =>
      _write(meal.id, () => _access.delete(meal));

  Future<void> _write(
    String id,
    Future<Either<DiaryFailure, MealEntry>> Function() operation,
  ) async {
    if (isClosed) return;
    final key = 'write:$id';
    final request = beginRequest(key);
    _writes.add(id);
    final before = state;
    if (before is DiaryReady) {
      emit(before.copyWith(awaitingWrites: true, writeError: null));
    }
    try {
      final result = await operation();
      if (!isCurrentRequest(key, request)) return;
      _writes.remove(id);
      final current = state;
      if (current is DiaryReady) {
        emit(
          current.copyWith(
            awaitingWrites: _writes.isNotEmpty,
            writeError: result.fold(
              (failure) => failure.error,
              (_) => current.writeError,
            ),
          ),
        );
      }
    } finally {
      finishRequest(key, request);
    }
  }

  @override
  Future<void> close() async {
    final closing = super.close();
    await _subscription?.cancel();
    return closing;
  }
}
