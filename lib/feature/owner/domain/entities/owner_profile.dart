import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/time/owner_calendar.dart';

part 'owner_profile.freezed.dart';

@freezed
abstract class OwnerProfile with _$OwnerProfile {
  const OwnerProfile._();

  const factory OwnerProfile({
    required int birthYear,
    required double heightCm,
    required double startingWeightKg,
    required double currentWeightKg,
    required String activity,
    required String windowStart,
    required String windowEnd,
    required String locale,
    required String timezone,
    required double weeklyBudgetJod,
    required int calories,
    required double proteinGrams,
    required double carbsGrams,
    required double fatGrams,
    required int waterMl,
    required int confirmationVersion,
    DateTime? updatedAt,
    DateTime? confirmedAt,
  }) = _OwnerProfile;

  static const currentConfirmationVersion = 1;

  bool get isConfirmed =>
      confirmationVersion == currentConfirmationVersion &&
      confirmedAt != null &&
      isComplete;

  bool get isComplete {
    final year = DateTime.now().year;
    return birthYear >= year - 125 &&
        birthYear <= year &&
        _bounded(heightCm, 50, 300) &&
        _bounded(startingWeightKg, 10, 700) &&
        _bounded(currentWeightKg, 10, 700) &&
        const {'veryLow', 'low', 'moderate', 'high'}.contains(activity) &&
        _time.hasMatch(windowStart) &&
        _time.hasMatch(windowEnd) &&
        const {'ar', 'en'}.contains(locale) &&
        timezone.length <= 100 &&
        OwnerCalendar.supports(timezone) &&
        _bounded(weeklyBudgetJod, 0, 100000) &&
        _bounded(calories, 1, 20000) &&
        _bounded(proteinGrams, 0, 5000) &&
        _bounded(carbsGrams, 0, 5000) &&
        _bounded(fatGrams, 0, 5000) &&
        _bounded(waterMl, 1, 30000);
  }

  static bool _bounded(num value, num min, num max) =>
      value.isFinite && value >= min && value <= max;

  static final _time = RegExp(r'^([01][0-9]|2[0-3]):[0-5][0-9]$');

  double get bmi => calculateBmi(currentWeightKg, heightCm);

  static double calculateBmi(double weightKg, double heightCm) {
    final heightMeters = heightCm / 100;
    return weightKg / (heightMeters * heightMeters);
  }
}

enum ProfileSync { cached, pending, confirmed }

@freezed
abstract class OwnerProfileSnapshot with _$OwnerProfileSnapshot {
  const factory OwnerProfileSnapshot({
    required ProfileSync sync,
    OwnerProfile? profile,
  }) = _OwnerProfileSnapshot;
}
