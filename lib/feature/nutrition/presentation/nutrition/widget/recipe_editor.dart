import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../domain/entities/nutrition.dart';
import 'nutrition_text.dart';
import 'serving_dialog.dart';

class RecipeEditor extends StatefulWidget {
  const RecipeEditor({super.key, required this.catalog, this.food});

  final List<Food> catalog;
  final Food? food;

  @override
  State<RecipeEditor> createState() => _RecipeEditorState();
}

class _RecipeEditorState extends State<RecipeEditor> {
  late final _name = TextEditingController(text: widget.food?.name);
  late final _yield = TextEditingController(
    text: widget.food?.recipe?.yieldGrams.toString(),
  );
  late final _ingredients = [...?widget.food?.recipe?.ingredients];
  bool _invalid = false;

  @override
  void dispose() {
    _name.dispose();
    _yield.dispose();
    super.dispose();
  }

  Future<void> _addIngredient() async {
    final food = await showModalBottomSheet<Food>(
      context: context,
      builder: (context) => SafeArea(
        child: ListView(
          children: [
            for (final food in widget.catalog)
              if (food.id != widget.food?.id)
                ListTile(
                  title: AppText(foodDisplayName(context, food)),
                  subtitle: AppText(foodSourceLabel(context, food)),
                  onTap: () => Navigator.pop(context, food),
                ),
          ],
        ),
      ),
    );
    if (!mounted || food == null) return;
    final serving = await showDialog<Serving>(
      context: context,
      builder: (_) => ServingDialog(food: food, select: true),
    );
    if (!mounted || serving == null) return;
    setState(() => _ingredients.add(serving));
  }

  void _save() {
    final yieldGrams = parseNutritionAmount(_yield.text);
    if (_name.text.trim().isEmpty || !Serving.validWeight(yieldGrams)) {
      setState(() => _invalid = true);
      return;
    }
    final recipe = Recipe(
      yieldGrams: yieldGrams!,
      ingredients: List.of(_ingredients),
    );
    try {
      Navigator.pop(
        context,
        Food(
          id:
              widget.food?.id ??
              'recipe-${DateTime.now().microsecondsSinceEpoch}',
          name: _name.text.trim(),
          source: NutritionSource.recipe,
          per100g: recipe.per100g(),
          recipe: recipe,
        ),
      );
    } on ArgumentError {
      setState(() => _invalid = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat('0.0', context.locale.toString());
    return Scaffold(
      appBar: AppBar(
        title: AppText(context.tr(LocaleKeys.nutrition_editRecipe)),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextField(
              controller: _name,
              maxLength: 120,
              decoration: InputDecoration(
                labelText: context.tr(LocaleKeys.nutrition_recipeName),
              ),
            ),
            TextField(
              controller: _yield,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: InputDecoration(
                labelText: context.tr(LocaleKeys.nutrition_yieldGrams),
              ),
            ),
            for (var index = 0; index < _ingredients.length; index++)
              ListTile(
                title: AppText(_ingredients[index].name),
                subtitle: AppText(
                  context.tr(
                    LocaleKeys.nutrition_gramsAmount,
                    args: [format.format(_ingredients[index].edibleGrams)],
                  ),
                ),
                trailing: IconButton(
                  tooltip: context.tr(LocaleKeys.common_delete),
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => setState(() => _ingredients.removeAt(index)),
                ),
              ),
            TextButton.icon(
              onPressed: _addIngredient,
              icon: const Icon(Icons.add),
              label: AppText(context.tr(LocaleKeys.nutrition_addIngredient)),
            ),
            if (_invalid)
              AppText(context.tr(LocaleKeys.nutrition_invalidRecipe)),
            FilledButton(
              onPressed: _save,
              child: AppText(context.tr(LocaleKeys.common_save)),
            ),
          ],
        ),
      ),
    );
  }
}
