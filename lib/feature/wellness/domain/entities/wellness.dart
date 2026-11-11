import 'package:freezed_annotation/freezed_annotation.dart';

part 'wellness.freezed.dart';

enum WellnessSync { cached, pending, synced }

enum FastStatus { active, ended, cancelled }

@freezed
abstract class WaterEntry with _$WaterEntry {
  const factory WaterEntry({
    required String id,
    required int ml,
    required DateTime recordedAt,
    required String dayKey,
    required String timezone,
    @Default(false) bool deleted,
    @Default(WellnessSync.cached) WellnessSync sync,
  }) = _WaterEntry;
}

@freezed
abstract class WaterDay with _$WaterDay {
  const WaterDay._();
  const factory WaterDay({
    required List<WaterEntry> entries,
    required WellnessSync sync,
  }) = _WaterDay;

  int get totalMl => entries
      .where((entry) => !entry.deleted)
      .fold(0, (total, entry) => total + entry.ml);
}

@freezed
abstract class FastSession with _$FastSession {
  const FastSession._();
  const factory FastSession({
    required String id,
    required DateTime startedAt,
    required DateTime plannedEndAt,
    required String timezone,
    required FastStatus status,
    DateTime? actualEndAt,
  }) = _FastSession;

  Duration elapsed(DateTime now) {
    final value = (actualEndAt ?? now).difference(startedAt);
    return value.isNegative ? Duration.zero : value;
  }
}

@freezed
abstract class FastSnapshot with _$FastSnapshot {
  const factory FastSnapshot({
    FastSession? session,
    required WellnessSync sync,
  }) = _FastSnapshot;
}
