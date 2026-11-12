// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeightEntry {

 String get id; double get kg; DateTime get measuredAt; String get timezone; String? get notes; bool get deleted; WellnessSync get sync;
/// Create a copy of WeightEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeightEntryCopyWith<WeightEntry> get copyWith => _$WeightEntryCopyWithImpl<WeightEntry>(this as WeightEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WeightEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeightEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kg, _this.kg) || other.kg == _this.kg)&&(identical(other.measuredAt, _this.measuredAt) || other.measuredAt == _this.measuredAt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.deleted, _this.deleted) || other.deleted == _this.deleted)&&(identical(other.sync, _this.sync) || other.sync == _this.sync));
}


@override
int get hashCode {
  final _this = this as WeightEntry;
  return Object.hash(runtimeType,_this.id,_this.kg,_this.measuredAt,_this.timezone,_this.notes,_this.deleted,_this.sync);
}

@override
String toString() {
  final _this = this as WeightEntry;
  return 'WeightEntry(id: ${_this.id}, kg: ${_this.kg}, measuredAt: ${_this.measuredAt}, timezone: ${_this.timezone}, notes: ${_this.notes}, deleted: ${_this.deleted}, sync: ${_this.sync})';
}


}

/// @nodoc
abstract mixin class $WeightEntryCopyWith<$Res>  {
  factory $WeightEntryCopyWith(WeightEntry value, $Res Function(WeightEntry) _then) = _$WeightEntryCopyWithImpl;
@useResult
$Res call({
 String id, double kg, DateTime measuredAt, String timezone, String? notes, bool deleted, WellnessSync sync
});




}
/// @nodoc
class _$WeightEntryCopyWithImpl<$Res>
    implements $WeightEntryCopyWith<$Res> {
  _$WeightEntryCopyWithImpl(this._self, this._then);

  final WeightEntry _self;
  final $Res Function(WeightEntry) _then;

/// Create a copy of WeightEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kg = null,Object? measuredAt = null,Object? timezone = null,Object? notes = freezed,Object? deleted = null,Object? sync = null,}) {
  return _then(WeightEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kg: null == kg ? _self.kg : kg // ignore: cast_nullable_to_non_nullable
as double,measuredAt: null == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}

}


/// Adds pattern-matching-related methods to [WeightEntry].
extension WeightEntryPatterns on WeightEntry {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeightEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeightEntry() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeightEntry value)  $default,){
final _that = this;
switch (_that) {
case _WeightEntry():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeightEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WeightEntry() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double kg,  DateTime measuredAt,  String timezone,  String? notes,  bool deleted,  WellnessSync sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeightEntry() when $default != null:
return $default(_that.id,_that.kg,_that.measuredAt,_that.timezone,_that.notes,_that.deleted,_that.sync);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double kg,  DateTime measuredAt,  String timezone,  String? notes,  bool deleted,  WellnessSync sync)  $default,) {final _that = this;
switch (_that) {
case _WeightEntry():
return $default(_that.id,_that.kg,_that.measuredAt,_that.timezone,_that.notes,_that.deleted,_that.sync);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double kg,  DateTime measuredAt,  String timezone,  String? notes,  bool deleted,  WellnessSync sync)?  $default,) {final _that = this;
switch (_that) {
case _WeightEntry() when $default != null:
return $default(_that.id,_that.kg,_that.measuredAt,_that.timezone,_that.notes,_that.deleted,_that.sync);case _:
  return null;

}
}

}

/// @nodoc


class _WeightEntry implements WeightEntry {
  const _WeightEntry({required this.id, required this.kg, required this.measuredAt, required this.timezone, this.notes, this.deleted = false, this.sync = WellnessSync.cached});


@override final  String id;
@override final  double kg;
@override final  DateTime measuredAt;
@override final  String timezone;
@override final  String? notes;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  WellnessSync sync;

/// Create a copy of WeightEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeightEntryCopyWith<_WeightEntry> get copyWith => __$WeightEntryCopyWithImpl<_WeightEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.kg, kg) || other.kg == kg)&&(identical(other.measuredAt, measuredAt) || other.measuredAt == measuredAt)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,kg,measuredAt,timezone,notes,deleted,sync);
}

