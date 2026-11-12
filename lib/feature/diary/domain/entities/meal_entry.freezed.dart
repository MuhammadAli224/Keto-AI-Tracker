// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealEntry {

 String get id; String get dayKey; DateTime get eatenAtUtc; String get timezone; MealType get type; MealStatus get status; List<Serving> get servings; String? get localImageRef; DateTime? get updatedAt; DiarySync get sync;
/// Create a copy of MealEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealEntryCopyWith<MealEntry> get copyWith => _$MealEntryCopyWithImpl<MealEntry>(this as MealEntry, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MealEntry;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealEntry&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&(identical(other.eatenAtUtc, _this.eatenAtUtc) || other.eatenAtUtc == _this.eatenAtUtc)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.servings, _this.servings)&&(identical(other.localImageRef, _this.localImageRef) || other.localImageRef == _this.localImageRef)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.sync, _this.sync) || other.sync == _this.sync));
}


@override
int get hashCode {
  final _this = this as MealEntry;
  return Object.hash(runtimeType,_this.id,_this.dayKey,_this.eatenAtUtc,_this.timezone,_this.type,_this.status,const DeepCollectionEquality().hash(_this.servings),_this.localImageRef,_this.updatedAt,_this.sync);
}

@override
String toString() {
  final _this = this as MealEntry;
  return 'MealEntry(id: ${_this.id}, dayKey: ${_this.dayKey}, eatenAtUtc: ${_this.eatenAtUtc}, timezone: ${_this.timezone}, type: ${_this.type}, status: ${_this.status}, servings: ${_this.servings}, localImageRef: ${_this.localImageRef}, updatedAt: ${_this.updatedAt}, sync: ${_this.sync})';
}


}

/// @nodoc
abstract mixin class $MealEntryCopyWith<$Res>  {
  factory $MealEntryCopyWith(MealEntry value, $Res Function(MealEntry) _then) = _$MealEntryCopyWithImpl;
@useResult
$Res call({
 String id, String dayKey, DateTime eatenAtUtc, String timezone, MealType type, MealStatus status, List<Serving> servings, String? localImageRef, DateTime? updatedAt, DiarySync sync
});




}
/// @nodoc
class _$MealEntryCopyWithImpl<$Res>
    implements $MealEntryCopyWith<$Res> {
  _$MealEntryCopyWithImpl(this._self, this._then);

  final MealEntry _self;
  final $Res Function(MealEntry) _then;

/// Create a copy of MealEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dayKey = null,Object? eatenAtUtc = null,Object? timezone = null,Object? type = null,Object? status = null,Object? servings = null,Object? localImageRef = freezed,Object? updatedAt = freezed,Object? sync = null,}) {
  return _then(MealEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,eatenAtUtc: null == eatenAtUtc ? _self.eatenAtUtc : eatenAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MealType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealStatus,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as List<Serving>,localImageRef: freezed == localImageRef ? _self.localImageRef : localImageRef // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as DiarySync,
  ));
}

}


