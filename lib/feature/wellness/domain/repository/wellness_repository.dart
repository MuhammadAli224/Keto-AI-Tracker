import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/wellness.dart';

enum WellnessError { denied, invalid, connection, unexpected }

class WellnessFailure extends Failure {
  WellnessFailure(this.error) : super(message: error.name);
  final WellnessError error;
}

abstract interface class WellnessRepository {
  Stream<Either<WellnessFailure, WaterDay>> watchWater(String uid, String day);
  Stream<Either<WellnessFailure, FastSnapshot>> watchFast(String uid);
  Future<Either<WellnessFailure, WaterEntry>> addWater(
    String uid,
    WaterEntry entry,
  );
  Future<Either<WellnessFailure, WaterEntry>> deleteWater(
    String uid,
    WaterEntry entry,
  );
  Future<Either<WellnessFailure, FastSession>> saveFast(
    String uid,
    FastSession session,
  );
}
