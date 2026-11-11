// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nutrition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NutrientsDto _$NutrientsDtoFromJson(Map<String, dynamic> json) =>
    _NutrientsDto(
      kcal: (json['kcal'] as num?)?.toDouble(),
      protein: (json['protein'] as num?)?.toDouble(),
      carbs: (json['carbs'] as num?)?.toDouble(),
      fiber: (json['fiber'] as num?)?.toDouble(),
      fat: (json['fat'] as num?)?.toDouble(),
      carbBasis:
          $enumDecodeNullable(_$CarbBasisEnumMap, json['carbBasis']) ??
          CarbBasis.includesFiber,
    );

Map<String, dynamic> _$NutrientsDtoToJson(_NutrientsDto instance) =>
    <String, dynamic>{
      'kcal': instance.kcal,
      'protein': instance.protein,
      'carbs': instance.carbs,
      'fiber': instance.fiber,
      'fat': instance.fat,
      'carbBasis': _$CarbBasisEnumMap[instance.carbBasis]!,
    };

const _$CarbBasisEnumMap = {
  CarbBasis.includesFiber: 'includesFiber',
  CarbBasis.excludesFiber: 'excludesFiber',
};

_ServingDto _$ServingDtoFromJson(Map<String, dynamic> json) => _ServingDto(
  foodId: json['foodId'] as String,
  name: json['name'] as String,
  edibleGrams: (json['edibleGrams'] as num).toDouble(),
  nutrients: NutrientsDto.fromJson(json['nutrients'] as Map<String, dynamic>),
  source: $enumDecode(_$NutritionSourceEnumMap, json['source']),
  sourceReference: json['sourceReference'] as String?,
);

Map<String, dynamic> _$ServingDtoToJson(_ServingDto instance) =>
    <String, dynamic>{
      'foodId': instance.foodId,
      'name': instance.name,
      'edibleGrams': instance.edibleGrams,
      'nutrients': instance.nutrients.toJson(),
      'source': _$NutritionSourceEnumMap[instance.source]!,
      'sourceReference': instance.sourceReference,
    };

const _$NutritionSourceEnumMap = {
  NutritionSource.usda: 'usda',
  NutritionSource.label: 'label',
  NutritionSource.manual: 'manual',
  NutritionSource.recipe: 'recipe',
};

_RecipeDto _$RecipeDtoFromJson(Map<String, dynamic> json) => _RecipeDto(
  yieldGrams: (json['yieldGrams'] as num).toDouble(),
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => ServingDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecipeDtoToJson(_RecipeDto instance) =>
    <String, dynamic>{
      'yieldGrams': instance.yieldGrams,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
    };

_FoodDto _$FoodDtoFromJson(Map<String, dynamic> json) => _FoodDto(
  id: json['id'] as String,
  name: json['name'] as String,
  source: $enumDecode(_$NutritionSourceEnumMap, json['source']),
  per100g: NutrientsDto.fromJson(json['per100g'] as Map<String, dynamic>),
  sourceReference: json['sourceReference'] as String?,
  recipe: json['recipe'] == null
      ? null
      : RecipeDto.fromJson(json['recipe'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FoodDtoToJson(_FoodDto instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'source': _$NutritionSourceEnumMap[instance.source]!,
  'per100g': instance.per100g.toJson(),
  'sourceReference': instance.sourceReference,
  'recipe': instance.recipe?.toJson(),
};
