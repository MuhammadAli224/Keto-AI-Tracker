import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/constant/box_key.dart';
import '../../../core/services/notification/fcm.service.dart';
import '../../owner/owner_barrel.dart';
import '../data/awesome_reminder_scheduler.dart';
import '../data/reminder_coordinator.dart';
import '../data/reminder_preferences.dart';
import '../domain/reminder_settings.dart';
import '../presentation/cubit/reminders/reminder_cubit.dart';

void initReminderDI(GetIt getIt) {
  final identity = getIt<OwnerIdentity>();
  final fcm = FcmRegistration(FirebaseMessaging.instance);
  getIt.registerSingleton(fcm, dispose: (value) => value.dispose());
  final coordinator = ReminderCoordinator(
    ReminderPreferences(getIt<Box>(instanceName: BoxKey.appBox)),
    AwesomeReminderScheduler(AwesomeNotifications()),
    fcm,
  );
  void synchronize() {
    if (!identity.ready) return;
    coordinator.ownerChanged(
      identity.account?.uid,
      identity.confirmedProfile?.timezone,
    );
  }

  identity.addListener(synchronize);
  synchronize();
  getIt.registerSingleton(
    coordinator,
    dispose: (_) => identity.removeListener(synchronize),
  );
  getIt.registerFactoryParam<ReminderCubit, OwnerProfile, void>(
    (profile, _) => ReminderCubit(coordinator, _defaults(profile)),
  );
}

ReminderSettings _defaults(OwnerProfile profile) {
  ReminderSlot mealTime(String value) {
    final parts = value.split(':');
    return ReminderSlot(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  return ReminderSettings({
    ReminderKind.water: const ReminderSlot(hour: 10, minute: 0),
    ReminderKind.firstMeal: mealTime(profile.windowStart),
    ReminderKind.lastMeal: mealTime(profile.windowEnd),
    ReminderKind.fasting: mealTime(profile.windowEnd),
    ReminderKind.weighIn: const ReminderSlot(
      hour: 9,
      minute: 0,
      weekday: DateTime.monday,
    ),
  });
}
