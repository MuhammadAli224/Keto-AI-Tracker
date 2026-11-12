// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellness.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WaterEntry {

 String get id; int get ml; DateTime get recordedAt; String get dayKey; String get timezone; bool get deleted; WellnessSync get sync;
/// Create a copy of WaterEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterEntryCopyWith<WaterEntry> get copyWith => _$WaterEntryCopyWithImpl<WaterEntry>(this as WaterEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WaterEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.ml, _this.ml) || other.ml == _this.ml)&&(identical(other.recordedAt, _this.recordedAt) || other.recordedAt == _this.recordedAt)&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.deleted, _this.deleted) || other.deleted == _this.deleted)&&(identical(other.sync, _this.sync) || other.sync == _this.sync));
}


@override
int get hashCode {
  final _this = this as WaterEntry;
  return Object.hash(runtimeType,_this.id,_this.ml,_this.recordedAt,_this.dayKey,_this.timezone,_this.deleted,_this.sync);
}

@override
String toString() {
  final _this = this as WaterEntry;
  return 'WaterEntry(id: ${_this.id}, ml: ${_this.ml}, recordedAt: ${_this.recordedAt}, dayKey: ${_this.dayKey}, timezone: ${_this.timezone}, deleted: ${_this.deleted}, sync: ${_this.sync})';
}


}

/// @nodoc
abstract mixin class $WaterEntryCopyWith<$Res>  {
  factory $WaterEntryCopyWith(WaterEntry value, $Res Function(WaterEntry) _then) = _$WaterEntryCopyWithImpl;
@useResult
$Res call({
 String id, int ml, DateTime recordedAt, String dayKey, String timezone, bool deleted, WellnessSync sync
});




}
/// @nodoc
class _$WaterEntryCopyWithImpl<$Res>
    implements $WaterEntryCopyWith<$Res> {
  _$WaterEntryCopyWithImpl(this._self, this._then);

  final WaterEntry _self;
  final $Res Function(WaterEntry) _then;

/// Create a copy of WaterEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ml = null,Object? recordedAt = null,Object? dayKey = null,Object? timezone = null,Object? deleted = null,Object? sync = null,}) {
  return _then(WaterEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ml: null == ml ? _self.ml : ml // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterEntry].
extension WaterEntryPatterns on WaterEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterEntry value)  $default,){
final _that = this;
switch (_that) {
case _WaterEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterEntry value)?  $default,){
final _that = this;
switch (_that) {
case _WaterEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int ml,  DateTime recordedAt,  String dayKey,  String timezone,  bool deleted,  WellnessSync sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterEntry() when $default != null:
return $default(_that.id,_that.ml,_that.recordedAt,_that.dayKey,_that.timezone,_that.deleted,_that.sync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int ml,  DateTime recordedAt,  String dayKey,  String timezone,  bool deleted,  WellnessSync sync)  $default,) {final _that = this;
switch (_that) {
case _WaterEntry():
return $default(_that.id,_that.ml,_that.recordedAt,_that.dayKey,_that.timezone,_that.deleted,_that.sync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int ml,  DateTime recordedAt,  String dayKey,  String timezone,  bool deleted,  WellnessSync sync)?  $default,) {final _that = this;
switch (_that) {
case _WaterEntry() when $default != null:
return $default(_that.id,_that.ml,_that.recordedAt,_that.dayKey,_that.timezone,_that.deleted,_that.sync);case _:
  return null;

}
}

}

/// @nodoc


class _WaterEntry implements WaterEntry {
  const _WaterEntry({required this.id, required this.ml, required this.recordedAt, required this.dayKey, required this.timezone, this.deleted = false, this.sync = WellnessSync.cached});


@override final  String id;
@override final  int ml;
@override final  DateTime recordedAt;
@override final  String dayKey;
@override final  String timezone;
@override@JsonKey() final  bool deleted;
@override@JsonKey() final  WellnessSync sync;

/// Create a copy of WaterEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterEntryCopyWith<_WaterEntry> get copyWith => __$WaterEntryCopyWithImpl<_WaterEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.ml, ml) || other.ml == ml)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,ml,recordedAt,dayKey,timezone,deleted,sync);
}

@override
String toString() {
    return 'WaterEntry(id: $id, ml: $ml, recordedAt: $recordedAt, dayKey: $dayKey, timezone: $timezone, deleted: $deleted, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$WaterEntryCopyWith<$Res> implements $WaterEntryCopyWith<$Res> {
  factory _$WaterEntryCopyWith(_WaterEntry value, $Res Function(_WaterEntry) _then) = __$WaterEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, int ml, DateTime recordedAt, String dayKey, String timezone, bool deleted, WellnessSync sync
});




}
/// @nodoc
class __$WaterEntryCopyWithImpl<$Res>
    implements _$WaterEntryCopyWith<$Res> {
  __$WaterEntryCopyWithImpl(this._self, this._then);

  final _WaterEntry _self;
  final $Res Function(_WaterEntry) _then;

/// Create a copy of WaterEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ml = null,Object? recordedAt = null,Object? dayKey = null,Object? timezone = null,Object? deleted = null,Object? sync = null,}) {
  return _then(_WaterEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ml: null == ml ? _self.ml : ml // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}


}

/// @nodoc
mixin _$WaterDay {

 List<WaterEntry> get entries; WellnessSync get sync;
/// Create a copy of WaterDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterDayCopyWith<WaterDay> get copyWith => _$WaterDayCopyWithImpl<WaterDay>(this as WaterDay, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WaterDay;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterDay&&const DeepCollectionEquality().equals(other.entries, _this.entries)&&(identical(other.sync, _this.sync) || other.sync == _this.sync));
}


@override
int get hashCode {
  final _this = this as WaterDay;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.entries),_this.sync);
}

