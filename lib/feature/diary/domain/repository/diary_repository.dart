import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/meal_entry.dart';

enum DiaryError { denied, invalid, connection, unexpected }

class DiaryFailure extends Failure {
  DiaryFailure(this.error) : super(message: error.name);
  final DiaryError error;
}

abstract interface class DiaryRepository {
  Stream<Either<DiaryFailure, DiaryDay>> watchDay(String uid, String dayKey);

  Future<Either<DiaryFailure, MealEntry>> save(String uid, MealEntry meal);

  Future<Either<DiaryFailure, MealEntry>> delete(String uid, MealEntry meal);
}
