import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/wellness.dart';
import '../../domain/repository/wellness_repository.dart';
import '../datasources/wellness/firestore_wellness_data_source.dart';
import '../model/wellness_dto.dart';

class FirestoreWellnessRepository implements WellnessRepository {
  FirestoreWellnessRepository(this._source);

  final FirestoreWellnessDataSource _source;
  final _mapper = WellnessMapper();

  WellnessSync _sync(SnapshotMetadata metadata) => metadata.hasPendingWrites
      ? WellnessSync.pending
      : metadata.isFromCache
      ? WellnessSync.cached
      : WellnessSync.synced;

  String? _date(Object? timestamp) =>
      (timestamp as Timestamp?)?.toDate().toUtc().toIso8601String();

  @override
  Stream<Either<WellnessFailure, WaterDay>> watchWater(
    String uid,
    String day,
  ) async* {
    try {
      await for (final snapshot in _source.watchWater(uid, day)) {
        final entries =
            [
              for (final doc in snapshot.docs)
                _mapper
                    .convert<WaterDto, WaterEntry>(
                      WaterDto.fromJson({
                        ...doc.data(),
                        'id': doc.id,
                        'recordedAt': _date(doc.data()['recordedAt']),
                      }),
                    )
                    .copyWith(sync: _sync(doc.metadata)),
            ]..sort((a, b) {
              final time = b.recordedAt.compareTo(a.recordedAt);
              return time == 0 ? a.id.compareTo(b.id) : time;
            });
        yield Right(WaterDay(entries: entries, sync: _sync(snapshot.metadata)));
      }
    } catch (error) {
      yield Left(_failure(error));
    }
  }

  @override
  Stream<Either<WellnessFailure, FastSnapshot>> watchFast(String uid) async* {
    try {
      await for (final doc in _source.watchFast(uid)) {
        final data = doc.data();
        yield Right(
          FastSnapshot(
            sync: _sync(doc.metadata),
            session: data == null
                ? null
                : _mapper.convert<FastDto, FastSession>(
                    FastDto.fromJson({
                      ...data,
                      'startedAt': _date(data['startedAt']),
                      'plannedEndAt': _date(data['plannedEndAt']),
                      'actualEndAt': _date(data['actualEndAt']),
                    }),
                  ),
          ),
        );
      }
    } catch (error) {
      yield Left(_failure(error));
    }
  }

  @override
  Future<Either<WellnessFailure, WaterEntry>> addWater(
    String uid,
    WaterEntry entry,
  ) => _write(
    entry,
    () => _source.addWater(uid, _mapper.convert<WaterEntry, WaterDto>(entry)),
  );

  @override
  Future<Either<WellnessFailure, WaterEntry>> deleteWater(
    String uid,
    WaterEntry entry,
  ) => _write(
    entry.copyWith(deleted: true),
    () => _source.deleteWater(uid, entry.id),
  );

  @override
  Future<Either<WellnessFailure, FastSession>> saveFast(
    String uid,
    FastSession session,
  ) => _write(
    session,
    () => _source.saveFast(uid, _mapper.convert<FastSession, FastDto>(session)),
  );

  Future<Either<WellnessFailure, T>> _write<T>(
    T value,
    Future<void> Function() action,
  ) async {
    try {
      await action();
      return Right(value);
    } catch (error) {
      return Left(_failure(error));
    }
  }

  WellnessFailure _failure(Object error) => WellnessFailure(switch (error) {
    FirebaseException(code: 'permission-denied' || 'unauthenticated') =>
      WellnessError.denied,
    FirebaseException(code: 'unavailable' || 'deadline-exceeded') =>
      WellnessError.connection,
    _ => WellnessError.unexpected,
  });
}
