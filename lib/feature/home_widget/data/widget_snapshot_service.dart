import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:hive_ce/hive.dart';

import '../../../core/time/owner_calendar.dart';
import '../../diary/diary_barrel.dart';
import '../../diary/domain/repository/diary_repository.dart';
import '../../nutrition/domain/entities/nutrition.dart';
import '../../owner/owner_barrel.dart';
import '../../wellness/wellness_barrel.dart';
import '../../wellness/domain/repository/wellness_repository.dart';
import 'android_widget_bridge.dart';

class WidgetSnapshotService {
  WidgetSnapshotService(
    this._box,
    this._identity,
    this._diary,
    this._wellness,
    this._bridge,
  ) {
    _identity.addListener(_ownerChanged);
    _ownerChanged();
  }

  final Box<dynamic> _box;
  final OwnerIdentity _identity;
  final DiaryAccess _diary;
  final WellnessAccess _wellness;
  final AndroidWidgetBridge _bridge;

  StreamSubscription<Either<DiaryFailure, DiaryDay>>? _mealSubscription;
  StreamSubscription<Either<WellnessFailure, WaterDay>>? _waterSubscription;
  StreamSubscription<Either<WellnessFailure, FastSnapshot>>? _fastSubscription;
  Timer? _dayTimer;
  Future<void> _tail = Future.value();
  (String, String, String)? _scope;
  DiaryDay? _meals;
  WaterDay? _water;
  FastSnapshot? _fast;
  DateTime? _today;
  int _revision = 0;
  bool _visible = false;
  bool _resolved = false;

  String _key(String uid) => 'widgetVisible:${Uri.encodeComponent(uid)}';

  bool get visible => _visible;

  void _ownerChanged() {
    if (!_identity.ready) {
      if (_resolved && _identity.account == null) _changeScope(null);
      return;
    }
    final uid = _identity.account?.uid;
    final profile = _identity.confirmedProfile;
    final next = uid == null || profile == null
        ? null
        : (uid, profile.timezone, profile.locale);
    if (!_resolved || _scope != next) {
      _changeScope(next);
    } else if (_visible) {
      _publish();
    }
  }

  void _changeScope((String, String, String)? next) {
    _resolved = true;
    _scope = next;
    _visible =
        next != null && _box.get(_key(next.$1), defaultValue: false) == true;
    unawaited(_restart().catchError((Object _) {}));
  }

  Future<void> setVisible(bool enabled) async {
    final scope = _scope;
    if (scope == null) throw StateError('No confirmed owner');
    await _box.put(_key(scope.$1), enabled);
    if (_scope != scope) return;
    _visible = enabled;
    await _restart();
  }

  Future<void> _restart() {
    final revision = ++_revision;
    _stopSubscriptions();
    _meals = null;
    _water = null;
    _fast = null;
    _today = null;
    final clearing = _serial(() async {
      if (_revision == revision) await _bridge.hide();
    });
    final scope = _scope;
    if (!_visible || scope == null) return clearing;
    final calendar = OwnerCalendar(scope.$2);
    _watchToday(calendar, revision);
    _fastSubscription = _wellness.watchFast().listen((result) {
      if (revision != _revision) return;
      _fast = result.fold((_) => null, (value) => value);
      _publish();
    });
    _dayTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (_today != calendar.date(DateTime.now())) {
        _watchToday(calendar, revision);
      }
    });
    return clearing;
  }

  void _watchToday(OwnerCalendar calendar, int revision) {
    unawaited(_mealSubscription?.cancel());
    unawaited(_waterSubscription?.cancel());
    _meals = null;
    _water = null;
    final today = calendar.date(DateTime.now());
    _today = today;
    final key = calendar.dayKey(today);
    _mealSubscription = _diary.watchDay(key).listen((result) {
      if (revision != _revision || today != _today) return;
      _meals = result.fold((_) => null, (value) => value);
      _publish();
    });
    _waterSubscription = _wellness.watchWater(key).listen((result) {
      if (revision != _revision || today != _today) return;
      _water = result.fold((_) => null, (value) => value);
      _publish();
    });
    _publish();
  }

  void _publish() {
    final revision = _revision;
    unawaited(
      _serial(() async {
        final scope = _scope;
        final today = _today;
        if (revision != _revision ||
            !_visible ||
            scope == null ||
            today == null) {
          return;
        }
        final meal = _meals;
        final water = _water;
        final fast = _fast;
        final confirmed = meal?.entries.where(
          (entry) =>
              entry.status == MealStatus.confirmed &&
              entry.sync != DiarySync.pending,
        );
        final pending = meal?.entries.where(
          (entry) =>
              entry.status == MealStatus.confirmed &&
              entry.sync == DiarySync.pending,
        );
        final confirmedKcal =
            confirmed == null ||
                (confirmed.isEmpty && meal?.sync != DiarySync.confirmed)
            ? null
            : totalDay(confirmed.map((entry) => entry.servings)).kcal;
        final pendingKcal = pending == null || pending.isEmpty
            ? null
            : totalDay(pending.map((entry) => entry.servings)).kcal;
        final waterMl =
            water == null ||
                (water.sync == WellnessSync.cached &&
                    !water.entries.any((entry) => !entry.deleted))
            ? null
            : water.totalMl;
        final session = fast?.session;
        final status =
            meal?.sync == DiarySync.pending ||
                water?.sync == WellnessSync.pending ||
                fast?.sync == WellnessSync.pending
            ? 'pending'
            : meal?.sync == DiarySync.confirmed &&
                  water?.sync == WellnessSync.synced &&
                  fast?.sync == WellnessSync.synced
            ? 'synced'
            : 'cached';
        final tomorrow = today.add(const Duration(days: 1));
        await _bridge.publish(
          AndroidWidgetSnapshot(
            language: scope.$3,
            timezone: session?.timezone ?? scope.$2,
            expiresAt: OwnerCalendar(scope.$2).instant(tomorrow, 0, 0),
            status: status,
            confirmedKcal: confirmedKcal,
            pendingKcal: pendingKcal,
            waterMl: waterMl,
            fastEnd: session?.status == FastStatus.active
                ? session?.plannedEndAt
                : null,
            weightKg: _identity.latestWeightKg,
          ),
        );
      }).catchError((Object _) {}),
    );
  }

  void _stopSubscriptions() {
    unawaited(_mealSubscription?.cancel());
    unawaited(_waterSubscription?.cancel());
    unawaited(_fastSubscription?.cancel());
    _dayTimer?.cancel();
  }

  Future<void> _serial(Future<void> Function() action) {
    final result = _tail.then((_) => action());
    _tail = result.then<void>((_) {}, onError: (Object _, StackTrace __) {});
    return result;
  }

  void dispose() {
    _revision++;
    _identity.removeListener(_ownerChanged);
    _stopSubscriptions();
  }
}
