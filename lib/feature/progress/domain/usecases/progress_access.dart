import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/time/owner_calendar.dart';
import '../entities/progress.dart';
import '../repository/progress_repository.dart';

class ProgressAccess {
  const ProgressAccess(this._repository, this._confirmedOwner);

  final ProgressRepository _repository;
  final String? Function() _confirmedOwner;

  String newId() => const Uuid().v4();

  Stream<Either<ProgressFailure, WeightHistory>> watchWeights() async* {
    final uid = _confirmedOwner();
    if (uid == null) {
      yield Left(ProgressFailure(ProgressError.denied));
      return;
    }
    await for (final result in _repository.watchWeights(uid)) {
      if (uid != _confirmedOwner()) return;
      yield result;
    }
  }

  Future<Either<ProgressFailure, WeightEntry>> saveWeight(WeightEntry entry) {
    if (!entry.kg.isFinite ||
        entry.kg < 10 ||
        entry.kg > 700 ||
        (entry.notes?.length ?? 0) > 500 ||
        !OwnerCalendar.supports(entry.timezone)) {
      return Future.value(Left(ProgressFailure(ProgressError.invalid)));
    }
    return _perform((uid) => _repository.saveWeight(uid, entry));
  }

  Future<Either<ProgressFailure, WeightEntry>> deleteWeight(
    WeightEntry entry,
  ) => _perform((uid) => _repository.deleteWeight(uid, entry));

  Future<Either<ProgressFailure, WeeklyReport>> loadWeek(
    OwnerCalendar calendar,
    DateTime end,
    int waterGoal,
  ) => _perform((uid) => _repository.loadWeek(uid, calendar, end, waterGoal));

  Future<Either<ProgressFailure, T>> _perform<T>(
    Future<Either<ProgressFailure, T>> Function(String uid) operation,
  ) async {
    final uid = _confirmedOwner();
    if (uid == null) return Left(ProgressFailure(ProgressError.denied));
    final result = await operation(uid);
    return uid == _confirmedOwner()
        ? result
        : Left(ProgressFailure(ProgressError.denied));
  }
}
