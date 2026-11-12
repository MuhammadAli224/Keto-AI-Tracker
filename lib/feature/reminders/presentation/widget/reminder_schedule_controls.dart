import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_style.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/reminder_settings.dart';

class ReminderScheduleControls extends StatelessWidget {
  const ReminderScheduleControls({
    super.key,
    required this.kind,
    required this.slot,
    required this.busy,
    required this.onChange,
    required this.onPickTime,
  });

  final ReminderKind kind;
  final ReminderSlot slot;
  final bool busy;
  final ValueChanged<ReminderSlot> onChange;
  final VoidCallback onPickTime;

  String _title(ReminderKind kind) => switch (kind) {
    ReminderKind.water => LocaleKeys.reminders_water,
    ReminderKind.firstMeal => LocaleKeys.reminders_firstMeal,
    ReminderKind.lastMeal => LocaleKeys.reminders_lastMeal,
    ReminderKind.fasting => LocaleKeys.reminders_fasting,
    ReminderKind.weighIn => LocaleKeys.reminders_weighIn,
  };

  @override
  Widget build(BuildContext context) {
    final dayName = DateFormat.EEEE(context.locale.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchListTile(
          title: AppText(
            context.tr(_title(kind)),
            style: AppTextStyle.style16B,
          ),
          value: slot.enabled,
          onChanged: busy
              ? null
              : (enabled) => onChange(slot.copyWith(enabled: enabled)),
        ),
        ListTile(
          title: AppText(
            TimeOfDay(hour: slot.hour, minute: slot.minute).format(context),
          ),
          trailing: const Icon(Icons.schedule_outlined),
          onTap: busy ? null : onPickTime,
        ),
        if (kind == ReminderKind.weighIn)
          DropdownButtonFormField<int>(
            key: ValueKey(slot.weekday),
            initialValue: slot.weekday,
            decoration: InputDecoration(
              labelText: context.tr(LocaleKeys.reminders_weekday),
            ),
            items: [
              for (var weekday = 1; weekday <= 7; weekday++)
                DropdownMenuItem(
                  value: weekday,
                  child: AppText(
                    dayName.format(DateTime.utc(2024, 1, weekday)),
                  ),
                ),
            ],
            onChanged: busy
                ? null
                : (weekday) {
                    if (weekday != null) {
                      onChange(slot.copyWith(weekday: weekday));
                    }
                  },
          ),
        const Divider(),
      ],
    );
  }
}