@override
String toString() {
  final _this = this as WaterDay;
  return 'WaterDay(entries: ${_this.entries}, sync: ${_this.sync})';
}


}

/// @nodoc
abstract mixin class $WaterDayCopyWith<$Res>  {
  factory $WaterDayCopyWith(WaterDay value, $Res Function(WaterDay) _then) = _$WaterDayCopyWithImpl;
@useResult
$Res call({
 List<WaterEntry> entries, WellnessSync sync
});




}
/// @nodoc
class _$WaterDayCopyWithImpl<$Res>
    implements $WaterDayCopyWith<$Res> {
  _$WaterDayCopyWithImpl(this._self, this._then);

  final WaterDay _self;
  final $Res Function(WaterDay) _then;

/// Create a copy of WaterDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entries = null,Object? sync = null,}) {
  return _then(WaterDay(
entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<WaterEntry>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterDay].
extension WaterDayPatterns on WaterDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterDay value)  $default,){
final _that = this;
switch (_that) {
case _WaterDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterDay value)?  $default,){
final _that = this;
switch (_that) {
case _WaterDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WaterEntry> entries,  WellnessSync sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterDay() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WaterEntry> entries,  WellnessSync sync)  $default,) {final _that = this;
switch (_that) {
case _WaterDay():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WaterEntry> entries,  WellnessSync sync)?  $default,) {final _that = this;
switch (_that) {
case _WaterDay() when $default != null:
return $default(_that.entries,_that.sync);case _:
  return null;

}
}

}

/// @nodoc


class _WaterDay extends WaterDay {
  const _WaterDay({required  List<WaterEntry> entries, required this.sync}): _entries = entries,super._();


 final  List<WaterEntry> _entries;
@override List<WaterEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override final  WellnessSync sync;

/// Create a copy of WaterDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterDayCopyWith<_WaterDay> get copyWith => __$WaterDayCopyWithImpl<_WaterDay>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterDay&&const DeepCollectionEquality().equals(other.entries, _entries)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries),sync);
}

@override
String toString() {
    return 'WaterDay(entries: $entries, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$WaterDayCopyWith<$Res> implements $WaterDayCopyWith<$Res> {
  factory _$WaterDayCopyWith(_WaterDay value, $Res Function(_WaterDay) _then) = __$WaterDayCopyWithImpl;
@override @useResult
$Res call({
 List<WaterEntry> entries, WellnessSync sync
});




}
/// @nodoc
class __$WaterDayCopyWithImpl<$Res>
    implements _$WaterDayCopyWith<$Res> {
  __$WaterDayCopyWithImpl(this._self, this._then);

  final _WaterDay _self;
  final $Res Function(_WaterDay) _then;

/// Create a copy of WaterDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entries = null,Object? sync = null,}) {
  return _then(_WaterDay(
entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<WaterEntry>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}


}

/// @nodoc
mixin _$FastSession {

 String get id; DateTime get startedAt; DateTime get plannedEndAt; String get timezone; FastStatus get status; DateTime? get actualEndAt;
/// Create a copy of FastSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FastSessionCopyWith<FastSession> get copyWith => _$FastSessionCopyWithImpl<FastSession>(this as FastSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FastSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FastSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.plannedEndAt, _this.plannedEndAt) || other.plannedEndAt == _this.plannedEndAt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.actualEndAt, _this.actualEndAt) || other.actualEndAt == _this.actualEndAt));
}


@override
int get hashCode {
  final _this = this as FastSession;
  return Object.hash(runtimeType,_this.id,_this.startedAt,_this.plannedEndAt,_this.timezone,_this.status,_this.actualEndAt);
}

@override
String toString() {
  final _this = this as FastSession;
  return 'FastSession(id: ${_this.id}, startedAt: ${_this.startedAt}, plannedEndAt: ${_this.plannedEndAt}, timezone: ${_this.timezone}, status: ${_this.status}, actualEndAt: ${_this.actualEndAt})';
}


}

