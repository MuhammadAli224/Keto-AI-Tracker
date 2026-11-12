// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MealDto _$MealDtoFromJson(Map<String, dynamic> json) => _MealDto(
  id: json['id'] as String,
  dayKey: json['dayKey'] as String,
  eatenAtUtc: DateTime.parse(json['eatenAtUtc'] as String),
  timezone: json['timezone'] as String,
  type: $enumDecode(_$MealTypeEnumMap, json['type']),
  status: $enumDecode(_$MealStatusEnumMap, json['status']),
  servings: (json['servings'] as List<dynamic>)
      .map((e) => ServingDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$MealDtoToJson(_MealDto instance) => <String, dynamic>{
  'id': instance.id,
  'dayKey': instance.dayKey,
  'eatenAtUtc': instance.eatenAtUtc.toIso8601String(),
  'timezone': instance.timezone,
  'type': _$MealTypeEnumMap[instance.type]!,
  'status': _$MealStatusEnumMap[instance.status]!,
  'servings': instance.servings.map((e) => e.toJson()).toList(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
};

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.lunch: 'lunch',
  MealType.dinner: 'dinner',
  MealType.snack: 'snack',
};

const _$MealStatusEnumMap = {
  MealStatus.draft: 'draft',
  MealStatus.confirmed: 'confirmed',
  MealStatus.deleted: 'deleted',
};
