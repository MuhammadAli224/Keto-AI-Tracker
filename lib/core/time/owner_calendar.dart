import 'package:timezone/timezone.dart' as tz;

class OwnerCalendar {
  const OwnerCalendar(this.zone);

  final String zone;

  static bool supports(String name) =>
      (name == 'UTC' || name.contains('/')) &&
      tz.timeZoneDatabase.locations.containsKey(name);

  tz.Location get _location => tz.getLocation(zone);

  DateTime local(DateTime time) => tz.TZDateTime.from(time, _location);

  DateTime date(DateTime instant) {
    final wall = local(instant);
    return DateTime.utc(wall.year, wall.month, wall.day);
  }

  DateTime instant(DateTime day, int hour, int minute) => tz.TZDateTime(
    _location,
    day.year,
    day.month,
    day.day,
    hour,
    minute,
  ).toUtc();

  String dayKey(DateTime day) =>
      '${day.year.toString().padLeft(4, '0')}-'
      '${day.month.toString().padLeft(2, '0')}-'
      '${day.day.toString().padLeft(2, '0')}';
}
