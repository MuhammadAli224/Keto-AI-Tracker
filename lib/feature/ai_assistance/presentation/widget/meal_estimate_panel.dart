import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/ai_assistance.dart';
import '../cubit/ai_assistance/ai_assistance_cubit.dart';
import 'ai_request_status.dart';

class MealEstimatePanel extends StatelessWidget {
  const MealEstimatePanel({
    super.key,
    required this.mealId,
    required this.photoReady,
    required this.isCurrentPhoto,
    required this.onSelect,
  });

  final String mealId;
  final bool photoReady;
  final bool Function() isCurrentPhoto;
  final ValueChanged<double?>? onSelect;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AiAssistanceCubit>();
    final state = cubit.state;
    final meal = state.meal;
    final available = cubit.available;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!available || !photoReady)
              AppText(context.tr(LocaleKeys.ai_mealReview)),
            if (!available)
              AppText(context.tr(LocaleKeys.ai_unavailable))
            else if (!photoReady)
              AppText(context.tr(LocaleKeys.ai_uploadFirst))
            else ...[
              OutlinedButton(
                onPressed: state.busy
                    ? null
                    : () async {
                        final approved = await showDialog<bool>(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: AppText(
                              context.tr(LocaleKeys.ai_mealReview),
                            ),
                            content: AppText(
                              context.tr(LocaleKeys.ai_photoConsent),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context, false),
                                child: AppText(
                                  context.tr(LocaleKeys.common_cancel),
                                ),
                              ),
                              FilledButton(
                                onPressed: () => Navigator.pop(context, true),
                                child: AppText(context.tr(LocaleKeys.ai_send)),
                              ),
                            ],
                          ),
                        );
                        if (!context.mounted ||
                            approved != true ||
                            !isCurrentPhoto()) {
                          return;
                        }
                        await cubit.interpret(
                          mealId,
                          context.locale.languageCode,
                          consent: true,
                        );
                      },
                child: AppText(context.tr(LocaleKeys.ai_mealReview)),
              ),
              const AiRequestStatus(),
              if (meal != null) ...[
                AppText(context.tr(LocaleKeys.ai_estimateHelp)),
                if (meal.ingredients.isEmpty)
                  AppText(context.tr(LocaleKeys.ai_noIngredients)),
                for (final item in meal.ingredients)
                  ListTile(
                    title: AppText(item.name),
                    subtitle: AppText(
                      [
                        context.tr(switch (item.kind) {
                          AiIngredientKind.ingredient =>
                            LocaleKeys.ai_ingredient,
                          AiIngredientKind.sauce => LocaleKeys.ai_sauce,
                          AiIngredientKind.oil => LocaleKeys.ai_oil,
                        }),
                        context.tr(switch (item.uncertainty) {
                          AiUncertainty.low => LocaleKeys.ai_lowUncertainty,
                          AiUncertainty.medium =>
                            LocaleKeys.ai_mediumUncertainty,
                          AiUncertainty.high => LocaleKeys.ai_highUncertainty,
                        }),
                        if (item.grams != null)
                          context.tr(
                            LocaleKeys.nutrition_gramsAmount,
                            args: [
                              NumberFormat(
                                '0.#',
                                context.locale.toString(),
                              ).format(item.grams),
                            ],
                          ),
                      ].join(' · '),
                    ),
                    trailing: TextButton(
                      onPressed: onSelect == null
                          ? null
                          : () => onSelect!(item.grams),
                      child: AppText(context.tr(LocaleKeys.ai_matchFood)),
                    ),
                  ),
                for (final question in meal.questions) AppText(question),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
