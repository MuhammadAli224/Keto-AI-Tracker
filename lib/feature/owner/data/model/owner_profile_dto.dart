import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/owner_profile.dart';
import 'owner_profile_dto.auto_mappr.dart';

part 'owner_profile_dto.freezed.dart';
part 'owner_profile_dto.g.dart';

@freezed
abstract class OwnerProfileDto with _$OwnerProfileDto {
  const factory OwnerProfileDto({
    @Default(-1) int birthYear,
    @Default(-1) double heightCm,
    @Default(-1) double startingWeightKg,
    @Default(-1) double currentWeightKg,
    @Default('') String activity,
    @Default('') String windowStart,
    @Default('') String windowEnd,
    @Default('') String locale,
    @Default('') String timezone,
    @Default(-1) double weeklyBudgetJod,
    @Default(-1) int calories,
    @Default(-1) double proteinGrams,
    @Default(-1) double carbsGrams,
    @Default(-1) double fatGrams,
    @Default(-1) int waterMl,
    @Default(0) int confirmationVersion,
    DateTime? updatedAt,
    DateTime? confirmedAt,
  }) = _OwnerProfileDto;

  factory OwnerProfileDto.fromJson(Map<String, dynamic> json) =>
      _$OwnerProfileDtoFromJson(json);
}

@AutoMappr([
  MapType<OwnerProfileDto, OwnerProfile>(),
  MapType<OwnerProfile, OwnerProfileDto>(),
])
class OwnerProfileMapper extends $OwnerProfileMapper {}
