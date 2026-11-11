import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

import '../../firebase_options.dart';
import '../../global_imports.dart';
import 'notification/awesome_notification.service.dart';
import 'notification/fcm.service.dart';

class AppServices {
  Future<void> initAppServices() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Future.wait([
      ScreenUtil.ensureScreenSize(),
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
    ]);

    // await FcmHelper.initFcm();
    // await NotificationsController.initializeLocalNotifications();
    // await NotificationsController.initializeIsolateReceivePort();
    // NotificationsController.startListeningNotificationEvents();
  }
}
