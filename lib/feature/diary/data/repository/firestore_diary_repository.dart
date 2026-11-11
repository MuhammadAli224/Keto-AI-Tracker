import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/meal_entry.dart';
import '../../domain/repository/diary_repository.dart';
import '../datasources/diary/firestore_meal_data_source.dart';
import '../datasources/diary/local_meal_attachments.dart';
import '../model/meal_dto.dart';

class FirestoreDiaryRepository implements DiaryRepository {
  FirestoreDiaryRepository(this._source, this._attachments);

  final FirestoreMealDataSource _source;
  final LocalMealAttachments _attachments;
  final _mapper = MealMapper();

  DiarySync _sync(SnapshotMetadata meta) {
    if (meta.hasPendingWrites) return DiarySync.pending;
    return meta.isFromCache ? DiarySync.cached : DiarySync.confirmed;
  }

  @override
  Stream<Either<DiaryFailure, DiaryDay>> watchDay(
    String uid,
    String dayKey,
  ) async* {
    try {
      await for (final snapshot in _source.watchDay(uid, dayKey)) {
        final entries =
            snapshot.docs.map((document) {
              final data = document.data();
              final dto = MealDto.fromJson({
                ...data,
                'id': document.id,
                'eatenAtUtc': (data['eatenAtUtc'] as Timestamp)
                    .toDate()
                    .toUtc()
                    .toIso8601String(),
                'updatedAt': (data['updatedAt'] as Timestamp?)
                    ?.toDate()
                    .toUtc()
                    .toIso8601String(),
              });
              return _mapper
                  .convert<MealDto, MealEntry>(dto)
                  .copyWith(
                    sync: _sync(document.metadata),
                    localImageRef: _attachments.read(uid, document.id),
                  );
            }).toList()..sort((a, b) {
              final time = a.eatenAtUtc.compareTo(b.eatenAtUtc);
              return time == 0 ? a.id.compareTo(b.id) : time;
            });
        yield Right(
          DiaryDay(
            dayKey: dayKey,
            entries: entries,
            sync: _sync(snapshot.metadata),
          ),
        );
      }
    } catch (error) {
      yield Left(_failure(error));
    }
  }

  @override
  Future<Either<DiaryFailure, MealEntry>> save(
    String uid,
    MealEntry meal,
  ) async {
    try {
      final ref = meal.localImageRef;
      if (ref != null) await _attachments.store(uid, meal.id, ref);
      await _source.save(uid, _mapper.convert<MealEntry, MealDto>(meal));
      return Right(meal);
    } catch (error) {
      return Left(_failure(error));
    }
  }

  @override
  Future<Either<DiaryFailure, MealEntry>> delete(
    String uid,
    MealEntry meal,
  ) async {
    try {
      await _source.delete(uid, meal.id);
      return Right(meal.copyWith(status: MealStatus.deleted));
    } catch (error) {
      return Left(_failure(error));
    }
  }

  DiaryFailure _failure(Object error) => DiaryFailure(switch (error) {
    FirebaseException(code: 'permission-denied' || 'unauthenticated') =>
      DiaryError.denied,
    FirebaseException(code: 'unavailable' || 'deadline-exceeded') =>
      DiaryError.connection,
    _ => DiaryError.unexpected,
  });
}
