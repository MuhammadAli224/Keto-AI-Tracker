import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../nutrition/data/model/nutrition_dto.dart';
import '../../../nutrition/domain/entities/nutrition.dart';
import '../../domain/entities/meal_entry.dart';
import 'meal_dto.auto_mappr.dart';

part 'meal_dto.freezed.dart';
part 'meal_dto.g.dart';

@freezed
abstract class MealDto with _$MealDto {
  @JsonSerializable(explicitToJson: true)
  const factory MealDto({
    required String id,
    required String dayKey,
    required DateTime eatenAtUtc,
    required String timezone,
    required MealType type,
    required MealStatus status,
    required List<ServingDto> servings,
    DateTime? updatedAt,
  }) = _MealDto;

  factory MealDto.fromJson(Map<String, dynamic> json) =>
      _$MealDtoFromJson(json);
}

@AutoMappr([
  MapType<MealDto, MealEntry>(reverse: true),
  MapType<NutrientsDto, Nutrients>(reverse: true),
  MapType<ServingDto, Serving>(reverse: true),
])
class MealMapper extends $MealMapper {}
