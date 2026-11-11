import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/owner_account.dart';
import '../../domain/entities/owner_profile.dart';
import '../../domain/repository/owner_repository.dart';
import '../datasources/owner/firebase_owner_data_source.dart';
import '../model/owner_profile_dto.dart';

class FirebaseOwnerRepository implements OwnerRepository {
  FirebaseOwnerRepository(this._source);

  final FirebaseOwnerDataSource _source;
  final _mapper = OwnerProfileMapper();

  @override
  Stream<OwnerAccount?> watchAccount() => _source.watchAccount().map(
    (user) => user == null ? null : OwnerAccount(uid: user.uid),
  );

  @override
  Future<Either<OwnerFailure, OwnerAccount>> signIn(
    String email,
    String password,
  ) async {
    try {
      final user = await _source.signIn(email, password);
      return user == null
          ? Left(OwnerFailure(OwnerError.unknown))
          : Right(OwnerAccount(uid: user.uid));
    } on Exception catch (error) {
      return Left(_failure(error));
    }
  }

  @override
  Future<Either<OwnerFailure, Unit>> signOut() async {
    try {
      await _source.signOut();
      return const Right(unit);
    } on Exception catch (error) {
      return Left(_failure(error));
    }
  }

  @override
  Stream<Either<OwnerFailure, OwnerProfileSnapshot>> watchProfile(
    String uid,
  ) async* {
    try {
      await for (final snapshot in _source.watchProfile(uid)) {
        final data = snapshot.data();
        final sync = snapshot.metadata.hasPendingWrites
            ? ProfileSync.pending
            : snapshot.metadata.isFromCache
            ? ProfileSync.cached
            : ProfileSync.confirmed;
        if (data == null) {
          yield Right(OwnerProfileSnapshot(sync: sync));
          continue;
        }
        for (final key in ['updatedAt', 'confirmedAt']) {
          final timestamp = data[key];
          data[key] = timestamp is Timestamp
              ? timestamp.toDate().toUtc().toIso8601String()
              : null;
        }
        final dto = OwnerProfileDto.fromJson(data);
        yield Right(
          OwnerProfileSnapshot(
            sync: sync,
            profile: _mapper.convert<OwnerProfileDto, OwnerProfile>(dto),
          ),
        );
      }
    } catch (error) {
      yield Left(_failure(error));
    }
  }

  @override
  Future<Either<OwnerFailure, Unit>> saveProfile(
    String uid,
    OwnerProfile profile,
  ) async {
    if (!profile.isComplete) return Left(OwnerFailure(OwnerError.denied));
    try {
      await _source.saveProfile(
        uid,
        _mapper.convert<OwnerProfile, OwnerProfileDto>(profile),
      );
      return const Right(unit);
    } on Exception catch (error) {
      return Left(_failure(error));
    }
  }

  OwnerFailure _failure(Object error) {
    final code = error is FirebaseException ? error.code : null;
    return OwnerFailure(switch (code) {
      'operation-not-allowed' ||
      'configuration-not-found' => OwnerError.disabled,
      'network-request-failed' || 'unavailable' => OwnerError.offline,
      'invalid-credential' ||
      'invalid-email' ||
      'user-not-found' ||
      'wrong-password' ||
      'user-disabled' => OwnerError.invalidCredentials,
      'permission-denied' || 'unauthenticated' => OwnerError.denied,
      _ => OwnerError.unknown,
    });
  }
}
