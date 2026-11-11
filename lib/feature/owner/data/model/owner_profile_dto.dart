import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/owner_profile.dart';
import 'owner_profile_dto.auto_mappr.dart';

part 'owner_profile_dto.freezed.dart';
part 'owner_profile_dto.g.dart';

@freezed
abstract class OwnerProfileDto with _$OwnerProfileDto {
  const factory OwnerProfileDto({
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
    @Default(0) int confirmationVersion,
    DateTime? updatedAt,
  }) = _OwnerProfileDto;

  factory OwnerProfileDto.fromJson(Map<String, dynamic> json) =>
      _$OwnerProfileDtoFromJson(json);
}

@AutoMappr([
  MapType<OwnerProfileDto, OwnerProfile>(),
  MapType<OwnerProfile, OwnerProfileDto>(),
])
class OwnerProfileMapper extends $OwnerProfileMapper {}
