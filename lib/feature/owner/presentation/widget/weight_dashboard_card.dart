import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/routes.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../progress/presentation/cubit/progress/progress_cubit.dart';
import '../../../progress/presentation/widget/weight_chart.dart';
import '../../../progress/presentation/widget/weekly_report_panel.dart';
import '../../domain/entities/owner_profile.dart';
import 'dashboard_card.dart';
import 'dashboard_sync_label.dart';
import 'dashboard_retry.dart';

class WeightDashboardCard extends StatelessWidget {
  const WeightDashboardCard({super.key, required this.profile});

  final OwnerProfile profile;

  @override
  Widget build(BuildContext context) {
    final number = NumberFormat('0.0', context.locale.toString());
    return DashboardCard(
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
                return DashboardRetry(
                  onRetry: context.read<ProgressCubit>().loadWeights,
                );
              }
              final history = state.history;
              if (history == null) return const LinearProgressIndicator();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DashboardSyncLabel(progressSyncKey(history.sync)),
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
