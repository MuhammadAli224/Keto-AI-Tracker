import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extension/space_extension.dart';
import '../../../../core/widget/app_widget/app_text.dart';
import '../../../../generated/app_strings.g.dart';
import '../../domain/reminder_access.dart';
import '../../domain/reminder_settings.dart';
import '../cubit/reminders/reminder_cubit.dart';
import '../widget/reminder_schedule_controls.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key, required this.timezone});
  final String timezone;

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage>
    with WidgetsBindingObserver {
  String? _language;

  ReminderCopy _copy(BuildContext context) => ReminderCopy(
    title: context.tr(LocaleKeys.app_name),
    body: context.tr(LocaleKeys.reminders_notificationBody),
    channel: context.tr(LocaleKeys.reminders_title),
    description: context.tr(LocaleKeys.reminders_channelDescription),
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final language = context.locale.languageCode;
    if (_language == language) return;
    _language = language;
    _reload();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && mounted) _reload();
  }

  void _reload() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<ReminderCubit>().load(_copy(context));
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _time(
    ReminderKind kind,
    ReminderSettings settings,
    ReminderSlot slot,
  ) async {
    final cubit = context.read<ReminderCubit>();
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: slot.hour, minute: slot.minute),
    );
    if (!mounted || picked == null) return;
    await cubit.save(
      settings.update(
        kind,
        slot.copyWith(hour: picked.hour, minute: picked.minute),
      ),
      _copy(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReminderCubit>();
    return Scaffold(
      appBar: AppBar(title: AppText(context.tr(LocaleKeys.reminders_title))),
      body: SafeArea(
        child: BlocBuilder<ReminderCubit, ReminderState>(
          builder: (context, state) {
            final result = state.result;
            final settings = result?.settings ?? cubit.defaults;
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                AppText(context.tr(LocaleKeys.reminders_permissionEducation)),
                AppText(context.tr(LocaleKeys.reminders_deliveryLimits)),
                8.gap,
                AppText(widget.timezone),
                if (state.busy) const LinearProgressIndicator(),
                if (state.failed || result?.scheduleFailed == true)
                  AppText(context.tr(LocaleKeys.reminders_scheduleFailed)),
                if (result?.allowed != true)
                  Wrap(
                    spacing: 8,
                    children: [
                      FilledButton(
                        onPressed: state.busy
                            ? null
                            : () => cubit.requestPermission(_copy(context)),
                        child: AppText(context.tr(LocaleKeys.reminders_allow)),
                      ),
                      TextButton(
                        onPressed: state.busy ? null : cubit.openSystemSettings,
                        child: AppText(
                          context.tr(LocaleKeys.reminders_systemSettings),
                        ),
                      ),
                    ],
                  ),
                for (final kind in ReminderKind.values)
                  ReminderScheduleControls(
                    kind: kind,
                    slot: settings.slots[kind]!,
                    busy: state.busy,
                    onChange: (slot) =>
                        cubit.save(settings.update(kind, slot), _copy(context)),
                    onPickTime: () =>
                        _time(kind, settings, settings.slots[kind]!),
                  ),
                SwitchListTile(
                  title: AppText(context.tr(LocaleKeys.reminders_remote)),
                  subtitle: AppText(
                    context.tr(switch (result?.remote) {
                      RemoteRegistration.registered =>
                        LocaleKeys.reminders_registered,
                      RemoteRegistration.waiting =>
                        LocaleKeys.reminders_waiting,
                      RemoteRegistration.unavailable =>
                        LocaleKeys.reminders_remoteUnavailable,
                      RemoteRegistration.disabled ||
                      null => LocaleKeys.reminders_remoteDescription,
                    }),
                  ),
                  value: settings.remoteEnabled,
                  onChanged: state.busy
                      ? null
                      : (value) => cubit.save(
                          settings.withRemote(value),
                          _copy(context),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
