import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../domain/entities/nutrition.dart';
import 'nutrition_text.dart';

class ServingDialog extends StatefulWidget {
  const ServingDialog({super.key, required this.food, this.select = false});

  final Food food;
  final bool select;

  @override
  State<ServingDialog> createState() => _ServingDialogState();
}

class _ServingDialogState extends State<ServingDialog> {
  double? _grams;

  @override
  Widget build(BuildContext context) {
    final name = foodDisplayName(context, widget.food);
    final grams = _grams;
    final reference = widget.food.sourceReference;
    final serving = Serving.validWeight(grams)
        ? widget.food.serve(grams!, displayName: name)
        : null;
    return AlertDialog(
      title: AppText(name),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(foodSourceLabel(context, widget.food)),
          if (widget.food.source != NutritionSource.usda && reference != null)
            AppText(reference),
          TextField(
            autofocus: true,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              labelText: context.tr(LocaleKeys.nutrition_edibleGrams),
              helperText: context.tr(LocaleKeys.nutrition_edibleHelp),
              helperMaxLines: 2,
            ),
            onChanged: (value) =>
                setState(() => _grams = parseNutritionAmount(value)),
          ),
          if (serving != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: NutrientSummary(serving.nutrients),
            ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: AppText(context.tr(LocaleKeys.common_close)),
        ),
        if (widget.select)
          FilledButton(
            onPressed: serving == null
                ? null
                : () => Navigator.pop(context, serving),
            child: AppText(context.tr(LocaleKeys.common_add)),
          ),
      ],
    );
  }
}
