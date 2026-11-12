import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/routes.dart';
import '../../../../core/time/owner_calendar.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../cubit/wellness/wellness_cubit.dart';
import 'wellness_amount_dialog.dart';
import 'wellness_text.dart';

class WaterPanel extends StatelessWidget {
  const WaterPanel({super.key, required this.state, required this.goal});

  final WellnessState state;
  final int goal;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WellnessCubit>();
    final day = state.water;
    final locale = context.locale.toString();
    final number = NumberFormat.decimalPattern(locale);
    String volume(int ml) =>
        context.tr(LocaleKeys.wellness_ml, args: [number.format(ml)]);
    if (state.waterError case final error?) {
      return Column(
        children: [
          AppText(context.tr(wellnessErrorKey(error))),
          TextButton(
            onPressed: cubit.refreshWater,
            child: AppText(context.tr(LocaleKeys.common_retry)),
          ),
        ],
      );
    }
    if (day == null) return const Center(child: CircularProgressIndicator());
    final entries = day.entries.where((entry) => !entry.deleted).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(context.tr(wellnessSyncKey(day.sync))),
        AppText(volume(day.totalMl), fontSize: 24, fontWeight: FontWeight.w700),
        if (goal > 0) ...[
          AppText(
            context.tr(
              LocaleKeys.wellness_waterTarget,
              args: [number.format(goal)],
            ),
          ),
          LinearProgressIndicator(value: (day.totalMl / goal).clamp(0.0, 1.0)),
        ] else
          AppText(context.tr(LocaleKeys.wellness_noWaterGoal)),
        TextButton(
          onPressed: () => context.push(AppRoutes.profile),
          child: AppText(context.tr(LocaleKeys.wellness_editWaterGoal)),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: [
            for (final preset in const [150, 250, 400, 500])
              OutlinedButton(
                onPressed: () => cubit.addWater(preset),
                child: AppText(volume(preset)),
              ),
            OutlinedButton(
              onPressed: () async {
                final amount = await showDialog<double>(
                  context: context,
                  builder: (_) => const WellnessAmountDialog(
                    title: LocaleKeys.wellness_customWater,
                    label: LocaleKeys.wellness_waterAmount,
                    maximum: 10000,
                    whole: true,
                  ),
                );
                if (context.mounted && amount != null) {
                  await cubit.addWater(amount.toInt());
                }
              },
              child: AppText(context.tr(LocaleKeys.wellness_customWater)),
            ),
          ],
        ),
        if (entries.isNotEmpty)
          TextButton(
            onPressed: () => cubit.deleteWater(entries.first),
            child: AppText(context.tr(LocaleKeys.wellness_undoWater)),
          ),
        for (final entry in entries)
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: AppText(volume(entry.ml)),
            subtitle: AppText(
              '${DateFormat.Hm(locale).format(OwnerCalendar(entry.timezone).local(entry.recordedAt))} · '
              '${context.tr(wellnessSyncKey(entry.sync))}',
            ),
            trailing: IconButton(
              onPressed: () => cubit.deleteWater(entry),
              tooltip: context.tr(LocaleKeys.common_delete),
              icon: const Icon(Icons.delete_outline),
            ),
          ),
      ],
    );
  }
}
