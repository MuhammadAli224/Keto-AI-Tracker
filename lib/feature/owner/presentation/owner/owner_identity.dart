import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/session/session_manager.dart';
import '../../domain/entities/owner_account.dart';
import '../../domain/entities/owner_profile.dart';
import '../../domain/repository/owner_repository.dart';
import '../../domain/usecases/owner_access.dart';

/// Keeps route guards in sync with the single identity provided by Firebase.
class OwnerIdentity extends ChangeNotifier {
  OwnerIdentity(this._access, this._session);

  final OwnerAccess _access;
  final SessionManager _session;
  StreamSubscription<OwnerAccount?>? _subscription;
  StreamSubscription<Either<OwnerFailure, OwnerProfileSnapshot>>?
  _profileSubscription;
  int _revision = 0;
  OwnerProfileSnapshot? _snapshot;

  /// The confirmation timestamp is assigned by the server on explicit review.
  bool get canAnalyze =>
      account != null && _snapshot?.profile?.isConfirmed == true;

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
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _revision++;
    unawaited(_subscription?.cancel());
    unawaited(_profileSubscription?.cancel());
    super.dispose();
  }
}
