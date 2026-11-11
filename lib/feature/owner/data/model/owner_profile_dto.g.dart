// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'owner_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OwnerProfileDto _$OwnerProfileDtoFromJson(Map<String, dynamic> json) =>
    _OwnerProfileDto(
      birthYear: (json['birthYear'] as num).toInt(),
      heightCm: (json['heightCm'] as num).toDouble(),
      startingWeightKg: (json['startingWeightKg'] as num).toDouble(),
      currentWeightKg: (json['currentWeightKg'] as num).toDouble(),
      activity: json['activity'] as String,
      windowStart: json['windowStart'] as String,
      windowEnd: json['windowEnd'] as String,
      locale: json['locale'] as String,
      timezone: json['timezone'] as String,
      weeklyBudgetJod: (json['weeklyBudgetJod'] as num).toDouble(),
      calories: (json['calories'] as num).toInt(),
      proteinGrams: (json['proteinGrams'] as num).toDouble(),
      carbsGrams: (json['carbsGrams'] as num).toDouble(),
      fatGrams: (json['fatGrams'] as num).toDouble(),
      waterMl: (json['waterMl'] as num).toInt(),
      confirmationVersion: (json['confirmationVersion'] as num?)?.toInt() ?? 0,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$OwnerProfileDtoToJson(_OwnerProfileDto instance) =>
    <String, dynamic>{
      'birthYear': instance.birthYear,
      'heightCm': instance.heightCm,
      'startingWeightKg': instance.startingWeightKg,
      'currentWeightKg': instance.currentWeightKg,
      'activity': instance.activity,
      'windowStart': instance.windowStart,
      'windowEnd': instance.windowEnd,
      'locale': instance.locale,
      'timezone': instance.timezone,
      'weeklyBudgetJod': instance.weeklyBudgetJod,
      'calories': instance.calories,
      'proteinGrams': instance.proteinGrams,
      'carbsGrams': instance.carbsGrams,
      'fatGrams': instance.fatGrams,
      'waterMl': instance.waterMl,
      'confirmationVersion': instance.confirmationVersion,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
