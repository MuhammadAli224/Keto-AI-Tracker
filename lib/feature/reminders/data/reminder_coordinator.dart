import 'dart:async';

import '../../../core/services/notification/fcm.service.dart';
import '../domain/reminder_access.dart';
import '../domain/reminder_settings.dart';
import 'awesome_reminder_scheduler.dart';
import 'reminder_preferences.dart';

class ReminderCoordinator implements ReminderAccess {
  ReminderCoordinator(this._preferences, this._scheduler, this._fcm);

  final ReminderPreferences _preferences;
  final AwesomeReminderScheduler _scheduler;
  final FcmRegistration _fcm;
  Future<void> _tail = Future.value();
  String? _uid;
  String? _zone;
  bool _ownerResolved = false;

  void ownerChanged(String? uid, String? zone) {
    if (_ownerResolved && _uid == uid && _zone == zone) return;
    final previous = _ownerResolved ? _uid : _preferences.activeOwner;
    _ownerResolved = true;
    _uid = uid;
    _zone = zone;
    unawaited(
      _serial(() async {
        if (previous != uid) {
          try {
            final oldSettings = previous == null
                ? null
                : _preferences.read(previous);
            if (oldSettings != null) await _scheduler.configure(oldSettings.$2);
            await _scheduler.cancelAll();
          } catch (_) {
            // The plugin may be unavailable on an unsupported platform.
          }
          try {
            await _fcm.disable(force: previous != null);
          } catch (_) {}
          try {
            await _preferences.setActiveOwner(uid);
          } catch (_) {}
        }
        if (uid == null || zone == null || _uid != uid || _zone != zone) return;
        final saved = _preferences.read(uid);
        if (saved != null) {
          try {
            await _apply(saved.$1, saved.$2, zone);
          } catch (_) {
            // Preferences remain stored for a later attempt.
          }
        }
      }),
    );
  }

  @override
  Future<ReminderResult> load(ReminderSettings defaults, ReminderCopy copy) =>
      _withOwner((uid, zone) async {
        final saved = _preferences.read(uid);
        if (saved != null) await _preferences.store(uid, saved.$1, copy);
        return _apply(saved?.$1 ?? defaults, copy, zone);
      });

  @override
  Future<ReminderResult> requestPermission(
    ReminderSettings defaults,
    ReminderCopy copy,
  ) => _withOwner((uid, zone) async {
    await _scheduler.configure(copy);
    await _scheduler.requestPermission();
    final settings = _preferences.read(uid)?.$1 ?? defaults;
    return _apply(settings, copy, zone);
  });

  @override
  Future<ReminderResult> save(ReminderSettings settings, ReminderCopy copy) =>
      _withOwner((uid, zone) async {
        await _preferences.store(uid, settings, copy);
        return _apply(settings, copy, zone);
      });

  @override
  Future<void> openSystemSettings() => _scheduler.openSystemSettings();

  Future<ReminderResult> _apply(
    ReminderSettings settings,
    ReminderCopy copy,
    String zone,
  ) async {
    await _scheduler.configure(copy);
    final allowed = await _scheduler.isAllowed();
    var scheduleFailed = false;
    try {
      if (allowed) {
        await _scheduler.apply(settings, copy, zone);
      } else {
        await _scheduler.cancelAll();
      }
    } catch (_) {
      scheduleFailed = true;
    }
    final remote = await _applyRemote(settings.remoteEnabled && allowed);
    return ReminderResult(
      settings: settings,
      allowed: allowed,
      remote: remote,
      scheduleFailed: scheduleFailed,
    );
  }

  Future<RemoteRegistration> _applyRemote(bool enabled) async {
    try {
      if (!enabled) {
        await _fcm.disable();
        return RemoteRegistration.disabled;
      }
      await _fcm.enable();
      return _fcm.hasRegistration
          ? RemoteRegistration.registered
          : RemoteRegistration.waiting;
    } catch (_) {
      return RemoteRegistration.unavailable;
    }
  }

  Future<T> _withOwner<T>(Future<T> Function(String uid, String zone) action) {
    final uid = _uid;
    final zone = _zone;
    return _serial(() {
      if (uid == null || zone == null || _uid != uid || _zone != zone) {
        throw StateError('No confirmed owner');
      }
      return action(uid, zone);
    });
  }

  Future<T> _serial<T>(Future<T> Function() action) {
    final result = _tail.then((_) => action());
    _tail = result.then<void>((_) {}, onError: (Object _, StackTrace __) {});
    return result;
  }
}
