import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/nutrition.dart';
import 'nutrition_dto.auto_mappr.dart';

part 'nutrition_dto.freezed.dart';
part 'nutrition_dto.g.dart';

@freezed
abstract class NutrientsDto with _$NutrientsDto {
  const factory NutrientsDto({
    double? kcal,
    double? protein,
    double? carbs,
    double? fiber,
    double? fat,
    @Default(CarbBasis.includesFiber) CarbBasis carbBasis,
  }) = _NutrientsDto;

  factory NutrientsDto.fromJson(Map<String, dynamic> json) =>
      _$NutrientsDtoFromJson(json);
}

@freezed
abstract class ServingDto with _$ServingDto {
  @JsonSerializable(explicitToJson: true)
  const factory ServingDto({
    required String foodId,
    required String name,
    required double edibleGrams,
    required NutrientsDto nutrients,
    required NutritionSource source,
    String? sourceReference,
  }) = _ServingDto;

  factory ServingDto.fromJson(Map<String, dynamic> json) =>
      _$ServingDtoFromJson(json);
}

@freezed
abstract class RecipeDto with _$RecipeDto {
  @JsonSerializable(explicitToJson: true)
  const factory RecipeDto({
    required double yieldGrams,
    required List<ServingDto> ingredients,
  }) = _RecipeDto;

  factory RecipeDto.fromJson(Map<String, dynamic> json) =>
      _$RecipeDtoFromJson(json);
}

@freezed
abstract class FoodDto with _$FoodDto {
  @JsonSerializable(explicitToJson: true)
  const factory FoodDto({
    required String id,
    required String name,
    required NutritionSource source,
    required NutrientsDto per100g,
    String? sourceReference,
    RecipeDto? recipe,
  }) = _FoodDto;

  factory FoodDto.fromJson(Map<String, dynamic> json) =>
      _$FoodDtoFromJson(json);
}

@AutoMappr([
  MapType<NutrientsDto, Nutrients>(reverse: true),
  MapType<ServingDto, Serving>(reverse: true),
  MapType<RecipeDto, Recipe>(reverse: true),
  MapType<FoodDto, Food>(reverse: true),
])
class NutritionMapper extends $NutritionMapper {}
