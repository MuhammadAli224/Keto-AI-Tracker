import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../domain/reminder_access.dart';
import '../domain/reminder_settings.dart';

class ReminderState {
  const ReminderState({this.result, this.busy = false, this.failed = false});

  final ReminderResult? result;
  final bool busy;
  final bool failed;
}

class ReminderCubit extends Cubit<ReminderState>
    with CubitLifecycleMixin<ReminderState> {
  ReminderCubit(this._access, this.defaults) : super(const ReminderState());

  final ReminderAccess _access;
  final ReminderSettings defaults;
  static const _key = 'reminders';

  Future<void> load(ReminderCopy copy) =>
      _perform(() => _access.load(defaults, copy));

  Future<void> requestPermission(ReminderCopy copy) =>
      _perform(() => _access.requestPermission(defaults, copy));

  Future<void> save(ReminderSettings settings, ReminderCopy copy) =>
      _perform(() => _access.save(settings, copy));

  Future<void> openSystemSettings() async {
    try {
      await _access.openSystemSettings();
    } catch (_) {
      safeEmit(ReminderState(result: state.result, failed: true));
    }
  }

  Future<void> _perform(Future<ReminderResult> Function() action) async {
    if (isClosed || state.busy) return;
    final request = beginRequest(_key);
    final prior = state.result;
    emit(ReminderState(result: prior, busy: true));
    try {
      final result = await action();
      if (isCurrentRequest(_key, request)) emit(ReminderState(result: result));
    } catch (_) {
      if (isCurrentRequest(_key, request)) {
        emit(ReminderState(result: prior, failed: true));
      }
    } finally {
      finishRequest(_key, request);
    }
  }
}