/// Adds pattern-matching-related methods to [MealEntry].
extension MealEntryPatterns on MealEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealEntry value)  $default,){
final _that = this;
switch (_that) {
case _MealEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MealEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String dayKey,  DateTime eatenAtUtc,  String timezone,  MealType type,  MealStatus status,  List<Serving> servings,  String? localImageRef,  DateTime? updatedAt,  DiarySync sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealEntry() when $default != null:
return $default(_that.id,_that.dayKey,_that.eatenAtUtc,_that.timezone,_that.type,_that.status,_that.servings,_that.localImageRef,_that.updatedAt,_that.sync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String dayKey,  DateTime eatenAtUtc,  String timezone,  MealType type,  MealStatus status,  List<Serving> servings,  String? localImageRef,  DateTime? updatedAt,  DiarySync sync)  $default,) {final _that = this;
switch (_that) {
case _MealEntry():
return $default(_that.id,_that.dayKey,_that.eatenAtUtc,_that.timezone,_that.type,_that.status,_that.servings,_that.localImageRef,_that.updatedAt,_that.sync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String dayKey,  DateTime eatenAtUtc,  String timezone,  MealType type,  MealStatus status,  List<Serving> servings,  String? localImageRef,  DateTime? updatedAt,  DiarySync sync)?  $default,) {final _that = this;
switch (_that) {
case _MealEntry() when $default != null:
return $default(_that.id,_that.dayKey,_that.eatenAtUtc,_that.timezone,_that.type,_that.status,_that.servings,_that.localImageRef,_that.updatedAt,_that.sync);case _:
  return null;

}
}

}

/// @nodoc


class _MealEntry extends MealEntry {
  const _MealEntry({required this.id, required this.dayKey, required this.eatenAtUtc, required this.timezone, required this.type, required this.status, required  List<Serving> servings, this.localImageRef, this.updatedAt, this.sync = DiarySync.cached}): _servings = servings,super._();


@override final  String id;
@override final  String dayKey;
@override final  DateTime eatenAtUtc;
@override final  String timezone;
@override final  MealType type;
@override final  MealStatus status;
 final  List<Serving> _servings;
@override List<Serving> get servings {
  if (_servings is EqualUnmodifiableListView) return _servings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_servings);
}

@override final  String? localImageRef;
@override final  DateTime? updatedAt;
@override@JsonKey() final  DiarySync sync;

/// Create a copy of MealEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealEntryCopyWith<_MealEntry> get copyWith => __$MealEntryCopyWithImpl<_MealEntry>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&(identical(other.eatenAtUtc, eatenAtUtc) || other.eatenAtUtc == eatenAtUtc)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.servings, _servings)&&(identical(other.localImageRef, localImageRef) || other.localImageRef == localImageRef)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,dayKey,eatenAtUtc,timezone,type,status,const DeepCollectionEquality().hash(_servings),localImageRef,updatedAt,sync);
}

@override
String toString() {
    return 'MealEntry(id: $id, dayKey: $dayKey, eatenAtUtc: $eatenAtUtc, timezone: $timezone, type: $type, status: $status, servings: $servings, localImageRef: $localImageRef, updatedAt: $updatedAt, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$MealEntryCopyWith<$Res> implements $MealEntryCopyWith<$Res> {
  factory _$MealEntryCopyWith(_MealEntry value, $Res Function(_MealEntry) _then) = __$MealEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String dayKey, DateTime eatenAtUtc, String timezone, MealType type, MealStatus status, List<Serving> servings, String? localImageRef, DateTime? updatedAt, DiarySync sync
});




}
/// @nodoc
class __$MealEntryCopyWithImpl<$Res>
    implements _$MealEntryCopyWith<$Res> {
  __$MealEntryCopyWithImpl(this._self, this._then);

  final _MealEntry _self;
  final $Res Function(_MealEntry) _then;

/// Create a copy of MealEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dayKey = null,Object? eatenAtUtc = null,Object? timezone = null,Object? type = null,Object? status = null,Object? servings = null,Object? localImageRef = freezed,Object? updatedAt = freezed,Object? sync = null,}) {
  return _then(_MealEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,eatenAtUtc: null == eatenAtUtc ? _self.eatenAtUtc : eatenAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MealType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealStatus,servings: null == servings ? _self._servings : servings // ignore: cast_nullable_to_non_nullable
as List<Serving>,localImageRef: freezed == localImageRef ? _self.localImageRef : localImageRef // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as DiarySync,
  ));
}


}

/// @nodoc
mixin _$DiaryDay {

 String get dayKey; List<MealEntry> get entries; DiarySync get sync;
/// Create a copy of DiaryDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryDayCopyWith<DiaryDay> get copyWith => _$DiaryDayCopyWithImpl<DiaryDay>(this as DiaryDay, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DiaryDay;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryDay&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&const DeepCollectionEquality().equals(other.entries, _this.entries)&&(identical(other.sync, _this.sync) || other.sync == _this.sync));
}