@override
String toString() {
    return 'WeightEntry(id: $id, kg: $kg, measuredAt: $measuredAt, timezone: $timezone, notes: $notes, deleted: $deleted, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$WeightEntryCopyWith<$Res> implements $WeightEntryCopyWith<$Res> {
  factory _$WeightEntryCopyWith(_WeightEntry value, $Res Function(_WeightEntry) _then) = __$WeightEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, double kg, DateTime measuredAt, String timezone, String? notes, bool deleted, WellnessSync sync
});




}
/// @nodoc
class __$WeightEntryCopyWithImpl<$Res>
    implements _$WeightEntryCopyWith<$Res> {
  __$WeightEntryCopyWithImpl(this._self, this._then);

  final _WeightEntry _self;
  final $Res Function(_WeightEntry) _then;

/// Create a copy of WeightEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kg = null,Object? measuredAt = null,Object? timezone = null,Object? notes = freezed,Object? deleted = null,Object? sync = null,}) {
  return _then(_WeightEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kg: null == kg ? _self.kg : kg // ignore: cast_nullable_to_non_nullable
as double,measuredAt: null == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}


}

/// @nodoc
mixin _$WeightHistory {

 List<WeightEntry> get entries; WellnessSync get sync;
/// Create a copy of WeightHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeightHistoryCopyWith<WeightHistory> get copyWith => _$WeightHistoryCopyWithImpl<WeightHistory>(this as WeightHistory, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WeightHistory;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeightHistory&&const DeepCollectionEquality().equals(other.entries, _this.entries)&&(identical(other.sync, _this.sync) || other.sync == _this.sync));
}


@override
int get hashCode {
  final _this = this as WeightHistory;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.entries),_this.sync);
}

@override
String toString() {
  final _this = this as WeightHistory;
  return 'WeightHistory(entries: ${_this.entries}, sync: ${_this.sync})';
}


}

/// @nodoc
abstract mixin class $WeightHistoryCopyWith<$Res>  {
  factory $WeightHistoryCopyWith(WeightHistory value, $Res Function(WeightHistory) _then) = _$WeightHistoryCopyWithImpl;
@useResult
$Res call({
 List<WeightEntry> entries, WellnessSync sync
});




}
/// @nodoc
class _$WeightHistoryCopyWithImpl<$Res>
    implements $WeightHistoryCopyWith<$Res> {
  _$WeightHistoryCopyWithImpl(this._self, this._then);

  final WeightHistory _self;
  final $Res Function(WeightHistory) _then;

/// Create a copy of WeightHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,Object? sync = null,}) {
  return _then(WeightHistory(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<WeightEntry>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}

}


/// Adds pattern-matching-related methods to [WeightHistory].
extension WeightHistoryPatterns on WeightHistory {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeightHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeightHistory() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeightHistory value)  $default,){
final _that = this;
switch (_that) {
case _WeightHistory():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeightHistory value)?  $default,){
final _that = this;
switch (_that) {
case _WeightHistory() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WeightEntry> entries,  WellnessSync sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeightHistory() when $default != null:
return $default(_that.entries,_that.sync);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WeightEntry> entries,  WellnessSync sync)  $default,) {final _that = this;
switch (_that) {
case _WeightHistory():
return $default(_that.entries,_that.sync);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WeightEntry> entries,  WellnessSync sync)?  $default,) {final _that = this;
switch (_that) {
case _WeightHistory() when $default != null:
return $default(_that.entries,_that.sync);case _:
  return null;

}
}

}

/// @nodoc


class _WeightHistory implements WeightHistory {
  const _WeightHistory({required  List<WeightEntry> entries, required this.sync}): _entries = entries;


 final  List<WeightEntry> _entries;
@override List<WeightEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override final  WellnessSync sync;

/// Create a copy of WeightHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeightHistoryCopyWith<_WeightHistory> get copyWith => __$WeightHistoryCopyWithImpl<_WeightHistory>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightHistory&&const DeepCollectionEquality().equals(other.entries, _entries)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries),sync);
}

