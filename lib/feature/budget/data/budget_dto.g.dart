// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FoodExpenseDto _$FoodExpenseDtoFromJson(Map<String, dynamic> json) =>
    _FoodExpenseDto(
      id: json['id'] as String,
      dayKey: json['dayKey'] as String,
      timezone: json['timezone'] as String,
      recordedAtUtc: DateTime.parse(json['recordedAtUtc'] as String),
      description: json['description'] as String,
      fils: (json['fils'] as num).toInt(),
    );

Map<String, dynamic> _$FoodExpenseDtoToJson(_FoodExpenseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dayKey': instance.dayKey,
      'timezone': instance.timezone,
      'recordedAtUtc': instance.recordedAtUtc.toIso8601String(),
      'description': instance.description,
      'fils': instance.fils,
    };

_FoodPriceDto _$FoodPriceDtoFromJson(Map<String, dynamic> json) =>
    _FoodPriceDto(
      foodId: json['foodId'] as String,
      filsPer100g: (json['filsPer100g'] as num).toInt(),
    );

Map<String, dynamic> _$FoodPriceDtoToJson(_FoodPriceDto instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'filsPer100g': instance.filsPer100g,
    };

_PlannedDayDto _$PlannedDayDtoFromJson(Map<String, dynamic> json) =>
    _PlannedDayDto(
      dayKey: json['dayKey'] as String,
      meals: json['meals'] as String,
    );

Map<String, dynamic> _$PlannedDayDtoToJson(_PlannedDayDto instance) =>
    <String, dynamic>{'dayKey': instance.dayKey, 'meals': instance.meals};
