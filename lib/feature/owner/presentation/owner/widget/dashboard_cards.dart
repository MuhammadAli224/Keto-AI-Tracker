import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/routes.dart';
import '../../../../../core/extension/space_extension.dart';
import '../../../../../core/time/owner_calendar.dart';
import '../../../../../core/utils/text_style.dart';
import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../../diary/diary_barrel.dart';
import '../../../../progress/presentation/progress/cubit/progress_cubit.dart';
import '../../../../progress/presentation/progress/widget/weight_chart.dart';
import '../../../../progress/presentation/progress/widget/weekly_report_panel.dart';
import '../../../../wellness/domain/entities/wellness.dart';
import '../../../../wellness/presentation/wellness/cubit/wellness_cubit.dart';
import '../../../../wellness/presentation/wellness/widget/wellness_text.dart';
import '../../../domain/entities/owner_profile.dart';

class NutritionDashboardCard extends StatelessWidget {
  const NutritionDashboardCard({super.key, required this.profile});

  final OwnerProfile profile;

  @override
  Widget build(BuildContext context) => _DashboardCard(
    icon: Icons.restaurant_outlined,
    title: LocaleKeys.dashboard_nutrition,
    route: AppRoutes.diary,
    child: BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        final diary = context.read<DiaryCubit>();
        if (state is DiaryLoading) return const LinearProgressIndicator();
        if (state is DiaryFailed) {
          return _Retry(onRetry: () => diary.selectDay(state.date));
        }
        final ready = state as DiaryReady;
        final recorded = ready.day.entries.any(
          (meal) => meal.status == MealStatus.confirmed,
        );
        final available = recorded || ready.day.sync == DiarySync.confirmed;
        final totals = ready.day.totals;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _SyncLabel(switch (ready.day.sync) {
              DiarySync.cached => LocaleKeys.wellness_cached,
              DiarySync.pending => LocaleKeys.wellness_pending,
              DiarySync.confirmed => LocaleKeys.wellness_synced,
            }),
            _Goal(
              label: LocaleKeys.dashboard_energy,
              amount: available ? totals.kcal : null,
              goal: profile.calories,
              unit: LocaleKeys.dashboard_kcal,
            ),
            _Goal(
              label: LocaleKeys.dashboard_protein,
              amount: available ? totals.protein : null,
              goal: profile.proteinGrams,
              unit: LocaleKeys.dashboard_grams,
            ),
            _Goal(
              label: LocaleKeys.dashboard_carbs,
              amount: available ? totals.netCarbs : null,
              goal: profile.carbsGrams,
              unit: LocaleKeys.dashboard_grams,
            ),
            _Goal(
              label: LocaleKeys.dashboard_fat,
              amount: available ? totals.fat : null,
              goal: profile.fatGrams,
              unit: LocaleKeys.dashboard_grams,
            ),
          ],
        );
      },
    ),
  );
}

class WellnessDashboardCard extends StatelessWidget {
  const WellnessDashboardCard({super.key, required this.waterGoal});

  final int waterGoal;

  @override
  Widget build(BuildContext context) => _DashboardCard(
    icon: Icons.water_drop_outlined,
    title: LocaleKeys.wellness_title,
    route: AppRoutes.wellness,
    child: BlocBuilder<WellnessCubit, WellnessState>(
      builder: (context, state) {
        final cubit = context.read<WellnessCubit>();
        final water = state.water;
        final fast = state.fast;
        final fastSession = fast?.session;
        final hasWater =
            water != null &&
            (water.sync == WellnessSync.synced ||
                water.entries.any((entry) => !entry.deleted));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (state.waterError != null)
              _Retry(onRetry: cubit.refreshWater)
            else if (water == null)
              const LinearProgressIndicator()
            else ...[
              _SyncLabel(wellnessSyncKey(water.sync)),
              _Goal(
                label: LocaleKeys.wellness_water,
                amount: hasWater ? water.totalMl : null,
                goal: waterGoal == 0 ? null : waterGoal,
                unit: LocaleKeys.wellness_ml,
              ),
            ],
            10.gap,
            if (state.fastError != null)
              _Retry(onRetry: cubit.refreshFast)
            else if (fast == null)
              const LinearProgressIndicator()
            else ...[
              AppText(
                context.tr(switch (fastSession?.status) {
                  FastStatus.active => LocaleKeys.dashboard_fastActive,
                  FastStatus.ended => LocaleKeys.wellness_ended,
                  FastStatus.cancelled => LocaleKeys.wellness_cancelled,
                  null => LocaleKeys.dashboard_noFast,
                }),
                style: AppTextStyle.style16B,
              ),
              _SyncLabel(wellnessSyncKey(fast.sync)),
              if (fastSession?.status == FastStatus.active)
                AppText(
                  context.tr(
                    LocaleKeys.wellness_plannedEnd,
                    args: [
                      DateFormat.MMMd(
                        context.locale.toString(),
                      ).add_Hm().format(
                        OwnerCalendar(
                          fastSession!.timezone,
                        ).local(fastSession.plannedEndAt),
                      ),
                    ],
                  ),
                ),
            ],
          ],
        );
      },
    ),
  );
}

class WeightDashboardCard extends StatelessWidget {
  const WeightDashboardCard({super.key, required this.profile});

  final OwnerProfile profile;

  @override
  Widget build(BuildContext context) {
    final number = NumberFormat('0.0', context.locale.toString());
    return _DashboardCard(
      icon: Icons.monitor_weight_outlined,
      title: LocaleKeys.progress_title,
      route: AppRoutes.progress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppText(
            context.tr(
              LocaleKeys.dashboard_currentWeight,
              args: [number.format(profile.currentWeightKg)],
            ),
            style: AppTextStyle.style16B,
          ),
          AppText(
            context.tr(
              LocaleKeys.profile_bmi,
              args: [number.format(profile.bmi)],
            ),
          ),
          10.gap,
          BlocBuilder<ProgressCubit, ProgressState>(
            builder: (context, state) {
              if (state.historyError != null) {
                return _Retry(
                  onRetry: context.read<ProgressCubit>().loadWeights,
                );
              }
              final history = state.history;
              if (history == null) return const LinearProgressIndicator();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _SyncLabel(progressSyncKey(history.sync)),
                  WeightChart(
                    entries: history.entries,
                    calendar: context.read<ProgressCubit>().calendar,
                    baseline: profile.startingWeightKg,
                    weekly: false,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.route,
    required this.child,
  });

  final IconData icon;
  final String title;
  final String route;
  final Widget child;

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.zero,
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(icon, color: Theme.of(context).colorScheme.primary),
              10.gap,
              Expanded(
                child: AppText(context.tr(title), style: AppTextStyle.style18B),
              ),
              IconButton(
                tooltip: context.tr(title),
                onPressed: () => context.push(route),
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
          8.gap,
          child,
        ],
      ),
    ),
  );
}

class _Goal extends StatelessWidget {
  const _Goal({
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

class _SyncLabel extends StatelessWidget {
  const _SyncLabel(this.keyName);
  final String keyName;

  @override
  Widget build(BuildContext context) => AppText(
    context.tr(keyName),
    style: AppTextStyle.style12,
    color: Theme.of(context).colorScheme.onSurfaceVariant,
  );
}

class _Retry extends StatelessWidget {
  const _Retry({required this.onRetry});
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: AppText(context.tr(LocaleKeys.dashboard_unavailable))),
      TextButton(
        onPressed: onRetry,
        child: AppText(context.tr(LocaleKeys.common_retry)),
      ),
    ],
  );
}
