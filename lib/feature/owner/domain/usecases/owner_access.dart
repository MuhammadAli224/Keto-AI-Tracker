import 'package:dartz/dartz.dart';

import '../entities/owner_account.dart';
import '../entities/owner_profile.dart';
import '../repository/owner_repository.dart';

class OwnerAccess {
  const OwnerAccess(this._repository);

  final OwnerRepository _repository;

  Stream<OwnerAccount?> watchAccount() => _repository.watchAccount();

  Future<Either<OwnerFailure, OwnerAccount>> signIn(
    String email,
    String password,
  ) => _repository.signIn(email, password);

  Future<Either<OwnerFailure, Unit>> signOut() => _repository.signOut();

  Stream<Either<OwnerFailure, OwnerProfileSnapshot>> watchProfile(String uid) =>
      _repository.watchProfile(uid);

  Future<Either<OwnerFailure, Unit>> saveProfile(
    String uid,
    OwnerProfile profile, {
    bool recordWeight = false,
  }) => _repository.saveProfile(uid, profile, recordWeight: recordWeight);
}
