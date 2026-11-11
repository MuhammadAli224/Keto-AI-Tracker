import 'package:freezed_annotation/freezed_annotation.dart';

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
  }) = _OwnerProfile;

  static const currentConfirmationVersion = 1;

  bool get isConfirmed => confirmationVersion == currentConfirmationVersion;

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
