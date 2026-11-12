import 'reminder_settings.dart';

enum RemoteRegistration { disabled, waiting, registered, unavailable }

class ReminderResult {
  const ReminderResult({
    required this.settings,
    required this.allowed,
    required this.remote,
    this.scheduleFailed = false,
  });

  final ReminderSettings settings;
  final bool allowed;
  final RemoteRegistration remote;
  final bool scheduleFailed;
}

abstract interface class ReminderAccess {
  Future<ReminderResult> load(ReminderSettings defaults, ReminderCopy copy);
  Future<ReminderResult> requestPermission(
    ReminderSettings defaults,
    ReminderCopy copy,
  );
  Future<ReminderResult> save(ReminderSettings settings, ReminderCopy copy);
  Future<void> openSystemSettings();
}
