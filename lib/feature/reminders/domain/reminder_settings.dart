enum ReminderKind {
  water(7801),
  firstMeal(7802),
  lastMeal(7803),
  fasting(7804),
  weighIn(7805);

  const ReminderKind(this.notificationId);
  final int notificationId;
}

class ReminderSlot {
  const ReminderSlot({
    required this.hour,
    required this.minute,
    this.weekday,
    this.enabled = false,
  });

  final int hour;
  final int minute;
  final int? weekday;
  final bool enabled;

  ReminderSlot copyWith({
    int? hour,
    int? minute,
    int? weekday,
    bool? enabled,
  }) => ReminderSlot(
    hour: hour ?? this.hour,
    minute: minute ?? this.minute,
    weekday: weekday ?? this.weekday,
    enabled: enabled ?? this.enabled,
  );
}

class ReminderSettings {
  ReminderSettings(
    Map<ReminderKind, ReminderSlot> slots, {
    this.remoteEnabled = false,
  }) : slots = Map.unmodifiable(slots);

  final Map<ReminderKind, ReminderSlot> slots;
  final bool remoteEnabled;

  ReminderSettings update(ReminderKind kind, ReminderSlot slot) =>
      ReminderSettings({...slots, kind: slot}, remoteEnabled: remoteEnabled);

  ReminderSettings withRemote(bool enabled) =>
      ReminderSettings(slots, remoteEnabled: enabled);
}

class ReminderCopy {
  const ReminderCopy({
    required this.title,
    required this.body,
    required this.channel,
    required this.description,
  });

  final String title;
  final String body;
  final String channel;
  final String description;
}
