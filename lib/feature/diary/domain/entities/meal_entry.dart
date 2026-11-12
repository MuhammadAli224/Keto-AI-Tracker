import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../nutrition/domain/entities/nutrition.dart';

part 'meal_entry.freezed.dart';

enum MealType { breakfast, lunch, dinner, snack }

enum MealStatus { draft, confirmed, deleted }

enum DiarySync { cached, pending, confirmed }

@freezed
abstract class MealEntry with _$MealEntry {
  const MealEntry._();

  const factory MealEntry({
    required String id,
    required String dayKey,
    required DateTime eatenAtUtc,
    required String timezone,
    required MealType type,
    required MealStatus status,
    required List<Serving> servings,
    String? localImageRef,
    DateTime? updatedAt,
    @Default(DiarySync.cached) DiarySync sync,
  }) = _MealEntry;

  Nutrients get totals => totalMeal(servings);
}

@freezed
abstract class DiaryDay with _$DiaryDay {
  const DiaryDay._();

  const factory DiaryDay({
    required String dayKey,
    required List<MealEntry> entries,
    required DiarySync sync,
  }) = _DiaryDay;

  Nutrients get totals => totalDay(
    entries
        .where((meal) => meal.status == MealStatus.confirmed)
        .map((meal) => meal.servings),
  );
}
