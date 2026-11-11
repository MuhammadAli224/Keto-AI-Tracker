import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/session/session_manager.dart';
import '../../../progress/domain/entities/progress.dart';
import '../../../progress/domain/repository/progress_repository.dart';
import '../../../progress/domain/usecases/progress_access.dart';
import '../../domain/entities/owner_account.dart';
import '../../domain/entities/owner_profile.dart';
import '../../domain/repository/owner_repository.dart';
import '../../domain/usecases/owner_access.dart';

/// Keeps route guards in sync with the single identity provided by Firebase.
class OwnerIdentity extends ChangeNotifier {
  OwnerIdentity(this._access, this._session, this._progress);

  final OwnerAccess _access;
  final SessionManager _session;
  final ProgressAccess _progress;
  StreamSubscription<Either<ProgressFailure, WeightHistory>>?
  _weightSubscription;
  double? latestWeightKg;
  StreamSubscription<OwnerAccount?>? _subscription;
  StreamSubscription<Either<OwnerFailure, OwnerProfileSnapshot>>?
  _profileSubscription;
  int _revision = 0;
  OwnerProfileSnapshot? _snapshot;

  /// The confirmation timestamp is assigned by the server on explicit review.
  bool get canAnalyze =>
      account != null && _snapshot?.profile?.isConfirmed == true;

  OwnerProfile? get confirmedProfile {
    if (!canAnalyze) return null;
    final profile = _snapshot?.profile;
    final measured = latestWeightKg;
    return measured == null
        ? profile
        : profile?.copyWith(currentWeightKg: measured);
  }

  OwnerAccount? account;
  bool ready = false;
  bool unavailable = false;

  void start() {
    _subscription ??= _access.watchAccount().listen(
      _synchronize,
      onError: (Object _) => _synchronize(null, failed: true),
    );
  }

  Future<void> _synchronize(OwnerAccount? next, {bool failed = false}) async {
    final revision = ++_revision;
    _snapshot = null;
    latestWeightKg = null;
    unawaited(_weightSubscription?.cancel());
    _weightSubscription = null;
    unawaited(_profileSubscription?.cancel());
    _profileSubscription = null;
    if (account != null && account != next) {
      account = null;
      ready = false;
      notifyListeners();
    }
    try {
      await _session.mirrorFirebaseAccount(next?.uid);
    } catch (_) {
      // The manager already revoked the in-memory credentials and cache scope.
    }
    if (_revision != revision) return;
    account = next;
    ready = true;
    unavailable = failed;
    notifyListeners();
    if (next != null) retryProfile();
  }

  void retryProfile() {
    final uid = account?.uid;
    if (uid == null) return;
    final revision = _revision;
    unawaited(_profileSubscription?.cancel());
    _profileSubscription = _access.watchProfile(uid).listen((result) {
      if (_revision != revision) return;
      _snapshot = result.fold((_) => null, (snapshot) => snapshot);
      if (canAnalyze) {
        _watchWeights(revision);
      } else {
        latestWeightKg = null;
        unawaited(_weightSubscription?.cancel());
        _weightSubscription = null;
      }
      notifyListeners();
    });
  }

  void _watchWeights(int revision) {
    _weightSubscription ??= _progress.watchWeights().listen((result) {
      if (_revision != revision || !canAnalyze) return;
      result.fold((_) {}, (history) {
        final kg = history.entries.isEmpty ? null : history.entries.first.kg;
        if (latestWeightKg == kg) return;
        latestWeightKg = kg;
        notifyListeners();
      });
    });
  }

  @override
  void dispose() {
    _revision++;
    unawaited(_subscription?.cancel());
    unawaited(_weightSubscription?.cancel());
    unawaited(_profileSubscription?.cancel());
    super.dispose();
  }
}
