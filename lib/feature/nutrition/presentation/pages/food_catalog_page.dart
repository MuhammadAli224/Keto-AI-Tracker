import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/entities/nutrition.dart';
import '../../domain/repository/catalog_repository.dart';
import '../cubit/nutrition/catalog_cubit.dart';
import '../widget/manual_food_editor.dart';
import '../widget/nutrition_text.dart';
import '../widget/recipe_editor.dart';
import '../widget/serving_dialog.dart';

class FoodCatalogPage extends StatelessWidget {
  const FoodCatalogPage({super.key});

  Future<void> _edit(
    BuildContext context,
    CatalogReady state, {
    Food? food,
    bool recipe = false,
  }) async {
    final result = await Navigator.of(context).push<Food>(
      MaterialPageRoute(
        builder: (_) => recipe
            ? RecipeEditor(catalog: state.foods, food: food)
            : ManualFoodEditor(food: food),
      ),
    );
    if (!context.mounted || result == null) return;
    await context.read<CatalogCubit>().save(result);
  }

  String _errorKey(CatalogError error) => switch (error) {
    CatalogError.unavailable => LocaleKeys.common_forbidden,
    CatalogError.invalid => LocaleKeys.nutrition_invalidNutrition,
    CatalogError.localStorage => LocaleKeys.common_databaseError,
  };

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: AppText(context.tr(LocaleKeys.nutrition_catalog))),
    body: SafeArea(
      child: BlocBuilder<CatalogCubit, CatalogState>(
        builder: (context, state) => switch (state) {
          CatalogLoading() => const Center(child: CircularProgressIndicator()),
          CatalogLoadFailure(:final error) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppText(context.tr(_errorKey(error))),
                TextButton(
                  onPressed: context.read<CatalogCubit>().load,
                  child: AppText(context.tr(LocaleKeys.common_retry)),
                ),
              ],
            ),
          ),
          CatalogReady() => ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (state.saving) const LinearProgressIndicator(),
              if (state.saveError case final error?)
                AppText(context.tr(_errorKey(error))),
              Wrap(
                spacing: 8,
                children: [
                  FilledButton(
                    onPressed: state.saving
                        ? null
                        : () => _edit(context, state),
                    child: AppText(context.tr(LocaleKeys.nutrition_addFood)),
                  ),
                  OutlinedButton(
                    onPressed: state.saving
                        ? null
                        : () => _edit(context, state, recipe: true),
                    child: AppText(context.tr(LocaleKeys.nutrition_addRecipe)),
                  ),
                ],
              ),
              for (final food in state.foods)
                ListTile(
                  title: AppText(foodDisplayName(context, food)),
                  subtitle: AppText(foodSourceLabel(context, food)),
                  onTap: () => showDialog<void>(
                    context: context,
                    builder: (_) => ServingDialog(food: food),
                  ),
                  trailing: IconButton(
                    tooltip: context.tr(
                      food.source == NutritionSource.usda
                          ? LocaleKeys.nutrition_copyFood
                          : LocaleKeys.common_edit,
                    ),
                    icon: Icon(
                      food.source == NutritionSource.usda
                          ? Icons.content_copy_outlined
                          : Icons.edit_outlined,
                    ),
                    onPressed: state.saving
                        ? null
                        : () => _edit(
                            context,
                            state,
                            food: food,
                            recipe: food.source == NutritionSource.recipe,
                          ),
                  ),
                ),
            ],
          ),
        },
      ),
    ),
  );
}
