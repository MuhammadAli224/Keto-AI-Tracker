import 'package:awesome_notifications/awesome_notifications.dart';

import '../domain/reminder_settings.dart';

class AwesomeReminderScheduler {
  AwesomeReminderScheduler(this._notifications);

  final AwesomeNotifications _notifications;
  static const channelKey = 'local_reminders';
  bool _initialized = false;

  Future<void> configure(ReminderCopy copy) async {
    final channel = NotificationChannel(
      channelKey: channelKey,
      channelName: copy.channel,
      channelDescription: copy.description,
      importance: NotificationImportance.Default,
      defaultPrivacy: NotificationPrivacy.Private,
      channelShowBadge: false,
    );
    if (!_initialized) {
      _initialized = await _notifications.initialize(null, [channel]);
      if (!_initialized) throw StateError('Notification initialization failed');
    } else {
      await _notifications.setChannel(channel);
    }
  }

  Future<bool> isAllowed() => _notifications.isNotificationAllowed();

  Future<bool> requestPermission() =>
      _notifications.requestPermissionToSendNotifications(
        channelKey: channelKey,
        permissions: const [
          NotificationPermission.Alert,
          NotificationPermission.Sound,
        ],
      );

  Future<void> openSystemSettings() async {
    await _notifications.showNotificationConfigPage();
  }

  Future<void> cancelAll() async {
    for (final kind in ReminderKind.values) {
      await _notifications.cancel(kind.notificationId);
    }
  }

  Future<void> apply(
    ReminderSettings settings,
    ReminderCopy copy,
    String zone,
  ) async {
    for (final kind in ReminderKind.values) {
      final slot = settings.slots[kind];
      final id = kind.notificationId;
      if (slot == null || !slot.enabled) {
        await _notifications.cancel(id);
        continue;
      }
      final weekday = slot.weekday;
      final created = await _notifications.createNotification(
        content: NotificationContent(
          id: id,
          channelKey: channelKey,
          title: copy.title,
          body: copy.body,
        ),
        schedule: NotificationCalendar(
          hour: slot.hour,
          minute: slot.minute,
          second: 0,
          weekday: weekday == null ? null : weekday % 7 + 1,
          timeZone: zone,
          repeats: true,
          preciseAlarm: false,
          allowWhileIdle: false,
        ),
      );
      if (!created) throw StateError('Reminder could not be scheduled');
    }
  }
}
