import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/time/owner_calendar.dart';
import '../entities/wellness.dart';
import '../repository/wellness_repository.dart';

class WellnessAccess {
  const WellnessAccess(this._repository, this._confirmedOwner);

  final WellnessRepository _repository;
  final String? Function() _confirmedOwner;

  Stream<Either<WellnessFailure, WaterDay>> watchWater(String day) =>
      _watch((uid) => _repository.watchWater(uid, day));

  Stream<Either<WellnessFailure, FastSnapshot>> watchFast() =>
      _watch(_repository.watchFast);

  WaterEntry waterEntry(int ml, DateTime now, OwnerCalendar calendar) =>
      WaterEntry(
        id: const Uuid().v4(),
        ml: ml,
        recordedAt: now.toUtc(),
        dayKey: calendar.dayKey(calendar.date(now)),
        timezone: calendar.zone,
      );

  FastSession startSession(Duration duration, DateTime now, String timezone) =>
      FastSession(
        id: const Uuid().v4(),
        startedAt: now.toUtc(),
        plannedEndAt: now.toUtc().add(duration),
        timezone: timezone,
        status: FastStatus.active,
      );

  Future<Either<WellnessFailure, WaterEntry>> addWater(WaterEntry entry) {
    if (entry.ml <= 0 || entry.ml > 10000) {
      return Future.value(Left(WellnessFailure(WellnessError.invalid)));
    }
    return _write((uid) => _repository.addWater(uid, entry));
  }

  Future<Either<WellnessFailure, WaterEntry>> deleteWater(WaterEntry entry) =>
      _write((uid) => _repository.deleteWater(uid, entry));

  Future<Either<WellnessFailure, FastSession>> saveFast(FastSession session) {
    final duration = session.plannedEndAt.difference(session.startedAt);
    if (duration <= Duration.zero ||
        duration > const Duration(hours: 48) ||
        (session.status == FastStatus.active) !=
            (session.actualEndAt == null) ||
        session.actualEndAt?.isBefore(session.startedAt) == true) {
      return Future.value(Left(WellnessFailure(WellnessError.invalid)));
    }
    return _write((uid) => _repository.saveFast(uid, session));
  }

  Stream<Either<WellnessFailure, T>> _watch<T>(
    Stream<Either<WellnessFailure, T>> Function(String uid) operation,
  ) async* {
    final uid = _confirmedOwner();
    if (uid == null) {
      yield Left(WellnessFailure(WellnessError.denied));
      return;
    }
    await for (final result in operation(uid)) {
      if (uid != _confirmedOwner()) return;
      yield result;
    }
  }

  Future<Either<WellnessFailure, T>> _write<T>(
    Future<Either<WellnessFailure, T>> Function(String uid) operation,
  ) async {
    final uid = _confirmedOwner();
    if (uid == null) return Left(WellnessFailure(WellnessError.denied));
    final result = await operation(uid);
    return uid == _confirmedOwner()
        ? result
        : Left(WellnessFailure(WellnessError.denied));
  }
}
