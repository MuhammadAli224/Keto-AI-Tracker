import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/routes.dart';
import '../../../../core/extension/space_extension.dart';
import '../../../../core/time/owner_calendar.dart';
import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../wellness/domain/entities/wellness.dart';
import '../../../wellness/presentation/cubit/wellness/wellness_cubit.dart';
import '../../../wellness/presentation/widget/wellness_text.dart';
import 'dashboard_card.dart';
import 'dashboard_goal.dart';
import 'dashboard_sync_label.dart';
import 'dashboard_retry.dart';

class WellnessDashboardCard extends StatelessWidget {
  const WellnessDashboardCard({super.key, required this.waterGoal});

  final int waterGoal;

  @override
  Widget build(BuildContext context) => DashboardCard(
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
              DashboardRetry(onRetry: cubit.refreshWater)
            else if (water == null)
              const LinearProgressIndicator()
            else ...[
              DashboardSyncLabel(wellnessSyncKey(water.sync)),
              DashboardGoal(
                label: LocaleKeys.wellness_water,
                amount: hasWater ? water.totalMl : null,
                goal: waterGoal == 0 ? null : waterGoal,
                unit: LocaleKeys.wellness_ml,
              ),
            ],
            10.gap,
            if (state.fastError != null)
              DashboardRetry(onRetry: cubit.refreshFast)
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
              DashboardSyncLabel(wellnessSyncKey(fast.sync)),
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
