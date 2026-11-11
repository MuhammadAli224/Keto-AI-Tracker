// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellness_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WaterDto {

 String get id; int get ml; DateTime get recordedAt; String get dayKey; String get timezone; bool get deleted;
/// Create a copy of WaterDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterDtoCopyWith<WaterDto> get copyWith => _$WaterDtoCopyWithImpl<WaterDto>(this as WaterDto, _$identity);

  /// Serializes this WaterDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WaterDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WaterDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.ml, _this.ml) || other.ml == _this.ml)&&(identical(other.recordedAt, _this.recordedAt) || other.recordedAt == _this.recordedAt)&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.deleted, _this.deleted) || other.deleted == _this.deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WaterDto;
  return Object.hash(runtimeType,_this.id,_this.ml,_this.recordedAt,_this.dayKey,_this.timezone,_this.deleted);
}

@override
String toString() {
  final _this = this as WaterDto;
  return 'WaterDto(id: ${_this.id}, ml: ${_this.ml}, recordedAt: ${_this.recordedAt}, dayKey: ${_this.dayKey}, timezone: ${_this.timezone}, deleted: ${_this.deleted})';
}


}

/// @nodoc
abstract mixin class $WaterDtoCopyWith<$Res>  {
  factory $WaterDtoCopyWith(WaterDto value, $Res Function(WaterDto) _then) = _$WaterDtoCopyWithImpl;
@useResult
$Res call({
 String id, int ml, DateTime recordedAt, String dayKey, String timezone, bool deleted
});




}
/// @nodoc
class _$WaterDtoCopyWithImpl<$Res>
    implements $WaterDtoCopyWith<$Res> {
  _$WaterDtoCopyWithImpl(this._self, this._then);

  final WaterDto _self;
  final $Res Function(WaterDto) _then;

/// Create a copy of WaterDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ml = null,Object? recordedAt = null,Object? dayKey = null,Object? timezone = null,Object? deleted = null,}) {
  return _then(WaterDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ml: null == ml ? _self.ml : ml // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WaterDto].
extension WaterDtoPatterns on WaterDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WaterDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WaterDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WaterDto value)  $default,){
final _that = this;
switch (_that) {
case _WaterDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WaterDto value)?  $default,){
final _that = this;
switch (_that) {
case _WaterDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int ml,  DateTime recordedAt,  String dayKey,  String timezone,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WaterDto() when $default != null:
return $default(_that.id,_that.ml,_that.recordedAt,_that.dayKey,_that.timezone,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int ml,  DateTime recordedAt,  String dayKey,  String timezone,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _WaterDto():
return $default(_that.id,_that.ml,_that.recordedAt,_that.dayKey,_that.timezone,_that.deleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int ml,  DateTime recordedAt,  String dayKey,  String timezone,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _WaterDto() when $default != null:
return $default(_that.id,_that.ml,_that.recordedAt,_that.dayKey,_that.timezone,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WaterDto implements WaterDto {
  const _WaterDto({required this.id, required this.ml, required this.recordedAt, required this.dayKey, required this.timezone, this.deleted = false});
  factory _WaterDto.fromJson(Map<String, dynamic> json) => _$WaterDtoFromJson(json);

@override final  String id;
@override final  int ml;
@override final  DateTime recordedAt;
@override final  String dayKey;
@override final  String timezone;
@override@JsonKey() final  bool deleted;

/// Create a copy of WaterDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WaterDtoCopyWith<_WaterDto> get copyWith => __$WaterDtoCopyWithImpl<_WaterDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WaterDto&&(identical(other.id, id) || other.id == id)&&(identical(other.ml, ml) || other.ml == ml)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt)&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,ml,recordedAt,dayKey,timezone,deleted);
}

@override
String toString() {
    return 'WaterDto(id: $id, ml: $ml, recordedAt: $recordedAt, dayKey: $dayKey, timezone: $timezone, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$WaterDtoCopyWith<$Res> implements $WaterDtoCopyWith<$Res> {
  factory _$WaterDtoCopyWith(_WaterDto value, $Res Function(_WaterDto) _then) = __$WaterDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, int ml, DateTime recordedAt, String dayKey, String timezone, bool deleted
});




}
/// @nodoc
class __$WaterDtoCopyWithImpl<$Res>
    implements _$WaterDtoCopyWith<$Res> {
  __$WaterDtoCopyWithImpl(this._self, this._then);

  final _WaterDto _self;
  final $Res Function(_WaterDto) _then;

/// Create a copy of WaterDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ml = null,Object? recordedAt = null,Object? dayKey = null,Object? timezone = null,Object? deleted = null,}) {
  return _then(_WaterDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ml: null == ml ? _self.ml : ml // ignore: cast_nullable_to_non_nullable
as int,recordedAt: null == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$FastDto {

 String get id; DateTime get startedAt; DateTime get plannedEndAt; String get timezone; FastStatus get status; DateTime? get actualEndAt;
/// Create a copy of FastDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FastDtoCopyWith<FastDto> get copyWith => _$FastDtoCopyWithImpl<FastDto>(this as FastDto, _$identity);

  /// Serializes this FastDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FastDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FastDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startedAt, _this.startedAt) || other.startedAt == _this.startedAt)&&(identical(other.plannedEndAt, _this.plannedEndAt) || other.plannedEndAt == _this.plannedEndAt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.actualEndAt, _this.actualEndAt) || other.actualEndAt == _this.actualEndAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FastDto;
  return Object.hash(runtimeType,_this.id,_this.startedAt,_this.plannedEndAt,_this.timezone,_this.status,_this.actualEndAt);
}

@override
String toString() {
  final _this = this as FastDto;
  return 'FastDto(id: ${_this.id}, startedAt: ${_this.startedAt}, plannedEndAt: ${_this.plannedEndAt}, timezone: ${_this.timezone}, status: ${_this.status}, actualEndAt: ${_this.actualEndAt})';
}


}

/// @nodoc
abstract mixin class $FastDtoCopyWith<$Res>  {
  factory $FastDtoCopyWith(FastDto value, $Res Function(FastDto) _then) = _$FastDtoCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startedAt, DateTime plannedEndAt, String timezone, FastStatus status, DateTime? actualEndAt
});




}
/// @nodoc
class _$FastDtoCopyWithImpl<$Res>
    implements $FastDtoCopyWith<$Res> {
  _$FastDtoCopyWithImpl(this._self, this._then);

  final FastDto _self;
  final $Res Function(FastDto) _then;

/// Create a copy of FastDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startedAt = null,Object? plannedEndAt = null,Object? timezone = null,Object? status = null,Object? actualEndAt = freezed,}) {
  return _then(FastDto(
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


/// Adds pattern-matching-related methods to [FastDto].
extension FastDtoPatterns on FastDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FastDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FastDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FastDto value)  $default,){
final _that = this;
switch (_that) {
case _FastDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FastDto value)?  $default,){
final _that = this;
switch (_that) {
case _FastDto() when $default != null:
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
case _FastDto() when $default != null:
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
case _FastDto():
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
case _FastDto() when $default != null:
return $default(_that.id,_that.startedAt,_that.plannedEndAt,_that.timezone,_that.status,_that.actualEndAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FastDto implements FastDto {
  const _FastDto({required this.id, required this.startedAt, required this.plannedEndAt, required this.timezone, required this.status, this.actualEndAt});
  factory _FastDto.fromJson(Map<String, dynamic> json) => _$FastDtoFromJson(json);

@override final  String id;
@override final  DateTime startedAt;
@override final  DateTime plannedEndAt;
@override final  String timezone;
@override final  FastStatus status;
@override final  DateTime? actualEndAt;

/// Create a copy of FastDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FastDtoCopyWith<_FastDto> get copyWith => __$FastDtoCopyWithImpl<_FastDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FastDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FastDto&&(identical(other.id, id) || other.id == id)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.plannedEndAt, plannedEndAt) || other.plannedEndAt == plannedEndAt)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.status, status) || other.status == status)&&(identical(other.actualEndAt, actualEndAt) || other.actualEndAt == actualEndAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startedAt,plannedEndAt,timezone,status,actualEndAt);
}

@override
String toString() {
    return 'FastDto(id: $id, startedAt: $startedAt, plannedEndAt: $plannedEndAt, timezone: $timezone, status: $status, actualEndAt: $actualEndAt)';
}


}

/// @nodoc
abstract mixin class _$FastDtoCopyWith<$Res> implements $FastDtoCopyWith<$Res> {
  factory _$FastDtoCopyWith(_FastDto value, $Res Function(_FastDto) _then) = __$FastDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startedAt, DateTime plannedEndAt, String timezone, FastStatus status, DateTime? actualEndAt
});




}
/// @nodoc
class __$FastDtoCopyWithImpl<$Res>
    implements _$FastDtoCopyWith<$Res> {
  __$FastDtoCopyWithImpl(this._self, this._then);

  final _FastDto _self;
  final $Res Function(_FastDto) _then;

/// Create a copy of FastDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startedAt = null,Object? plannedEndAt = null,Object? timezone = null,Object? status = null,Object? actualEndAt = freezed,}) {
  return _then(_FastDto(
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

// dart format on
