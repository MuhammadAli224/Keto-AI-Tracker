import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/mixin/cubit_lifecycle_mixin.dart';
import '../../../../../core/time/owner_calendar.dart';
import '../../../domain/entities/wellness.dart';
import '../../../domain/repository/wellness_repository.dart';
import '../../../domain/usecases/wellness_access.dart';

part 'wellness_cubit.freezed.dart';

@freezed
abstract class WellnessState with _$WellnessState {
  const factory WellnessState({
    WaterDay? water,
    FastSnapshot? fast,
    WellnessError? waterError,
    WellnessError? fastError,
    WellnessError? writeError,
    @Default(false) bool fastWriting,
  }) = _WellnessState;
}

class WellnessCubit extends Cubit<WellnessState>
    with CubitLifecycleMixin<WellnessState> {
  WellnessCubit(this._access, this.calendar) : super(const WellnessState());

  final WellnessAccess _access;
  final OwnerCalendar calendar;
  StreamSubscription<Either<WellnessFailure, WaterDay>>? _water;
  StreamSubscription<Either<WellnessFailure, FastSnapshot>>? _fast;
  Timer? _dayTimer;
  String? _day;
  final _tapClock = Stopwatch()..start();
  (int, int)? _lastWaterTap;
  (String, FastStatus)? _expectedFast;

  void start() {
    if (isClosed) return;
    refreshWater();
    refreshFast();
    _dayTimer ??= Timer.periodic(const Duration(seconds: 30), (_) {
      if (_day != calendar.dayKey(calendar.date(DateTime.now()))) {
        refreshWater();
      }
    });
  }

  Future<void> refreshWater() async {
    if (isClosed) return;
    const key = 'water-listen';
    final request = beginRequest(key);
    final day = calendar.dayKey(calendar.date(DateTime.now()));
    _day = day;
    emit(state.copyWith(water: null, waterError: null));
    await _water?.cancel();
    if (!isCurrentRequest(key, request)) return;
    _water = _access.watchWater(day).listen((result) {
      if (!isCurrentRequest(key, request)) return;
      emit(
        result.fold(
          (failure) => state.copyWith(waterError: failure.error),
          (water) => state.copyWith(water: water, waterError: null),
        ),
      );
    }, onDone: () => finishRequest(key, request));
  }

  Future<void> refreshFast() async {
    if (isClosed) return;
    const key = 'fast-listen';
    final request = beginRequest(key);
    emit(state.copyWith(fast: null, fastError: null));
    await _fast?.cancel();
    if (!isCurrentRequest(key, request)) return;
    _fast = _access.watchFast().listen((result) {
      if (!isCurrentRequest(key, request)) return;
      emit(
        result.fold((failure) => state.copyWith(fastError: failure.error), (
          fast,
        ) {
          final session = fast.session;
          if (session != null &&
              _expectedFast == (session.id, session.status)) {
            _expectedFast = null;
          }
          return state.copyWith(
            fast: fast,
            fastError: null,
            fastWriting: _expectedFast != null,
          );
        }),
      );
    }, onDone: () => finishRequest(key, request));
  }

  Future<void> addWater(int ml) async {
    if (isClosed) return;
    final tick = _tapClock.elapsedMilliseconds;
    final lastTap = _lastWaterTap;
    if (lastTap != null && lastTap.$1 == ml && tick - lastTap.$2 < 550) return;
    _lastWaterTap = (ml, tick);
    final entry = _access.waterEntry(ml, DateTime.now(), calendar);
    if (entry.dayKey != _day) await refreshWater();
    await _write('water:${entry.id}', () => _access.addWater(entry));
  }

  Future<void> deleteWater(WaterEntry entry) =>
      _write('water:${entry.id}', () => _access.deleteWater(entry));

  Future<void> beginFast(Duration duration) async {
    final fast = state.fast;
    if (isClosed ||
        fast == null ||
        state.fastWriting ||
        fast.session?.status == FastStatus.active) {
      return;
    }
    await _saveFast(
      _access.startSession(duration, DateTime.now(), calendar.zone),
    );
  }

  Future<void> finishFast(FastStatus status) async {
    final session = state.fast?.session;
    if (isClosed ||
        state.fastWriting ||
        session == null ||
        session.status != FastStatus.active ||
        status == FastStatus.active) {
      return;
    }
    final now = DateTime.now().toUtc();
    await _saveFast(
      session.copyWith(
        status: status,
        actualEndAt: now.isBefore(session.startedAt) ? session.startedAt : now,
      ),
    );
  }

  Future<void> _saveFast(FastSession session) async {
    _expectedFast = (session.id, session.status);
    emit(state.copyWith(fastWriting: true));
    await _write(
      'fast',
      () => _access.saveFast(session),
      onFinish: () {
        _expectedFast = null;
        emit(state.copyWith(fastWriting: false));
      },
    );
  }

  Future<void> _write<T>(
    String key,
    Future<Either<WellnessFailure, T>> Function() operation, {
    void Function()? onFinish,
  }) async {
    if (isClosed) return;
    final request = beginRequest(key);
    emit(state.copyWith(writeError: null));
    try {
      final result = await operation();
      if (!isCurrentRequest(key, request)) return;
      result.fold(
        (failure) => emit(state.copyWith(writeError: failure.error)),
        (_) {},
      );
      onFinish?.call();
    } finally {
      finishRequest(key, request);
    }
  }

  @override
  Future<void> close() async {
    final closing = super.close();
    _dayTimer?.cancel();
    await Future.wait([
      if (_water != null) _water!.cancel(),
      if (_fast != null) _fast!.cancel(),
    ]);
    return closing;
  }
}
