import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constant/routes.dart';
import '../../../core/widget/app_widget/app_text.dart';
import '../../../generated/app_strings.g.dart';
import '../domain/ai_assistance.dart';
import 'ai_assistance_cubit.dart';

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
              const _RequestStatus(),
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

class AiCoachPage extends StatefulWidget {
  const AiCoachPage({super.key});

  @override
  State<AiCoachPage> createState() => _AiCoachPageState();
}

class _AiCoachPageState extends State<AiCoachPage> {
  final _message = TextEditingController();
  bool _consent = false;
  bool _includeGoals = false;

  @override
  void dispose() {
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AiAssistanceCubit>();
    final state = cubit.state;
    final reply = state.reply;
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.ai_coach))),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            AppText(context.tr(LocaleKeys.ai_coachScope)),
            if (!cubit.available)
              AppText(context.tr(LocaleKeys.ai_unavailable))
            else ...[
              TextField(
                controller: _message,
                enabled: !state.busy,
                maxLength: 1200,
                minLines: 2,
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: context.tr(LocaleKeys.ai_question),
                ),
                onChanged: (_) => setState(() => _consent = false),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: AppText(context.tr(LocaleKeys.ai_shareGoals)),
                value: _includeGoals,
                onChanged: state.busy
                    ? null
                    : (value) => setState(() {
                        _includeGoals = value ?? false;
                        _consent = false;
                      }),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: AppText(context.tr(LocaleKeys.ai_messageConsent)),
                value: _consent,
                onChanged: state.busy
                    ? null
                    : (value) => setState(() => _consent = value ?? false),
              ),
              FilledButton(
                onPressed:
                    !state.busy && _consent && _message.text.trim().isNotEmpty
                    ? () {
                        setState(() => _consent = false);
                        cubit.coach(
                          _message.text,
                          context.locale.languageCode,
                          includeGoals: _includeGoals,
                          consent: true,
                        );
                      }
                    : null,
                child: AppText(context.tr(LocaleKeys.ai_send)),
              ),
              const _RequestStatus(),
              if (reply != null) ...[
                for (final guidance in reply.guidance)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: AppText(guidance),
                  ),
                for (final question in reply.questions) AppText(question),
                TextButton(
                  onPressed: () => context.push(AppRoutes.profile),
                  child: AppText(context.tr(LocaleKeys.ai_reviewGoals)),
                ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}

class _RequestStatus extends StatelessWidget {
  const _RequestStatus();

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AiAssistanceCubit>();
    if (cubit.state.busy) {
      return Column(
        children: [
          const LinearProgressIndicator(),
          TextButton(
            onPressed: cubit.clear,
            child: AppText(context.tr(LocaleKeys.common_cancel)),
          ),
        ],
      );
    }
    final failure = cubit.state.failure;
    if (failure == null) return const SizedBox.shrink();
    return AppText(
      context.tr(switch (failure) {
        AiFailure.unavailable => LocaleKeys.ai_unavailable,
        AiFailure.limited => LocaleKeys.ai_limitReached,
        AiFailure.connection => LocaleKeys.ai_connection,
      }),
    );
  }
}
