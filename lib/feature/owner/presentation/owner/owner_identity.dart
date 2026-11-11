import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../../core/session/session_manager.dart';
import '../../domain/entities/owner_account.dart';
import '../../domain/usecases/owner_access.dart';

/// Keeps route guards in sync with the single identity provided by Firebase.
class OwnerIdentity extends ChangeNotifier {
  OwnerIdentity(this._access, this._session);

  final OwnerAccess _access;
  final SessionManager _session;
  StreamSubscription<OwnerAccount?>? _subscription;
  int _revision = 0;

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
  }

  @override
  void dispose() {
    _revision++;
    unawaited(_subscription?.cancel());
    super.dispose();
  }
}
