import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';

class DashboardGoal extends StatelessWidget {
  const DashboardGoal({
    super.key,
    required this.label,
    required this.amount,
    required this.goal,
    required this.unit,
  });

  final String label;
  final num? amount;
  final num? goal;
  final String unit;

  @override
  Widget build(BuildContext context) {
    final number = NumberFormat('0.#', context.locale.toString());
    String format(num value) => context.tr(unit, args: [number.format(value)]);
    final current = amount;
    final target = goal;
    final display = current == null
        ? context.tr(LocaleKeys.nutrition_unknown)
        : format(current);
    final ratio = current == null || target == null || target <= 0
        ? null
        : (current / target).clamp(0.0, 1.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: AppText(context.tr(label), style: AppTextStyle.style14B),
              ),
              Flexible(
                child: AppText(
                  target == null
                      ? display
                      : context.tr(
                          LocaleKeys.dashboard_goalPair,
                          args: [display, format(target)],
                        ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          if (ratio != null) ...[5.gap, LinearProgressIndicator(value: ratio)],
        ],
      ),
    );
  }
}
