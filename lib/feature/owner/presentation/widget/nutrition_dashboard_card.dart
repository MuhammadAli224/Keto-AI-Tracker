import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/routes.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../diary/diary_barrel.dart';
import '../../domain/entities/owner_profile.dart';
import 'dashboard_card.dart';
import 'dashboard_goal.dart';
import 'dashboard_sync_label.dart';
import 'dashboard_retry.dart';

class NutritionDashboardCard extends StatelessWidget {
  const NutritionDashboardCard({super.key, required this.profile});

  final OwnerProfile profile;

  @override
  Widget build(BuildContext context) => DashboardCard(
    icon: Icons.restaurant_outlined,
    title: LocaleKeys.dashboard_nutrition,
    route: AppRoutes.diary,
    child: BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        final diary = context.read<DiaryCubit>();
        if (state is DiaryLoading) return const LinearProgressIndicator();
        if (state is DiaryFailed) {
          return DashboardRetry(onRetry: () => diary.selectDay(state.date));
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
            DashboardSyncLabel(switch (ready.day.sync) {
              DiarySync.cached => LocaleKeys.wellness_cached,
              DiarySync.pending => LocaleKeys.wellness_pending,
              DiarySync.confirmed => LocaleKeys.wellness_synced,
            }),
            DashboardGoal(
              label: LocaleKeys.dashboard_energy,
              amount: available ? totals.kcal : null,
              goal: profile.calories,
              unit: LocaleKeys.dashboard_kcal,
            ),
            DashboardGoal(
              label: LocaleKeys.dashboard_protein,
              amount: available ? totals.protein : null,
              goal: profile.proteinGrams,
              unit: LocaleKeys.dashboard_grams,
            ),
            DashboardGoal(
              label: LocaleKeys.dashboard_carbs,
              amount: available ? totals.netCarbs : null,
              goal: profile.carbsGrams,
              unit: LocaleKeys.dashboard_grams,
            ),
            DashboardGoal(
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
