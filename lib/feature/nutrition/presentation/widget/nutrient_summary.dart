import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/entities/nutrition.dart';

class NutrientSummary extends StatelessWidget {
  const NutrientSummary(this.nutrients, {super.key});

  final Nutrients nutrients;

  @override
  Widget build(BuildContext context) {
    final format = NumberFormat('0.0', context.locale.toString());
    String amount(double? number) => number == null
        ? context.tr(LocaleKeys.nutrition_unknown)
        : format.format(number);
    final energy = nutrients.kcal ?? nutrients.calculatedKcal;
    final energyKey = nutrients.kcal == null && energy != null
        ? LocaleKeys.nutrition_estimatedEnergy
        : LocaleKeys.nutrition_energyAmount;
    return Wrap(
      spacing: 12,
      runSpacing: 4,
      children: [
        AppText(context.tr(energyKey, args: [amount(energy)])),
        AppText(
          context.tr(
            LocaleKeys.nutrition_proteinAmount,
            args: [amount(nutrients.protein)],
          ),
        ),
        AppText(
          context.tr(
            LocaleKeys.nutrition_netCarbsAmount,
            args: [amount(nutrients.netCarbs)],
          ),
        ),
        AppText(
          context.tr(
            LocaleKeys.nutrition_fatAmount,
            args: [amount(nutrients.fat)],
          ),
        ),
      ],
    );
  }
}