@override
int get hashCode {
  final _this = this as DiaryDay;
  return Object.hash(runtimeType,_this.dayKey,const DeepCollectionEquality().hash(_this.entries),_this.sync);
}

@override
String toString() {
  final _this = this as DiaryDay;
  return 'DiaryDay(dayKey: ${_this.dayKey}, entries: ${_this.entries}, sync: ${_this.sync})';
}


}

/// @nodoc
abstract mixin class $DiaryDayCopyWith<$Res>  {
  factory $DiaryDayCopyWith(DiaryDay value, $Res Function(DiaryDay) _then) = _$DiaryDayCopyWithImpl;
@useResult
$Res call({
 String dayKey, List<MealEntry> entries, DiarySync sync
});




}
/// @nodoc
class _$DiaryDayCopyWithImpl<$Res>
    implements $DiaryDayCopyWith<$Res> {
  _$DiaryDayCopyWithImpl(this._self, this._then);

  final DiaryDay _self;
  final $Res Function(DiaryDay) _then;

/// Create a copy of DiaryDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayKey = null,Object? entries = null,Object? sync = null,}) {
  return _then(DiaryDay(
dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<MealEntry>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as DiarySync,
  ));
}

}


/// Adds pattern-matching-related methods to [DiaryDay].
extension DiaryDayPatterns on DiaryDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiaryDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiaryDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiaryDay value)  $default,){
final _that = this;
switch (_that) {
case _DiaryDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiaryDay value)?  $default,){
final _that = this;
switch (_that) {
case _DiaryDay() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dayKey,  List<MealEntry> entries,  DiarySync sync)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiaryDay() when $default != null:
return $default(_that.dayKey,_that.entries,_that.sync);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dayKey,  List<MealEntry> entries,  DiarySync sync)  $default,) {final _that = this;
switch (_that) {
case _DiaryDay():
return $default(_that.dayKey,_that.entries,_that.sync);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dayKey,  List<MealEntry> entries,  DiarySync sync)?  $default,) {final _that = this;
switch (_that) {
case _DiaryDay() when $default != null:
return $default(_that.dayKey,_that.entries,_that.sync);case _:
  return null;

}
}

}

/// @nodoc


class _DiaryDay extends DiaryDay {
  const _DiaryDay({required this.dayKey, required  List<MealEntry> entries, required this.sync}): _entries = entries,super._();


@override final  String dayKey;
 final  List<MealEntry> _entries;
@override List<MealEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override final  DiarySync sync;

/// Create a copy of DiaryDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiaryDayCopyWith<_DiaryDay> get copyWith => __$DiaryDayCopyWithImpl<_DiaryDay>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiaryDay&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&const DeepCollectionEquality().equals(other.entries, _entries)&&(identical(other.sync, sync) || other.sync == sync));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dayKey,const DeepCollectionEquality().hash(_entries),sync);
}

@override
String toString() {
    return 'DiaryDay(dayKey: $dayKey, entries: $entries, sync: $sync)';
}


}

/// @nodoc
abstract mixin class _$DiaryDayCopyWith<$Res> implements $DiaryDayCopyWith<$Res> {
  factory _$DiaryDayCopyWith(_DiaryDay value, $Res Function(_DiaryDay) _then) = __$DiaryDayCopyWithImpl;
@override @useResult
$Res call({
 String dayKey, List<MealEntry> entries, DiarySync sync
});




}
/// @nodoc
class __$DiaryDayCopyWithImpl<$Res>
    implements _$DiaryDayCopyWith<$Res> {
  __$DiaryDayCopyWithImpl(this._self, this._then);

  final _DiaryDay _self;
  final $Res Function(_DiaryDay) _then;

/// Create a copy of DiaryDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayKey = null,Object? entries = null,Object? sync = null,}) {
  return _then(_DiaryDay(
dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<MealEntry>,sync: null == sync ? _self.sync : sync // ignore: cast_nullable_to_non_nullable
as DiarySync,
  ));
}


}

// dart format on
