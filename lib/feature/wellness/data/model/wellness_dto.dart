import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/wellness.dart';
import 'wellness_dto.auto_mappr.dart';

part 'wellness_dto.freezed.dart';
part 'wellness_dto.g.dart';

@freezed
abstract class WaterDto with _$WaterDto {
  const factory WaterDto({
    required String id,
    required int ml,
    required DateTime recordedAt,
    required String dayKey,
    required String timezone,
    @Default(false) bool deleted,
  }) = _WaterDto;

  factory WaterDto.fromJson(Map<String, dynamic> json) =>
      _$WaterDtoFromJson(json);
}

@freezed
abstract class FastDto with _$FastDto {
  const factory FastDto({
    required String id,
    required DateTime startedAt,
    required DateTime plannedEndAt,
    required String timezone,
    required FastStatus status,
    DateTime? actualEndAt,
  }) = _FastDto;

  factory FastDto.fromJson(Map<String, dynamic> json) =>
      _$FastDtoFromJson(json);
}

@AutoMappr([
  MapType<WaterDto, WaterEntry>(reverse: true),
  MapType<FastDto, FastSession>(reverse: true),
])
class WellnessMapper extends $WellnessMapper {}
