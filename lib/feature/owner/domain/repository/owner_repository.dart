import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/owner_account.dart';
import '../entities/owner_profile.dart';

enum OwnerError { disabled, offline, invalidCredentials, denied, unknown }

class OwnerFailure extends Failure {
  OwnerFailure(this.error) : super(message: error.name);

  final OwnerError error;
}

abstract interface class OwnerRepository {
  Stream<OwnerAccount?> watchAccount();

  Future<Either<OwnerFailure, OwnerAccount>> signIn(
    String email,
    String password,
  );

  Future<Either<OwnerFailure, Unit>> signOut();

  Stream<Either<OwnerFailure, OwnerProfileSnapshot>> watchProfile(String uid);

  Future<Either<OwnerFailure, Unit>> saveProfile(
    String uid,
    OwnerProfile profile,
  );
}
