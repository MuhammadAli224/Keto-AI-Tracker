import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../firebase_options.dart';
import '../../global_imports.dart';

class AppServices {
  Future<void>? _initialization;

  Future<void> initAppServices() => _initialization ??= _initialize();

  Future<void> _initialize() async {
    try {
      await _initializePlatformServices();
    } catch (_) {
      _initialization = null;
      rethrow;
    }
  }

  Future<void> _initializePlatformServices() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      await FirebaseAppCheck.instance.activate(
        providerAndroid: kDebugMode
            ? const AndroidDebugProvider()
            : const AndroidPlayIntegrityProvider(),
      );
    }
    await Future.wait([
      ScreenUtil.ensureScreenSize(),
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]),
    ]);
  }
}
