import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/time/owner_calendar.dart';
import '../../../diary/data/model/meal_dto.dart';
import '../../../diary/domain/entities/meal_entry.dart';
import '../../../wellness/data/model/wellness_dto.dart';
import '../../../wellness/domain/entities/wellness.dart';
import '../../domain/entities/progress.dart';
import '../../domain/repository/progress_repository.dart';
import '../datasources/progress/firestore_progress_data_source.dart';
import '../model/weight_dto.dart';

class FirestoreProgressRepository implements ProgressRepository {
  FirestoreProgressRepository(this._source);

  final FirestoreProgressDataSource _source;
  final _weights = WeightMapper();
  final _meals = MealMapper();
  final _wellness = WellnessMapper();

  String? _date(Object? value) =>
      (value as Timestamp?)?.toDate().toUtc().toIso8601String();
  WellnessSync _sync(SnapshotMetadata meta) => meta.hasPendingWrites
      ? WellnessSync.pending
      : meta.isFromCache
      ? WellnessSync.cached
      : WellnessSync.synced;

  WeightEntry _weight(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return _weights
        .convert<WeightDto, WeightEntry>(
          WeightDto.fromJson({
            ...data,
            'id': doc.id,
            'measuredAt': _date(data['measuredAt']),
          }),
        )
        .copyWith(sync: _sync(doc.metadata));
  }

  @override
  Stream<Either<ProgressFailure, WeightHistory>> watchWeights(
    String uid,
  ) async* {
    try {
      await for (final snapshot in _source.watchWeights(uid)) {
        final entries =
            snapshot.docs.map(_weight).where((item) => !item.deleted).toList()
              ..sort((a, b) => compareWeightEntries(b, a));
        yield Right(
          WeightHistory(entries: entries, sync: _sync(snapshot.metadata)),
        );
      }
    } catch (error) {
      yield Left(_failure(error));
    }
  }

  @override
  Future<Either<ProgressFailure, WeightEntry>> saveWeight(
    String uid,
    WeightEntry entry,
  ) => _perform(() async {
    await _source.saveWeight(
      uid,
      _weights.convert<WeightEntry, WeightDto>(entry),
    );
    return entry;
  });

  @override
  Future<Either<ProgressFailure, WeightEntry>> deleteWeight(
    String uid,
    WeightEntry entry,
  ) => _perform(() async {
    await _source.deleteWeight(uid, entry.id);
    return entry.copyWith(deleted: true);
  });

  @override
  Future<Either<ProgressFailure, WeeklyReport>> loadWeek(
    String uid,
    OwnerCalendar calendar,
    DateTime end,
    int waterGoal,
  ) => _perform(() async {
    final first = end.subtract(const Duration(days: 6));
    final lastExclusive = end.add(const Duration(days: 1));
    final startUtc = calendar.instant(first, 0, 0);
    final endUtc = calendar.instant(lastExclusive, 0, 0);
    final snapshots = await Future.wait([
      _source.dayRange(
        uid,
        'meals',
        calendar.dayKey(first),
        calendar.dayKey(end),
      ),
      _source.dayRange(
        uid,
        'water',
        calendar.dayKey(first),
        calendar.dayKey(end),
      ),
      _source.timeRange(uid, 'fastingHistory', 'actualEndAt', startUtc, endUtc),
      _source.timeRange(uid, 'weights', 'measuredAt', startUtc, endUtc),
    ]);
    final [mealQuery, waterQuery, fastQuery, weightQuery] = snapshots;
    return summarizeWeek(
      firstDay: first,
      lastDay: end,
      calendar: calendar,
      meals: mealQuery.docs.map((doc) {
        final data = doc.data();
        return _meals.convert<MealDto, MealEntry>(
          MealDto.fromJson({
            ...data,
            'id': doc.id,
            'eatenAtUtc': _date(data['eatenAtUtc']),
            'updatedAt': _date(data['updatedAt']),
          }),
        );
      }),
      water: waterQuery.docs.map((doc) {
        final data = doc.data();
        return _wellness.convert<WaterDto, WaterEntry>(
          WaterDto.fromJson({
            ...data,
            'id': doc.id,
            'recordedAt': _date(data['recordedAt']),
          }),
        );
      }),
      fasts: fastQuery.docs.map((doc) {
        final data = doc.data();
        return _wellness.convert<FastDto, FastSession>(
          FastDto.fromJson({
            ...data,
            'startedAt': _date(data['startedAt']),
            'plannedEndAt': _date(data['plannedEndAt']),
            'actualEndAt': _date(data['actualEndAt']),
          }),
        );
      }),
      weights: weightQuery.docs.map(_weight),
      waterGoal: waterGoal,
      sync: snapshots.any((query) => query.metadata.hasPendingWrites)
          ? WellnessSync.pending
          : snapshots.any((query) => query.metadata.isFromCache)
          ? WellnessSync.cached
          : WellnessSync.synced,
    );
  });

  Future<Either<ProgressFailure, T>> _perform<T>(
    Future<T> Function() operation,
  ) async {
    try {
      return Right(await operation());
    } catch (error) {
      return Left(_failure(error));
    }
  }

  ProgressFailure _failure(Object error) => ProgressFailure(switch (error) {
    FirebaseException(code: 'permission-denied' || 'unauthenticated') =>
      ProgressError.denied,
    FirebaseException(code: 'unavailable' || 'deadline-exceeded') =>
      ProgressError.connection,
    _ => ProgressError.unexpected,
  });
}
