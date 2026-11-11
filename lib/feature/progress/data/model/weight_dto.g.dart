// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weight_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeightDto _$WeightDtoFromJson(Map<String, dynamic> json) => _WeightDto(
  id: json['id'] as String,
  kg: (json['kg'] as num).toDouble(),
  measuredAt: DateTime.parse(json['measuredAt'] as String),
  timezone: json['timezone'] as String,
  notes: json['notes'] as String?,
  deleted: json['deleted'] as bool? ?? false,
);

Map<String, dynamic> _$WeightDtoToJson(_WeightDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kg': instance.kg,
      'measuredAt': instance.measuredAt.toIso8601String(),
      'timezone': instance.timezone,
      'notes': instance.notes,
      'deleted': instance.deleted,
    };
