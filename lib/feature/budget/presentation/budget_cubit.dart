import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../core/time/owner_calendar.dart';
import '../domain/budget.dart';
import '../domain/budget_access.dart';

part 'budget_cubit.freezed.dart';

enum BudgetFeedback { editFailed }

enum ExportStatus { idle, saving, saved, failed }

@freezed
abstract class BudgetState with _$BudgetState {
  const factory BudgetState({
    required DateTime start,
    BudgetJournal? journal,
    @Default(false) bool busy,
    BudgetFeedback? feedback,
  }) = _BudgetState;
}

class BudgetCubit extends Cubit<BudgetState>
    with CubitLifecycleMixin<BudgetState> {
  BudgetCubit(this._access, this.calendar)
    : _uid = _access.ownerUid,
      super(BudgetState(start: weekStart(calendar.date(DateTime.now())))) {
    reload();
    _clock = Timer.periodic(const Duration(seconds: 30), (_) {
      if (!_followCurrent) return;
      final today = weekStart(calendar.date(DateTime.now()));
      if (state.start != today) safeEmit(state.copyWith(start: today));
    });
  }

  final BudgetAccess _access;
  final OwnerCalendar calendar;
  final String _uid;
  late final Timer _clock;
  bool _followCurrent = true;

  void reload() {
    if (isClosed) return;
    try {
      emit(state.copyWith(journal: _access.load(_uid), feedback: null));
    } catch (_) {
      emit(state.copyWith(feedback: BudgetFeedback.editFailed));
    }
  }

  void shiftWeek(int weeks) {
    final start = state.start.add(Duration(days: weeks * 7));
    _followCurrent = start == weekStart(calendar.date(DateTime.now()));
    safeEmit(state.copyWith(start: start));
  }

  Future<void> saveExpense({
    FoodExpense? previous,
    required DateTime day,
    required String description,
    required int fils,
  }) => _write(
    () => _access.saveExpense(
      _uid,
      FoodExpense(
        id: previous?.id ?? const Uuid().v4(),
        dayKey: calendar.dayKey(day),
        timezone: calendar.zone,
        recordedAtUtc: previous?.recordedAtUtc ?? DateTime.now().toUtc(),
        description: description.trim(),
        fils: fils,
      ),
    ),
  );

  Future<void> deleteExpense(FoodExpense entry) =>
      _write(() => _access.removeExpense(_uid, entry.id));

  Future<void> savePrice(String foodId, int? fils) =>
      _write(() => _access.savePrice(_uid, foodId, fils));

  Future<void> savePlan(DateTime day, String text) => _write(
    () => _access.savePlan(
      _uid,
      PlannedDay(dayKey: calendar.dayKey(day), meals: text.trim()),
    ),
  );

  Future<void> _write(Future<void> Function() operation) async {
    if (isClosed || state.busy) return;
    final request = beginRequest('write');
    emit(state.copyWith(busy: true, feedback: null));
    try {
      await operation();
      if (isCurrentRequest('write', request)) {
        emit(state.copyWith(busy: false, journal: _access.load(_uid)));
      }
    } catch (_) {
      if (isCurrentRequest('write', request)) {
        emit(state.copyWith(busy: false, feedback: BudgetFeedback.editFailed));
      }
    } finally {
      finishRequest('write', request);
    }
  }

  @override
  Future<void> close() {
    _clock.cancel();
    return super.close();
  }
}

class ExportCubit extends Cubit<ExportStatus>
    with CubitLifecycleMixin<ExportStatus> {
  ExportCubit(this._access) : _uid = _access.ownerUid, super(ExportStatus.idle);
  final BudgetAccess _access;
  final String _uid;
  bool get busy => state == ExportStatus.saving;

  Future<void> save({required bool consent}) async {
    if (isClosed || busy || !consent) return;
    final request = beginRequest('export');
    emit(ExportStatus.saving);
    var result = ExportStatus.idle;
    try {
      final saved = await _access.export(
        _uid,
        consent: consent,
        request: request,
      );
      if (saved) result = ExportStatus.saved;
    } catch (_) {
      result = ExportStatus.failed;
    } finally {
      if (isCurrentRequest('export', request)) emit(result);
      finishRequest('export', request);
    }
  }
}
