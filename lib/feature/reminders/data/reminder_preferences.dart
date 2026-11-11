import 'dart:convert';

import 'package:hive_ce/hive.dart';

import '../domain/reminder_settings.dart';

class ReminderPreferences {
  const ReminderPreferences(this._box);

  final Box<dynamic> _box;
  static const _activeOwner = 'remindersActiveOwner';

  String? get activeOwner => _box.get(_activeOwner) as String?;

  Future<void> setActiveOwner(String? uid) =>
      uid == null ? _box.delete(_activeOwner) : _box.put(_activeOwner, uid);

  String _key(String uid) => 'reminders:${Uri.encodeComponent(uid)}';

  (ReminderSettings, ReminderCopy)? read(String uid) {
    final raw = _box.get(_key(uid));
    if (raw is! String) return null;
    try {
      final data = jsonDecode(raw) as Map<String, dynamic>;
      final slots = data['slots'] as Map<String, dynamic>;
      final copy = data['copy'] as Map<String, dynamic>;
      return (
        ReminderSettings({
          for (final kind in ReminderKind.values)
            kind: _decodeSlot(slots[kind.name] as Map<String, dynamic>, kind),
        }, remoteEnabled: data['remote'] == true),
        ReminderCopy(
          title: copy['title'] as String,
          body: copy['body'] as String,
          channel: copy['channel'] as String,
          description: copy['description'] as String,
        ),
      );
    } catch (_) {
      return null;
    }
  }

  ReminderSlot _decodeSlot(Map<String, dynamic> json, ReminderKind kind) {
    final hour = json['hour'] as int;
    final minute = json['minute'] as int;
    final weekday = json['weekday'] as int?;
    if (hour < 0 ||
        hour > 23 ||
        minute < 0 ||
        minute > 59 ||
        (kind == ReminderKind.weighIn &&
            (weekday == null || weekday < 1 || weekday > 7))) {
      throw const FormatException('Invalid schedule');
    }
    return ReminderSlot(
      hour: hour,
      minute: minute,
      weekday: weekday,
      enabled: json['enabled'] == true,
    );
  }

  Future<void> store(
    String uid,
    ReminderSettings settings,
    ReminderCopy copy,
  ) => _box.put(
    _key(uid),
    jsonEncode({
      'remote': settings.remoteEnabled,
      'slots': {
        for (final entry in settings.slots.entries)
          entry.key.name: {
            'hour': entry.value.hour,
            'minute': entry.value.minute,
            'weekday': entry.value.weekday,
            'enabled': entry.value.enabled,
          },
      },
      'copy': {
        'title': copy.title,
        'body': copy.body,
        'channel': copy.channel,
        'description': copy.description,
      },
    }),
  );
}