/// @nodoc
abstract mixin class $FastSessionCopyWith<$Res>  {
  factory $FastSessionCopyWith(FastSession value, $Res Function(FastSession) _then) = _$FastSessionCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startedAt, DateTime plannedEndAt, String timezone, FastStatus status, DateTime? actualEndAt
});




}
/// @nodoc
class _$FastSessionCopyWithImpl<$Res>
    implements $FastSessionCopyWith<$Res> {
  _$FastSessionCopyWithImpl(this._self, this._then);

  final FastSession _self;
  final $Res Function(FastSession) _then;

/// Create a copy of FastSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = null,Object? plannedEndAt = null,Object? timezone = null,Object? status = null,Object? actualEndAt = freezed,}) {
  return _then(FastSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,plannedEndAt: null == plannedEndAt ? _self.plannedEndAt : plannedEndAt // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FastStatus,actualEndAt: freezed == actualEndAt ? _self.actualEndAt : actualEndAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FastSession].
extension FastSessionPatterns on FastSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FastSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FastSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FastSession value)  $default,){
final _that = this;
switch (_that) {
case _FastSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FastSession value)?  $default,){
final _that = this;
switch (_that) {
case _FastSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  DateTime plannedEndAt,  String timezone,  FastStatus status,  DateTime? actualEndAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FastSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.plannedEndAt,_that.timezone,_that.status,_that.actualEndAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startedAt,  DateTime plannedEndAt,  String timezone,  FastStatus status,  DateTime? actualEndAt)  $default,) {final _that = this;
switch (_that) {
case _FastSession():
return $default(_that.id,_that.startedAt,_that.plannedEndAt,_that.timezone,_that.status,_that.actualEndAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startedAt,  DateTime plannedEndAt,  String timezone,  FastStatus status,  DateTime? actualEndAt)?  $default,) {final _that = this;
switch (_that) {
case _FastSession() when $default != null:
return $default(_that.id,_that.startedAt,_that.plannedEndAt,_that.timezone,_that.status,_that.actualEndAt);case _:
  return null;

}
}

}

/// @nodoc


class _FastSession extends FastSession {
  const _FastSession({required this.id, required this.startedAt, required this.plannedEndAt, required this.timezone, required this.status, this.actualEndAt}): super._();


@override final  String id;
@override final  DateTime startedAt;
@override final  DateTime plannedEndAt;
@override final  String timezone;
@override final  FastStatus status;
@override final  DateTime? actualEndAt;

/// Create a copy of FastSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FastSessionCopyWith<_FastSession> get copyWith => __$FastSessionCopyWithImpl<_FastSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FastSession&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.plannedEndAt, plannedEndAt) || other.plannedEndAt == plannedEndAt)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.status, status) || other.status == status)&&(identical(other.actualEndAt, actualEndAt) || other.actualEndAt == actualEndAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,startedAt,plannedEndAt,timezone,status,actualEndAt);
}

@override
String toString() {
    return 'FastSession(id: $id, startedAt: $startedAt, plannedEndAt: $plannedEndAt, timezone: $timezone, status: $status, actualEndAt: $actualEndAt)';
}


}

