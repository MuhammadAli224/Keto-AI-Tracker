import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/entities/nutrition.dart';
import 'nutrition_text.dart';

enum _Amount {
  kcal(LocaleKeys.nutrition_kcalField),
  protein(LocaleKeys.nutrition_proteinField),
  carbs(LocaleKeys.nutrition_carbsField),
  fiber(LocaleKeys.nutrition_fiberField),
  fat(LocaleKeys.nutrition_fatField);

  const _Amount(this.key);
  final String key;
}

class ManualFoodEditor extends StatefulWidget {
  const ManualFoodEditor({super.key, this.food});

  final Food? food;

  @override
  State<ManualFoodEditor> createState() => _ManualFoodEditorState();
}

class _ManualFoodEditorState extends State<ManualFoodEditor> {
  final _form = GlobalKey<FormState>();
  late final TextEditingController _name;
  late final TextEditingController _reference;
  late final Map<_Amount, TextEditingController> _amounts;
  late CarbBasis _basis;
  late NutritionSource _source;
  bool _invalid = false;

  @override
  void initState() {
    super.initState();
    final food = widget.food;
    final n = food?.per100g;
    _name = TextEditingController(text: food?.name);
    _reference = TextEditingController(
      text: food?.source == NutritionSource.usda ? null : food?.sourceReference,
    );
    _source = food?.source == NutritionSource.label
        ? NutritionSource.label
        : NutritionSource.manual;
    _basis = n?.carbBasis ?? CarbBasis.includesFiber;
    _amounts = {
      for (final entry in {
        _Amount.kcal: n?.kcal,
        _Amount.protein: n?.protein,
        _Amount.carbs: n?.carbs,
        _Amount.fiber: n?.fiber,
        _Amount.fat: n?.fat,
      }.entries)
        entry.key: TextEditingController(text: entry.value?.toString()),
    };
  }

  @override
  void dispose() {
    _name.dispose();
    _reference.dispose();
    for (final controller in _amounts.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _save() {
    if (!_form.currentState!.validate()) return;
    final invalidInput = _amounts.values.any(
      (controller) =>
          controller.text.trim().isNotEmpty &&
          parseNutritionAmount(controller.text) == null,
    );
    if (invalidInput) {
      setState(() => _invalid = true);
      return;
    }
    double? read(_Amount amount) =>
        parseNutritionAmount(_amounts[amount]!.text);
    final nutrients = Nutrients(
      kcal: read(_Amount.kcal),
      protein: read(_Amount.protein),
      carbs: read(_Amount.carbs),
      fiber: read(_Amount.fiber),
      fat: read(_Amount.fat),
      carbBasis: _basis,
    );
    if (!nutrients.hasValue || !nutrients.validPer100g) {
      setState(() => _invalid = true);
      return;
    }
    final food = widget.food;
    final id = food == null || food.source == NutritionSource.usda
        ? 'manual-${DateTime.now().microsecondsSinceEpoch}'
        : food.id;
    final reference = _reference.text.trim();
    Navigator.pop(
      context,
      Food(
        id: id,
        name: _name.text.trim(),
        source: _source,
        per100g: nutrients,
        sourceReference: reference.isEmpty ? null : reference,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: AppText(context.tr(LocaleKeys.nutrition_editFood))),
    body: SafeArea(
      child: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            AppText(context.tr(LocaleKeys.nutrition_per100g)),
            TextFormField(
              controller: _name,
              maxLength: 120,
              decoration: InputDecoration(
                labelText: context.tr(LocaleKeys.nutrition_foodName),
              ),
              validator: (value) => (value ?? '').trim().isEmpty
                  ? context.tr(LocaleKeys.common_emptyFieldHint)
                  : null,
            ),
            DropdownButtonFormField(
              initialValue: _source,
              items: [
                DropdownMenuItem(
                  value: NutritionSource.manual,
                  child: AppText(context.tr(LocaleKeys.nutrition_manual)),
                ),
                DropdownMenuItem(
                  value: NutritionSource.label,
                  child: AppText(context.tr(LocaleKeys.nutrition_label)),
                ),
              ],
              onChanged: (value) =>
                  setState(() => _source = value ?? NutritionSource.manual),
            ),
            TextFormField(
              controller: _reference,
              maxLength: 120,
              decoration: InputDecoration(
                labelText: context.tr(LocaleKeys.nutrition_reference),
              ),
            ),
            for (final entry in _amounts.entries)
              TextFormField(
                controller: entry.value,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  labelText: context.tr(entry.key.key),
                ),
                validator: (value) =>
                    (value ?? '').trim().isNotEmpty &&
                        parseNutritionAmount(value!) == null
                    ? context.tr(LocaleKeys.common_notValidNumberHint)
                    : null,
              ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: AppText(
                context.tr(LocaleKeys.nutrition_carbsIncludeFiber),
              ),
              value: _basis == CarbBasis.includesFiber,
              onChanged: (value) => setState(
                () => _basis = value
                    ? CarbBasis.includesFiber
                    : CarbBasis.excludesFiber,
              ),
            ),
            if (_invalid)
              AppText(context.tr(LocaleKeys.nutrition_invalidNutrition)),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _save,
              child: AppText(context.tr(LocaleKeys.common_save)),
            ),
          ],
        ),
      ),
    ),
  );
}
