import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/time/owner_calendar.dart';
import '../entities/progress.dart';

enum ProgressError { denied, invalid, connection, unexpected }

class ProgressFailure extends Failure {
  ProgressFailure(this.error) : super(message: error.name);
  final ProgressError error;
}

abstract interface class ProgressRepository {
  Stream<Either<ProgressFailure, WeightHistory>> watchWeights(String uid);
  Future<Either<ProgressFailure, WeightEntry>> saveWeight(
    String uid,
    WeightEntry entry,
  );
  Future<Either<ProgressFailure, WeightEntry>> deleteWeight(
    String uid,
    WeightEntry entry,
  );
  Future<Either<ProgressFailure, WeeklyReport>> loadWeek(
    String uid,
    OwnerCalendar calendar,
    DateTime end,
    int waterGoal,
  );
}
