import '../../../domain/entities/nutrition.dart';
import '../../model/nutrition_dto.dart';

/// USDA Standard Reference Release 28, mean values per 100 g edible portion.
const usdaCatalog = [
  FoodDto(
    id: 'usda-01123',
    name: 'Egg, whole, raw, fresh',
    source: NutritionSource.usda,
    sourceReference: '01123',
    per100g: NutrientsDto(
      kcal: 143,
      protein: 12.56,
      carbs: 0.72,
      fiber: 0,
      fat: 9.51,
    ),
  ),
  FoodDto(
    id: 'usda-09037',
    name: 'Avocados, raw, all commercial varieties',
    source: NutritionSource.usda,
    sourceReference: '09037',
    per100g: NutrientsDto(
      kcal: 160,
      protein: 2,
      carbs: 8.53,
      fiber: 6.7,
      fat: 14.66,
    ),
  ),
  FoodDto(
    id: 'usda-11205',
    name: 'Cucumber, with peel, raw',
    source: NutritionSource.usda,
    sourceReference: '11205',
    per100g: NutrientsDto(
      kcal: 15,
      protein: 0.65,
      carbs: 3.63,
      fiber: 0.5,
      fat: 0.11,
    ),
  ),
];