@override
String toString() {
    return 'WeightHistory(entries: $entries, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$WeightHistoryCopyWith<$Res> implements $WeightHistoryCopyWith<$Res> {
  factory _$WeightHistoryCopyWith(_WeightHistory value, $Res Function(_WeightHistory) _then) = __$WeightHistoryCopyWithImpl;
@override @useResult
$Res call({
 List<WeightEntry> entries, WellnessSync sync
});




}
/// @nodoc
class __$WeightHistoryCopyWithImpl<$Res>
    implements _$WeightHistoryCopyWith<$Res> {
  __$WeightHistoryCopyWithImpl(this._self, this._then);

  final _WeightHistory _self;
  final $Res Function(_WeightHistory) _then;

/// Create a copy of WeightHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? sync = null,}) {
  return _then(_WeightHistory(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<WeightEntry>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}


}

/// @nodoc
mixin _$WeeklyReport {

 DateTime get firstDay; DateTime get lastDay; int get mealDays; int get waterDays; int get fastingSessions; Duration get fastingTime; WellnessSync get sync; int get energyDays; int get proteinDays; int get carbDays; double? get averageKcal; double? get averageProtein; double? get averageNetCarbs; int? get waterGoalDays; double? get weightChangeKg;
/// Create a copy of WeeklyReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeklyReportCopyWith<WeeklyReport> get copyWith => _$WeeklyReportCopyWithImpl<WeeklyReport>(this as WeeklyReport, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WeeklyReport;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeklyReport&&(identical(other.firstDay, _this.firstDay) || other.firstDay == _this.firstDay)&&(identical(other.lastDay, _this.lastDay) || other.lastDay == _this.lastDay)&&(identical(other.mealDays, _this.mealDays) || other.mealDays == _this.mealDays)&&(identical(other.waterDays, _this.waterDays) || other.waterDays == _this.waterDays)&&(identical(other.fastingSessions, _this.fastingSessions) || other.fastingSessions == _this.fastingSessions)&&(identical(other.fastingTime, _this.fastingTime) || other.fastingTime == _this.fastingTime)&&(identical(other.sync, _this.sync) || other.sync == _this.sync)&&(identical(other.energyDays, _this.energyDays) || other.energyDays == _this.energyDays)&&(identical(other.proteinDays, _this.proteinDays) || other.proteinDays == _this.proteinDays)&&(identical(other.carbDays, _this.carbDays) || other.carbDays == _this.carbDays)&&(identical(other.averageKcal, _this.averageKcal) || other.averageKcal == _this.averageKcal)&&(identical(other.averageProtein, _this.averageProtein) || other.averageProtein == _this.averageProtein)&&(identical(other.averageNetCarbs, _this.averageNetCarbs) || other.averageNetCarbs == _this.averageNetCarbs)&&(identical(other.waterGoalDays, _this.waterGoalDays) || other.waterGoalDays == _this.waterGoalDays)&&(identical(other.weightChangeKg, _this.weightChangeKg) || other.weightChangeKg == _this.weightChangeKg));
}


@override
int get hashCode {
  final _this = this as WeeklyReport;
  return Object.hash(runtimeType,_this.firstDay,_this.lastDay,_this.mealDays,_this.waterDays,_this.fastingSessions,_this.fastingTime,_this.sync,_this.energyDays,_this.proteinDays,_this.carbDays,_this.averageKcal,_this.averageProtein,_this.averageNetCarbs,_this.waterGoalDays,_this.weightChangeKg);
}

@override
String toString() {
  final _this = this as WeeklyReport;
  return 'WeeklyReport(firstDay: ${_this.firstDay}, lastDay: ${_this.lastDay}, mealDays: ${_this.mealDays}, waterDays: ${_this.waterDays}, fastingSessions: ${_this.fastingSessions}, fastingTime: ${_this.fastingTime}, sync: ${_this.sync}, energyDays: ${_this.energyDays}, proteinDays: ${_this.proteinDays}, carbDays: ${_this.carbDays}, averageKcal: ${_this.averageKcal}, averageProtein: ${_this.averageProtein}, averageNetCarbs: ${_this.averageNetCarbs}, waterGoalDays: ${_this.waterGoalDays}, weightChangeKg: ${_this.weightChangeKg})';
}


}

