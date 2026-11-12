import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../../../generated/app_strings.g.dart';
import '../../domain/entities/nutrition.dart';

String foodDisplayName(BuildContext context, Food food) {
  final key = switch (food.id) {
    'usda-01123' => LocaleKeys.nutrition_usdaEgg,
    'usda-09037' => LocaleKeys.nutrition_usdaAvocado,
    'usda-11205' => LocaleKeys.nutrition_usdaCucumber,
    _ => null,
  };
  return key == null ? food.name : context.tr(key);
}

String foodSourceLabel(BuildContext context, Food food) {
  final reference = food.sourceReference;
  return switch (food.source) {
    NutritionSource.usda => context.tr(
      LocaleKeys.nutrition_usda,
      args: [reference ?? ''],
    ),
    NutritionSource.label => context.tr(LocaleKeys.nutrition_label),
    NutritionSource.manual => context.tr(LocaleKeys.nutrition_manual),
    NutritionSource.recipe => context.tr(LocaleKeys.nutrition_recipe),
  };
}

double? parseNutritionAmount(String input) {
  final normalized = input
      .trim()
      .replaceAllMapped(RegExp('[٠-٩۰-۹]'), (match) {
        final code = match[0]!.codeUnitAt(0);
        return (code >= 0x06f0 ? code - 0x06f0 : code - 0x0660).toString();
      })
      .replaceAll('٫', '.')
      .replaceAll(',', '.');
  final value = double.tryParse(normalized);
  return value != null && value.isFinite ? value : null;
}
