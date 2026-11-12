// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealDto {

 String get id; String get dayKey; DateTime get eatenAtUtc; String get timezone; MealType get type; MealStatus get status; List<ServingDto> get servings; DateTime? get updatedAt;
/// Create a copy of MealDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealDtoCopyWith<MealDto> get copyWith => _$MealDtoCopyWithImpl<MealDto>(this as MealDto, _$identity);

  /// Serializes this MealDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MealDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&(identical(other.eatenAtUtc, _this.eatenAtUtc) || other.eatenAtUtc == _this.eatenAtUtc)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.servings, _this.servings)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MealDto;
  return Object.hash(runtimeType,_this.id,_this.dayKey,_this.eatenAtUtc,_this.timezone,_this.type,_this.status,const DeepCollectionEquality().hash(_this.servings),_this.updatedAt);
}

@override
String toString() {
  final _this = this as MealDto;
  return 'MealDto(id: ${_this.id}, dayKey: ${_this.dayKey}, eatenAtUtc: ${_this.eatenAtUtc}, timezone: ${_this.timezone}, type: ${_this.type}, status: ${_this.status}, servings: ${_this.servings}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $MealDtoCopyWith<$Res>  {
  factory $MealDtoCopyWith(MealDto value, $Res Function(MealDto) _then) = _$MealDtoCopyWithImpl;
@useResult
$Res call({
 String id, String dayKey, DateTime eatenAtUtc, String timezone, MealType type, MealStatus status, List<ServingDto> servings, DateTime? updatedAt
});




}
/// @nodoc
class _$MealDtoCopyWithImpl<$Res>
    implements $MealDtoCopyWith<$Res> {
  _$MealDtoCopyWithImpl(this._self, this._then);

  final MealDto _self;
  final $Res Function(MealDto) _then;

/// Create a copy of MealDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dayKey = null,Object? eatenAtUtc = null,Object? timezone = null,Object? type = null,Object? status = null,Object? servings = null,Object? updatedAt = freezed,}) {
  return _then(MealDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,eatenAtUtc: null == eatenAtUtc ? _self.eatenAtUtc : eatenAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MealType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealStatus,servings: null == servings ? _self.servings : servings // ignore: cast_nullable_to_non_nullable
as List<ServingDto>,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealDto].
extension MealDtoPatterns on MealDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealDto value)  $default,){
final _that = this;
switch (_that) {
case _MealDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealDto value)?  $default,){
final _that = this;
switch (_that) {
case _MealDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String dayKey,  DateTime eatenAtUtc,  String timezone,  MealType type,  MealStatus status,  List<ServingDto> servings,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealDto() when $default != null:
return $default(_that.id,_that.dayKey,_that.eatenAtUtc,_that.timezone,_that.type,_that.status,_that.servings,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String dayKey,  DateTime eatenAtUtc,  String timezone,  MealType type,  MealStatus status,  List<ServingDto> servings,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _MealDto():
return $default(_that.id,_that.dayKey,_that.eatenAtUtc,_that.timezone,_that.type,_that.status,_that.servings,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String dayKey,  DateTime eatenAtUtc,  String timezone,  MealType type,  MealStatus status,  List<ServingDto> servings,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _MealDto() when $default != null:
return $default(_that.id,_that.dayKey,_that.eatenAtUtc,_that.timezone,_that.type,_that.status,_that.servings,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _MealDto implements MealDto {
  const _MealDto({required this.id, required this.dayKey, required this.eatenAtUtc, required this.timezone, required this.type, required this.status, required  List<ServingDto> servings, this.updatedAt}): _servings = servings;
  factory _MealDto.fromJson(Map<String, dynamic> json) => _$MealDtoFromJson(json);

@override final  String id;
@override final  String dayKey;
@override final  DateTime eatenAtUtc;
@override final  String timezone;
@override final  MealType type;
@override final  MealStatus status;
 final  List<ServingDto> _servings;
@override List<ServingDto> get servings {
  if (_servings is EqualUnmodifiableListView) return _servings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_servings);
}

@override final  DateTime? updatedAt;

/// Create a copy of MealDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealDtoCopyWith<_MealDto> get copyWith => __$MealDtoCopyWithImpl<_MealDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealDto&&(identical(other.id, id) || other.id == id)&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&(identical(other.eatenAtUtc, eatenAtUtc) || other.eatenAtUtc == eatenAtUtc)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.servings, _servings)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,dayKey,eatenAtUtc,timezone,type,status,const DeepCollectionEquality().hash(_servings),updatedAt);
}

@override
String toString() {
    return 'MealDto(id: $id, dayKey: $dayKey, eatenAtUtc: $eatenAtUtc, timezone: $timezone, type: $type, status: $status, servings: $servings, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MealDtoCopyWith<$Res> implements $MealDtoCopyWith<$Res> {
  factory _$MealDtoCopyWith(_MealDto value, $Res Function(_MealDto) _then) = __$MealDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String dayKey, DateTime eatenAtUtc, String timezone, MealType type, MealStatus status, List<ServingDto> servings, DateTime? updatedAt
});




}
/// @nodoc
class __$MealDtoCopyWithImpl<$Res>
    implements _$MealDtoCopyWith<$Res> {
  __$MealDtoCopyWithImpl(this._self, this._then);

  final _MealDto _self;
  final $Res Function(_MealDto) _then;

/// Create a copy of MealDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dayKey = null,Object? eatenAtUtc = null,Object? timezone = null,Object? type = null,Object? status = null,Object? servings = null,Object? updatedAt = freezed,}) {
  return _then(_MealDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,eatenAtUtc: null == eatenAtUtc ? _self.eatenAtUtc : eatenAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MealType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealStatus,servings: null == servings ? _self._servings : servings // ignore: cast_nullable_to_non_nullable
as List<ServingDto>,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
