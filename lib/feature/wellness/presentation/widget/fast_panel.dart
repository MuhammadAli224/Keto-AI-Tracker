import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constant/routes.dart';
import '../../../../core/time/owner_calendar.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/entities/wellness.dart';
import '../cubit/wellness/wellness_cubit.dart';
import 'fast_elapsed.dart';
import 'wellness_amount_dialog.dart';
import 'wellness_text.dart';

class FastPanel extends StatelessWidget {
  const FastPanel({
    super.key,
    required this.state,
    required this.windowStart,
    required this.windowEnd,
  });

  final WellnessState state;
  final String windowStart;
  final String windowEnd;

  double get _suggestedHours {
    int minutes(String value) {
      final parts = value.split(':');
      return int.parse(parts[0]) * 60 + int.parse(parts[1]);
    }

    final eating = (minutes(windowEnd) - minutes(windowStart)) % (24 * 60);
    return eating == 0 ? 17 : (24 * 60 - eating) / 60;
  }

  void _showSafety(BuildContext context) => showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: AppText(context.tr(LocaleKeys.wellness_unwell)),
      content: AppText(context.tr(LocaleKeys.wellness_safety)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: AppText(context.tr(LocaleKeys.common_close)),
        ),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WellnessCubit>();
    final fast = state.fast;
    if (state.fastError case final error?) {
      return Column(
        children: [
          AppText(context.tr(wellnessErrorKey(error))),
          TextButton(
            onPressed: cubit.refreshFast,
            child: AppText(context.tr(LocaleKeys.common_retry)),
          ),
        ],
      );
    }
    if (fast == null) return const Center(child: CircularProgressIndicator());
    final session = fast.session;
    final active = session?.status == FastStatus.active;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(context.tr(wellnessSyncKey(fast.sync))),
        if (session != null) ...[
          FastElapsed(session: session),
          if (active)
            AppText(
              context.tr(
                LocaleKeys.wellness_plannedEnd,
                args: [
                  DateFormat.yMMMd(context.locale.toString()).add_Hm().format(
                    OwnerCalendar(session.timezone).local(session.plannedEndAt),
                  ),
                ],
              ),
            ),
          if (!active)
            AppText(
              context.tr(
                session.status == FastStatus.ended
                    ? LocaleKeys.wellness_ended
                    : LocaleKeys.wellness_cancelled,
              ),
            ),
        ],
        if (state.fastWriting) const LinearProgressIndicator(),
        if (active)
          Wrap(
            spacing: 8,
            children: [
              FilledButton(
                onPressed: state.fastWriting
                    ? null
                    : () => cubit.finishFast(FastStatus.ended),
                child: AppText(context.tr(LocaleKeys.wellness_endFast)),
              ),
              OutlinedButton(
                onPressed: state.fastWriting
                    ? null
                    : () => cubit.finishFast(FastStatus.cancelled),
                child: AppText(context.tr(LocaleKeys.wellness_cancelFast)),
              ),
              TextButton(
                onPressed: () => _showSafety(context),
                child: AppText(context.tr(LocaleKeys.wellness_unwell)),
              ),
            ],
          )
        else ...[
          AppText(
            context.tr(
              LocaleKeys.wellness_mealWindow,
              args: [windowStart, windowEnd],
            ),
          ),
          TextButton(
            onPressed: () => context.push(AppRoutes.profile),
            child: AppText(context.tr(LocaleKeys.wellness_editWindow)),
          ),
          FilledButton(
            onPressed: state.fastWriting
                ? null
                : () async {
                    final hours = await showDialog<double>(
                      context: context,
                      builder: (_) => WellnessAmountDialog(
                        title: LocaleKeys.wellness_startFast,
                        label: LocaleKeys.wellness_plannedHours,
                        maximum: 48,
                        suggestion: _suggestedHours,
                      ),
                    );
                    if (context.mounted && hours != null) {
                      await cubit.beginFast(
                        Duration(minutes: (hours * 60).round()),
                      );
                    }
                  },
            child: AppText(context.tr(LocaleKeys.wellness_startFast)),
          ),
        ],
      ],
    );
  }
}