/// @nodoc
abstract mixin class _$FastSessionCopyWith<$Res> implements $FastSessionCopyWith<$Res> {
  factory _$FastSessionCopyWith(_FastSession value, $Res Function(_FastSession) _then) = __$FastSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startedAt, DateTime plannedEndAt, String timezone, FastStatus status, DateTime? actualEndAt
});




}
/// @nodoc
class __$FastSessionCopyWithImpl<$Res>
    implements _$FastSessionCopyWith<$Res> {
  __$FastSessionCopyWithImpl(this._self, this._then);

  final _FastSession _self;
  final $Res Function(_FastSession) _then;

/// Create a copy of FastSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = null,Object? plannedEndAt = null,Object? timezone = null,Object? status = null,Object? actualEndAt = freezed,}) {
  return _then(_FastSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,plannedEndAt: null == plannedEndAt ? _self.plannedEndAt : plannedEndAt // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as FastStatus,actualEndAt: freezed == actualEndAt ? _self.actualEndAt : actualEndAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$FastSnapshot {

 FastSession? get session; WellnessSync get sync;
/// Create a copy of FastSnapshot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FastSnapshotCopyWith<FastSnapshot> get copyWith => _$FastSnapshotCopyWithImpl<FastSnapshot>(this as FastSnapshot, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FastSnapshot;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FastSnapshot&&(identical(other.session, _this.session) || other.session == _this.session)&&(identical(other.sync, _this.sync) || other.sync == _this.sync));
}


@override
int get hashCode {
  final _this = this as FastSnapshot;
  return Object.hash(runtimeType,_this.session,_this.sync);
}

@override
String toString() {
  final _this = this as FastSnapshot;
  return 'FastSnapshot(session: ${_this.session}, sync: ${_this.sync})';
}


}

/// @nodoc
abstract mixin class $FastSnapshotCopyWith<$Res>  {
  factory $FastSnapshotCopyWith(FastSnapshot value, $Res Function(FastSnapshot) _then) = _$FastSnapshotCopyWithImpl;
@useResult
$Res call({
 FastSession? session, WellnessSync sync
});


$FastSessionCopyWith<$Res>? get session;

}
/// @nodoc
class _$FastSnapshotCopyWithImpl<$Res>
    implements $FastSnapshotCopyWith<$Res> {
  _$FastSnapshotCopyWithImpl(this._self, this._then);

  final FastSnapshot _self;
  final $Res Function(FastSnapshot) _then;

/// Create a copy of FastSnapshot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = freezed,Object? sync = null,}) {
  return _then(FastSnapshot(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as FastSession?,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}
/// Create a copy of FastSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FastSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $FastSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [FastSnapshot].
extension FastSnapshotPatterns on FastSnapshot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FastSnapshot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FastSnapshot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FastSnapshot value)  $default,){
final _that = this;
switch (_that) {
case _FastSnapshot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FastSnapshot value)?  $default,){
final _that = this;
switch (_that) {
case _FastSnapshot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FastSession? session,  WellnessSync sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FastSnapshot() when $default != null:
return $default(_that.session,_that.sync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FastSession? session,  WellnessSync sync)  $default,) {final _that = this;
switch (_that) {
case _FastSnapshot():
return $default(_that.session,_that.sync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FastSession? session,  WellnessSync sync)?  $default,) {final _that = this;
switch (_that) {
case _FastSnapshot() when $default != null:
return $default(_that.session,_that.sync);case _:
  return null;

}
}

}

/// @nodoc


class _FastSnapshot implements FastSnapshot {
  const _FastSnapshot({this.session, required this.sync});


@override final  FastSession? session;
@override final  WellnessSync sync;

/// Create a copy of FastSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FastSnapshotCopyWith<_FastSnapshot> get copyWith => __$FastSnapshotCopyWithImpl<_FastSnapshot>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FastSnapshot&&(identical(other.session, session) || other.session == session)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode {
    return Object.hash(runtimeType,session,sync);
}

@override
String toString() {
    return 'FastSnapshot(session: $session, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$FastSnapshotCopyWith<$Res> implements $FastSnapshotCopyWith<$Res> {
  factory _$FastSnapshotCopyWith(_FastSnapshot value, $Res Function(_FastSnapshot) _then) = __$FastSnapshotCopyWithImpl;
@override @useResult
$Res call({
 FastSession? session, WellnessSync sync
});


@override $FastSessionCopyWith<$Res>? get session;

}
/// @nodoc
class __$FastSnapshotCopyWithImpl<$Res>
    implements _$FastSnapshotCopyWith<$Res> {
  __$FastSnapshotCopyWithImpl(this._self, this._then);

  final _FastSnapshot _self;
  final $Res Function(_FastSnapshot) _then;

/// Create a copy of FastSnapshot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = freezed,Object? sync = null,}) {
  return _then(_FastSnapshot(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as FastSession?,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as WellnessSync,
  ));
}

/// Create a copy of FastSnapshot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FastSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
    return null;
  }

  return $FastSessionCopyWith<$Res>(_self.session!, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
