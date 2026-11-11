import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widget/app_widget/app_text.dart';
import '../../../../../generated/app_strings.g.dart';
import '../../../../wellness/domain/entities/wellness.dart';
import '../../../domain/entities/progress.dart';

String progressSyncKey(WellnessSync sync) => switch (sync) {
  WellnessSync.cached => LocaleKeys.wellness_cached,
  WellnessSync.pending => LocaleKeys.wellness_pending,
  WellnessSync.synced => LocaleKeys.wellness_synced,
};

class WeeklyReportPanel extends StatelessWidget {
  const WeeklyReportPanel({super.key, required this.report});

  final WeeklyReport report;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final date = DateFormat.MMMd(locale);
    final number = NumberFormat('0.0', locale);
    String value(double? v) =>
        v == null ? context.tr(LocaleKeys.nutrition_unknown) : number.format(v);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          '${date.format(report.firstDay)} – ${date.format(report.lastDay)}',
        ),
        AppText(context.tr(progressSyncKey(report.sync))),
        AppText(
          context.tr(
            LocaleKeys.progress_mealDays,
            args: ['${report.mealDays}'],
          ),
        ),
        AppText(
          context.tr(
            LocaleKeys.progress_averageCalories,
            args: [value(report.averageKcal), '${report.energyDays}'],
          ),
        ),
        AppText(
          context.tr(
            LocaleKeys.progress_averageProtein,
            args: [value(report.averageProtein), '${report.proteinDays}'],
          ),
        ),
        AppText(
          context.tr(
            LocaleKeys.progress_averageCarbs,
            args: [value(report.averageNetCarbs), '${report.carbDays}'],
          ),
        ),
        AppText(
          context.tr(
            report.waterGoalDays == null
                ? LocaleKeys.progress_waterRecorded
                : LocaleKeys.progress_waterAdherence,
            args: [
              if (report.waterGoalDays != null) '${report.waterGoalDays}',
              '${report.waterDays}',
            ],
          ),
        ),
        AppText(
          context.tr(
            report.fastingSessions == 0
                ? LocaleKeys.progress_noFasts
                : LocaleKeys.progress_fasts,
            args: report.fastingSessions == 0
                ? []
                : [
                    '${report.fastingSessions}',
                    number.format(report.fastingTime.inMinutes / 60),
                  ],
          ),
        ),
        AppText(
          context.tr(
            LocaleKeys.progress_weightChange,
            args: [value(report.weightChangeKg)],
          ),
        ),
        const SizedBox(height: 8),
        AppText(context.tr(LocaleKeys.progress_gaps)),
      ],
    );
  }
}
