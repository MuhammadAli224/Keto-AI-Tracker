// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wellness_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WaterDto _$WaterDtoFromJson(Map<String, dynamic> json) => _WaterDto(
  id: json['id'] as String,
  ml: (json['ml'] as num).toInt(),
  recordedAt: DateTime.parse(json['recordedAt'] as String),
  dayKey: json['dayKey'] as String,
  timezone: json['timezone'] as String,
  deleted: json['deleted'] as bool? ?? false,
);

Map<String, dynamic> _$WaterDtoToJson(_WaterDto instance) => <String, dynamic>{
  'id': instance.id,
  'ml': instance.ml,
  'recordedAt': instance.recordedAt.toIso8601String(),
  'dayKey': instance.dayKey,
  'timezone': instance.timezone,
  'deleted': instance.deleted,
};

_FastDto _$FastDtoFromJson(Map<String, dynamic> json) => _FastDto(
  id: json['id'] as String,
  startedAt: DateTime.parse(json['startedAt'] as String),
  plannedEndAt: DateTime.parse(json['plannedEndAt'] as String),
  timezone: json['timezone'] as String,
  status: $enumDecode(_$FastStatusEnumMap, json['status']),
  actualEndAt: json['actualEndAt'] == null
      ? null
      : DateTime.parse(json['actualEndAt'] as String),
);

Map<String, dynamic> _$FastDtoToJson(_FastDto instance) => <String, dynamic>{
  'id': instance.id,
  'startedAt': instance.startedAt.toIso8601String(),
  'plannedEndAt': instance.plannedEndAt.toIso8601String(),
  'timezone': instance.timezone,
  'status': _$FastStatusEnumMap[instance.status]!,
  'actualEndAt': instance.actualEndAt?.toIso8601String(),
};

const _$FastStatusEnumMap = {
  FastStatus.active: 'active',
  FastStatus.ended: 'ended',
  FastStatus.cancelled: 'cancelled',
};
