import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/time/owner_calendar.dart';
import '../../../nutrition/domain/entities/nutrition.dart';
import '../entities/meal_entry.dart';
import '../repository/diary_repository.dart';

class DiaryAccess {
  const DiaryAccess(this._repository, this._confirmedOwner);

  final DiaryRepository _repository;
  final String? Function() _confirmedOwner;

  static final _idPattern = RegExp(
    r'^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$',
  );

  String newId() => const Uuid().v4();

  Stream<Either<DiaryFailure, DiaryDay>> watchDay(String dayKey) async* {
    final uid = _confirmedOwner();
    if (uid == null) {
      yield Left(DiaryFailure(DiaryError.denied));
      return;
    }
    await for (final result in _repository.watchDay(uid, dayKey)) {
      if (uid != _confirmedOwner()) return;
      yield result;
    }
  }

  Future<Either<DiaryFailure, MealEntry>> save(MealEntry meal) async {
    final uid = _confirmedOwner();
    if (uid == null) return Left(DiaryFailure(DiaryError.denied));
    if (!_valid(meal)) return Left(DiaryFailure(DiaryError.invalid));
    final result = await _repository.save(uid, meal);
    return uid == _confirmedOwner()
        ? result
        : Left(DiaryFailure(DiaryError.denied));
  }

  Future<Either<DiaryFailure, MealEntry>> delete(MealEntry meal) async {
    final uid = _confirmedOwner();
    if (uid == null) return Left(DiaryFailure(DiaryError.denied));
    if (!_idPattern.hasMatch(meal.id)) {
      return Left(DiaryFailure(DiaryError.invalid));
    }
    final result = await _repository.delete(uid, meal);
    return uid == _confirmedOwner()
        ? result
        : Left(DiaryFailure(DiaryError.denied));
  }

  bool _valid(MealEntry meal) {
    if (!OwnerCalendar.supports(meal.timezone) ||
        !_idPattern.hasMatch(meal.id) ||
        meal.status == MealStatus.deleted ||
        meal.servings.length > 50 ||
        (meal.status == MealStatus.confirmed && meal.servings.isEmpty)) {
      return false;
    }
    final calendar = OwnerCalendar(meal.timezone);
    return meal.dayKey == calendar.dayKey(calendar.date(meal.eatenAtUtc)) &&
        meal.servings.every((serving) {
          if (!Serving.validWeight(serving.edibleGrams) ||
              serving.name.trim().isEmpty) {
            return false;
          }
          final ratio = 100 / serving.edibleGrams;
          return ratio.isFinite && serving.nutrients.scaled(ratio).validPer100g;
        });
  }
}
