import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/time/owner_calendar.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../../owner/domain/entities/owner_profile.dart';
import '../../domain/entities/progress.dart';
import 'weekly_report_panel.dart' show progressSyncKey;

class WeightMeasurementTile extends StatelessWidget {
  const WeightMeasurementTile({
    super.key,
    required this.entry,
    required this.heightCm,
    required this.onEdit,
    required this.onDelete,
  });

  final WeightEntry entry;
  final double heightCm;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final locale = context.locale.toString();
    final number = NumberFormat('0.0', locale);
    final bmi = OwnerProfile.calculateBmi(entry.kg, heightCm);
    return ListTile(
      title: AppText(
        context.tr(LocaleKeys.progress_kg, args: [number.format(entry.kg)]),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            DateFormat.yMMMd(locale).add_Hm().format(
              OwnerCalendar(entry.timezone).local(entry.measuredAt),
            ),
          ),
          AppText(
            context.tr(LocaleKeys.profile_bmi, args: [number.format(bmi)]),
          ),
          AppText(context.tr(progressSyncKey(entry.sync))),
          if (entry.notes case final notes?) AppText(notes),
        ],
      ),
      onTap: onEdit,
      trailing: IconButton(
        onPressed: onDelete,
        tooltip: context.tr(LocaleKeys.progress_deleteWeight),
        icon: const Icon(Icons.delete_outline),
      ),
    );
  }
}
