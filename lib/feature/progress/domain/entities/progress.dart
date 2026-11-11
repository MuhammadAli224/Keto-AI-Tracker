import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/owner_calendar.dart';
import '../../../diary/domain/entities/meal_entry.dart';
import '../../../nutrition/domain/entities/nutrition.dart';
import '../../../wellness/domain/entities/wellness.dart';

part 'progress.freezed.dart';

@freezed
abstract class WeightEntry with _$WeightEntry {
  const factory WeightEntry({
    required String id,
    required double kg,
    required DateTime measuredAt,
    required String timezone,
    String? notes,
    @Default(false) bool deleted,
    @Default(WellnessSync.cached) WellnessSync sync,
  }) = _WeightEntry;
}

@freezed
abstract class WeightHistory with _$WeightHistory {
  const factory WeightHistory({
    required List<WeightEntry> entries,
    required WellnessSync sync,
  }) = _WeightHistory;
}

@freezed
abstract class WeeklyReport with _$WeeklyReport {
  const factory WeeklyReport({
    required DateTime firstDay,
    required DateTime lastDay,
    required int mealDays,
    required int waterDays,
    required int fastingSessions,
    required Duration fastingTime,
    required WellnessSync sync,
    required int energyDays,
    required int proteinDays,
    required int carbDays,
    double? averageKcal,
    double? averageProtein,
    double? averageNetCarbs,
    int? waterGoalDays,
    double? weightChangeKg,
  }) = _WeeklyReport;
}

WeeklyReport summarizeWeek({
  required DateTime firstDay,
  required DateTime lastDay,
  required OwnerCalendar calendar,
  required Iterable<MealEntry> meals,
  required Iterable<WaterEntry> water,
  required Iterable<FastSession> fasts,
  required Iterable<WeightEntry> weights,
  required int waterGoal,
  required WellnessSync sync,
}) {
  final confirmed = <String, List<MealEntry>>{};
  for (final meal in meals.where(
    (item) => item.status == MealStatus.confirmed,
  )) {
    (confirmed[meal.dayKey] ??= []).add(meal);
  }
  final nutritionDays = confirmed.values
      .map((day) => totalDay(day.map((meal) => meal.servings)))
      .toList();
  final energy = nutritionDays.map((n) => n.kcal).whereType<double>().toList();
  final protein = nutritionDays
      .map((n) => n.protein)
      .whereType<double>()
      .toList();
  final carbs = nutritionDays
      .map((n) => n.netCarbs)
      .whereType<double>()
      .toList();
  double? average(List<double> values) => values.isEmpty
      ? null
      : values.fold<double>(0, (sum, value) => sum + value) / values.length;

  final volumes = <String, int>{};
  for (final entry in water.where((item) => !item.deleted)) {
    volumes.update(
      entry.dayKey,
      (ml) => ml + entry.ml,
      ifAbsent: () => entry.ml,
    );
  }
  final completedFasts = fasts
      .where(
        (item) => item.status == FastStatus.ended && item.actualEndAt != null,
      )
      .toList();
  final fastingTime = completedFasts.fold(
    Duration.zero,
    (sum, session) => sum + session.elapsed(session.actualEndAt!),
  );
  final lastExclusive = lastDay.add(const Duration(days: 1));
  final weekWeights = weights.where((entry) {
    final day = calendar.date(entry.measuredAt);
    return !entry.deleted &&
        !day.isBefore(firstDay) &&
        day.isBefore(lastExclusive);
  }).toList()..sort(compareWeightEntries);
  final comparable =
      weekWeights.length >= 2 &&
      weekWeights.first.measuredAt != weekWeights.last.measuredAt;
  return WeeklyReport(
    firstDay: firstDay,
    lastDay: lastDay,
    mealDays: confirmed.length,
    averageKcal: average(energy),
    averageProtein: average(protein),
    averageNetCarbs: average(carbs),
    energyDays: energy.length,
    proteinDays: protein.length,
    carbDays: carbs.length,
    waterDays: volumes.length,
    waterGoalDays: waterGoal <= 0 || volumes.isEmpty
        ? null
        : volumes.values.where((ml) => ml >= waterGoal).length,
    fastingSessions: completedFasts.length,
    fastingTime: fastingTime,
    weightChangeKg: comparable
        ? weekWeights.last.kg - weekWeights.first.kg
        : null,
    sync: sync,
  );
}

int compareWeightEntries(WeightEntry a, WeightEntry b) {
  final time = a.measuredAt.compareTo(b.measuredAt);
  return time == 0 ? a.id.compareTo(b.id) : time;
}

/// Only a data-quality cue for a large observed change, not a clinical threshold.
bool largeRecentWeightChange(List<WeightEntry> newestFirst) {
  if (newestFirst.length < 2) return false;
  final latest = newestFirst.first;
  for (final earlier in newestFirst.skip(1)) {
    final hours = latest.measuredAt.difference(earlier.measuredAt).inHours;
    if (hours < 72) continue;
    if (hours > 24 * 28) return false;
    return (latest.kg - earlier.kg).abs() * (24 * 7) / hours >= 2;
  }
  return false;
}