/// @nodoc
abstract mixin class $WeeklyReportCopyWith<$Res>  {
  factory $WeeklyReportCopyWith(WeeklyReport value, $Res Function(WeeklyReport) _then) = _$WeeklyReportCopyWithImpl;
@useResult
$Res call({
 DateTime firstDay, DateTime lastDay, int mealDays, int waterDays, int fastingSessions, Duration fastingTime, WellnessSync sync, int energyDays, int proteinDays, int carbDays, double? averageKcal, double? averageProtein, double? averageNetCarbs, int? waterGoalDays, double? weightChangeKg
});




}
/// @nodoc
class _$WeeklyReportCopyWithImpl<$Res>
    implements $WeeklyReportCopyWith<$Res> {
  _$WeeklyReportCopyWithImpl(this._self, this._then);

  final WeeklyReport _self;
  final $Res Function(WeeklyReport) _then;

/// Create a copy of WeeklyReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstDay = null,Object? lastDay = null,Object? mealDays = null,Object? waterDays = null,Object? fastingSessions = null,Object? fastingTime = null,Object? sync = null,Object? energyDays = null,Object? proteinDays = null,Object? carbDays = null,Object? averageKcal = freezed,Object? averageProtein = freezed,Object? averageNetCarbs = freezed,Object? waterGoalDays = freezed,Object? weightChangeKg = freezed,}) {
  return _then(WeeklyReport(
firstDay: null == firstDay ? _self.firstDay : firstDay // ignore: cast_nullable_to_non_nullable
as DateTime,lastDay: null == lastDay ? _self.lastDay : lastDay // ignore: cast_nullable_to_non_nullable
as DateTime,mealDays: null == mealDays ? _self.mealDays : mealDays // ignore: cast_nullable_to_non_nullable
as int,waterDays: null == waterDays ? _self.waterDays : waterDays // ignore: cast_nullable_to_non_nullable
as int,fastingSessions: null == fastingSessions ? _self.fastingSessions : fastingSessions // ignore: cast_nullable_to_non_nullable
as int,fastingTime: null == fastingTime ? _self.fastingTime : fastingTime // ignore: cast_nullable_to_non_nullable
as Duration,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,energyDays: null == energyDays ? _self.energyDays : energyDays // ignore: cast_nullable_to_non_nullable
as int,proteinDays: null == proteinDays ? _self.proteinDays : proteinDays // ignore: cast_nullable_to_non_nullable
as int,carbDays: null == carbDays ? _self.carbDays : carbDays // ignore: cast_nullable_to_non_nullable
as int,averageKcal: freezed == averageKcal ? _self.averageKcal : averageKcal // ignore: cast_nullable_to_non_nullable
as double?,averageProtein: freezed == averageProtein ? _self.averageProtein : averageProtein // ignore: cast_nullable_to_non_nullable
as double?,averageNetCarbs: freezed == averageNetCarbs ? _self.averageNetCarbs : averageNetCarbs // ignore: cast_nullable_to_non_nullable
as double?,waterGoalDays: freezed == waterGoalDays ? _self.waterGoalDays : waterGoalDays // ignore: cast_nullable_to_non_nullable
as int?,weightChangeKg: freezed == weightChangeKg ? _self.weightChangeKg : weightChangeKg // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [WeeklyReport].
extension WeeklyReportPatterns on WeeklyReport {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeeklyReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeeklyReport() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeeklyReport value)  $default,){
final _that = this;
switch (_that) {
case _WeeklyReport():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeeklyReport value)?  $default,){
final _that = this;
switch (_that) {
case _WeeklyReport() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime firstDay,  DateTime lastDay,  int mealDays,  int waterDays,  int fastingSessions,  Duration fastingTime,  WellnessSync sync,  int energyDays,  int proteinDays,  int carbDays,  double? averageKcal,  double? averageProtein,  double? averageNetCarbs,  int? waterGoalDays,  double? weightChangeKg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeeklyReport() when $default != null:
return $default(_that.firstDay,_that.lastDay,_that.mealDays,_that.waterDays,_that.fastingSessions,_that.fastingTime,_that.sync,_that.energyDays,_that.proteinDays,_that.carbDays,_that.averageKcal,_that.averageProtein,_that.averageNetCarbs,_that.waterGoalDays,_that.weightChangeKg);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime firstDay,  DateTime lastDay,  int mealDays,  int waterDays,  int fastingSessions,  Duration fastingTime,  WellnessSync sync,  int energyDays,  int proteinDays,  int carbDays,  double? averageKcal,  double? averageProtein,  double? averageNetCarbs,  int? waterGoalDays,  double? weightChangeKg)  $default,) {final _that = this;
switch (_that) {
case _WeeklyReport():
return $default(_that.firstDay,_that.lastDay,_that.mealDays,_that.waterDays,_that.fastingSessions,_that.fastingTime,_that.sync,_that.energyDays,_that.proteinDays,_that.carbDays,_that.averageKcal,_that.averageProtein,_that.averageNetCarbs,_that.waterGoalDays,_that.weightChangeKg);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime firstDay,  DateTime lastDay,  int mealDays,  int waterDays,  int fastingSessions,  Duration fastingTime,  WellnessSync sync,  int energyDays,  int proteinDays,  int carbDays,  double? averageKcal,  double? averageProtein,  double? averageNetCarbs,  int? waterGoalDays,  double? weightChangeKg)?  $default,) {final _that = this;
switch (_that) {
case _WeeklyReport() when $default != null:
return $default(_that.firstDay,_that.lastDay,_that.mealDays,_that.waterDays,_that.fastingSessions,_that.fastingTime,_that.sync,_that.energyDays,_that.proteinDays,_that.carbDays,_that.averageKcal,_that.averageProtein,_that.averageNetCarbs,_that.waterGoalDays,_that.weightChangeKg);case _:
  return null;

}
}

}

/// @nodoc


class _WeeklyReport implements WeeklyReport {
  const _WeeklyReport({required this.firstDay, required this.lastDay, required this.mealDays, required this.waterDays, required this.fastingSessions, required this.fastingTime, required this.sync, required this.energyDays, required this.proteinDays, required this.carbDays, this.averageKcal, this.averageProtein, this.averageNetCarbs, this.waterGoalDays, this.weightChangeKg});


@override final  DateTime firstDay;
@override final  DateTime lastDay;
@override final  int mealDays;
@override final  int waterDays;
@override final  int fastingSessions;
@override final  Duration fastingTime;
@override final  WellnessSync sync;
@override final  int energyDays;
@override final  int proteinDays;
@override final  int carbDays;
@override final  double? averageKcal;
@override final  double? averageProtein;
@override final  double? averageNetCarbs;
@override final  int? waterGoalDays;
@override final  double? weightChangeKg;

/// Create a copy of WeeklyReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeeklyReportCopyWith<_WeeklyReport> get copyWith => __$WeeklyReportCopyWithImpl<_WeeklyReport>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeeklyReport&&(identical(other.firstDay, firstDay) || other.firstDay == firstDay)&&(identical(other.lastDay, lastDay) || other.lastDay == lastDay)&&(identical(other.mealDays, mealDays) || other.mealDays == mealDays)&&(identical(other.waterDays, waterDays) || other.waterDays == waterDays)&&(identical(other.fastingSessions, fastingSessions) || other.fastingSessions == fastingSessions)&&(identical(other.fastingTime, fastingTime) || other.fastingTime == fastingTime)&&(identical(other.sync, sync) || other.sync == sync)&&(identical(other.energyDays, energyDays) || other.energyDays == energyDays)&&(identical(other.proteinDays, proteinDays) || other.proteinDays == proteinDays)&&(identical(other.carbDays, carbDays) || other.carbDays == carbDays)&&(identical(other.averageKcal, averageKcal) || other.averageKcal == averageKcal)&&(identical(other.averageProtein, averageProtein) || other.averageProtein == averageProtein)&&(identical(other.averageNetCarbs, averageNetCarbs) || other.averageNetCarbs == averageNetCarbs)&&(identical(other.waterGoalDays, waterGoalDays) || other.waterGoalDays == waterGoalDays)&&(identical(other.weightChangeKg, weightChangeKg) || other.weightChangeKg == weightChangeKg));
}


@override
int get hashCode {
    return Object.hash(runtimeType,firstDay,lastDay,mealDays,waterDays,fastingSessions,fastingTime,sync,energyDays,proteinDays,carbDays,averageKcal,averageProtein,averageNetCarbs,waterGoalDays,weightChangeKg);
}

@override
String toString() {
    return 'WeeklyReport(firstDay: $firstDay, lastDay: $lastDay, mealDays: $mealDays, waterDays: $waterDays, fastingSessions: $fastingSessions, fastingTime: $fastingTime, sync: $sync, energyDays: $energyDays, proteinDays: $proteinDays, carbDays: $carbDays, averageKcal: $averageKcal, averageProtein: $averageProtein, averageNetCarbs: $averageNetCarbs, waterGoalDays: $waterGoalDays, weightChangeKg: $weightChangeKg)';
}


}

