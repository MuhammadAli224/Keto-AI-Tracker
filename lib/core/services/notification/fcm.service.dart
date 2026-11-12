import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

/// Optional installation registration. No identifiers are logged or uploaded
/// to an application backend. Local reminders do not depend on this service.
class FcmRegistration {
  FcmRegistration(this._messaging);

  final FirebaseMessaging _messaging;
  StreamSubscription<String>? _registered;
  StreamSubscription<String>? _unregistered;
  String? _installationId;
  bool _requested = false;
  bool _attempted = false;

  bool get hasRegistration => _installationId != null;

  Future<void> enable() async {
    if (_requested) return;
    _requested = true;
    _attempted = true;
    _registered ??= _messaging.onRegistered.listen((id) {
      if (_requested) _installationId = id;
    }, onError: (Object _) {});
    _unregistered ??= _messaging.onUnregistered.listen((_) {
      _installationId = null;
    }, onError: (Object _) {});
    try {
      await _messaging.setAutoInitEnabled(true);
      await _messaging.register().timeout(const Duration(seconds: 8));
    } catch (_) {
      _requested = false;
      await _messaging.setAutoInitEnabled(false);
      rethrow;
    }
  }

  Future<void> disable({bool force = false}) async {
    final shouldUnregister = _attempted || hasRegistration || force;
    _requested = false;
    _installationId = null;
    await _messaging.setAutoInitEnabled(false);
    if (shouldUnregister) {
      await _messaging.unregister().timeout(const Duration(seconds: 8));
      _attempted = false;
    }
  }

  Future<void> dispose() async {
    await _registered?.cancel();
    await _unregistered?.cancel();
  }
}
