import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/progress.dart';
import 'weight_dto.auto_mappr.dart';

part 'weight_dto.freezed.dart';
part 'weight_dto.g.dart';

@freezed
abstract class WeightDto with _$WeightDto {
  const WeightDto._();
  const factory WeightDto({
    required String id,
    required double kg,
    required DateTime measuredAt,
    required String timezone,
    String? notes,
    @Default(false) bool deleted,
  }) = _WeightDto;

  factory WeightDto.fromJson(Map<String, dynamic> json) =>
      _$WeightDtoFromJson(json);

  Map<String, dynamic> toFirestore() => {
    ...toJson(),
    'measuredAt': Timestamp.fromDate(measuredAt),
    'updatedAt': FieldValue.serverTimestamp(),
  };
}

@AutoMappr([MapType<WeightDto, WeightEntry>(reverse: true)])
class WeightMapper extends $WeightMapper {}