/// @nodoc
abstract mixin class _$WeeklyReportCopyWith<$Res> implements $WeeklyReportCopyWith<$Res> {
  factory _$WeeklyReportCopyWith(_WeeklyReport value, $Res Function(_WeeklyReport) _then) = __$WeeklyReportCopyWithImpl;
@override @useResult
$Res call({
 DateTime firstDay, DateTime lastDay, int mealDays, int waterDays, int fastingSessions, Duration fastingTime, WellnessSync sync, int energyDays, int proteinDays, int carbDays, double? averageKcal, double? averageProtein, double? averageNetCarbs, int? waterGoalDays, double? weightChangeKg
});




}
/// @nodoc
class __$WeeklyReportCopyWithImpl<$Res>
    implements _$WeeklyReportCopyWith<$Res> {
  __$WeeklyReportCopyWithImpl(this._self, this._then);

  final _WeeklyReport _self;
  final $Res Function(_WeeklyReport) _then;

/// Create a copy of WeeklyReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstDay = null,Object? lastDay = null,Object? mealDays = null,Object? waterDays = null,Object? fastingSessions = null,Object? fastingTime = null,Object? sync = null,Object? energyDays = null,Object? proteinDays = null,Object? carbDays = null,Object? averageKcal = freezed,Object? averageProtein = freezed,Object? averageNetCarbs = freezed,Object? waterGoalDays = freezed,Object? weightChangeKg = freezed,}) {
  return _then(_WeeklyReport(
firstDay: null == firstDay ? _self.firstDay : firstDay // ignore: cast_nullable_to_non_nullable
as DateTime,lastDay: null == lastDay ? _self.lastDay : lastDay // ignore: cast_nullable_to_non_nullable
as DateTime,mealDays: null == mealDays ? _self.mealDays : mealDays // ignore: cast_nullable_to_non_nullable
as int,waterDays: null == waterDays ? _self.waterDays : waterDays // ignore: cast_nullable_to_non_nullable
as int,fastingSessions: null == fastingSessions ? _self.fastingSessions : fastingSessions // ignore: cast_nullable_to_non_nullable
as int,fastingTime: null == fastingTime ? _self.fastingTime : fastingTime // ignore: cast_nullable_to_non_nullable
as Duration,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,energyDays: null == energyDays ? _self.energyDays : energyDays // ignore: cast_nullable_to_non_nullable
as int,proteinDays: null == proteinDays ? _self.proteinDays : proteinDays // ignore: cast_nullable_to_non_nullable
as int,carbDays: null == carbDays ? _self.carbDays : carbDays // ignore: cast_nullable_to_non_nullable
as int,averageKcal: freezed == averageKcal ? _self.averageKcal : averageKcal // ignore: cast_nullable_to_non_nullable
as double?,averageProtein: freezed == averageProtein ? _self.averageProtein : averageProtein // ignore: cast_nullable_to_non_nullable
as double?,averageNetCarbs: freezed == averageNetCarbs ? _self.averageNetCarbs : averageNetCarbs // ignore: cast_nullable_to_non_nullable
as double?,waterGoalDays: freezed == waterGoalDays ? _self.waterGoalDays : waterGoalDays // ignore: cast_nullable_to_non_nullable
as int?,weightChangeKg: freezed == weightChangeKg ? _self.weightChangeKg : weightChangeKg // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
