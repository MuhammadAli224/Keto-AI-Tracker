// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weight_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeightDto {

 String get id; double get kg; DateTime get measuredAt; String get timezone; String? get notes; bool get deleted;
/// Create a copy of WeightDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeightDtoCopyWith<WeightDto> get copyWith => _$WeightDtoCopyWithImpl<WeightDto>(this as WeightDto, _$identity);

  /// Serializes this WeightDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WeightDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeightDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kg, _this.kg) || other.kg == _this.kg)&&(identical(other.measuredAt, _this.measuredAt) || other.measuredAt == _this.measuredAt)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.deleted, _this.deleted) || other.deleted == _this.deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WeightDto;
  return Object.hash(runtimeType,_this.id,_this.kg,_this.measuredAt,_this.timezone,_this.notes,_this.deleted);
}

@override
String toString() {
  final _this = this as WeightDto;
  return 'WeightDto(id: ${_this.id}, kg: ${_this.kg}, measuredAt: ${_this.measuredAt}, timezone: ${_this.timezone}, notes: ${_this.notes}, deleted: ${_this.deleted})';
}


}

/// @nodoc
abstract mixin class $WeightDtoCopyWith<$Res>  {
  factory $WeightDtoCopyWith(WeightDto value, $Res Function(WeightDto) _then) = _$WeightDtoCopyWithImpl;
@useResult
$Res call({
 String id, double kg, DateTime measuredAt, String timezone, String? notes, bool deleted
});




}
/// @nodoc
class _$WeightDtoCopyWithImpl<$Res>
    implements $WeightDtoCopyWith<$Res> {
  _$WeightDtoCopyWithImpl(this._self, this._then);

  final WeightDto _self;
  final $Res Function(WeightDto) _then;

/// Create a copy of WeightDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kg = null,Object? measuredAt = null,Object? timezone = null,Object? notes = freezed,Object? deleted = null,}) {
  return _then(WeightDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kg: null == kg ? _self.kg : kg // ignore: cast_nullable_to_non_nullable
as double,measuredAt: null == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [WeightDto].
extension WeightDtoPatterns on WeightDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeightDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeightDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeightDto value)  $default,){
final _that = this;
switch (_that) {
case _WeightDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeightDto value)?  $default,){
final _that = this;
switch (_that) {
case _WeightDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  double kg,  DateTime measuredAt,  String timezone,  String? notes,  bool deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeightDto() when $default != null:
return $default(_that.id,_that.kg,_that.measuredAt,_that.timezone,_that.notes,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  double kg,  DateTime measuredAt,  String timezone,  String? notes,  bool deleted)  $default,) {final _that = this;
switch (_that) {
case _WeightDto():
return $default(_that.id,_that.kg,_that.measuredAt,_that.timezone,_that.notes,_that.deleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  double kg,  DateTime measuredAt,  String timezone,  String? notes,  bool deleted)?  $default,) {final _that = this;
switch (_that) {
case _WeightDto() when $default != null:
return $default(_that.id,_that.kg,_that.measuredAt,_that.timezone,_that.notes,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WeightDto extends WeightDto {
  const _WeightDto({required this.id, required this.kg, required this.measuredAt, required this.timezone, this.notes, this.deleted = false}): super._();
  factory _WeightDto.fromJson(Map<String, dynamic> json) => _$WeightDtoFromJson(json);

@override final  String id;
@override final  double kg;
@override final  DateTime measuredAt;
@override final  String timezone;
@override final  String? notes;
@override@JsonKey() final  bool deleted;

/// Create a copy of WeightDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeightDtoCopyWith<_WeightDto> get copyWith => __$WeightDtoCopyWithImpl<_WeightDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeightDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeightDto&&(identical(other.id, id) || other.id == id)&&(identical(other.kg, kg) || other.kg == kg)&&(identical(other.measuredAt, measuredAt) || other.measuredAt == measuredAt)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kg,measuredAt,timezone,notes,deleted);
}

@override
String toString() {
    return 'WeightDto(id: $id, kg: $kg, measuredAt: $measuredAt, timezone: $timezone, notes: $notes, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$WeightDtoCopyWith<$Res> implements $WeightDtoCopyWith<$Res> {
  factory _$WeightDtoCopyWith(_WeightDto value, $Res Function(_WeightDto) _then) = __$WeightDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, double kg, DateTime measuredAt, String timezone, String? notes, bool deleted
});




}
/// @nodoc
class __$WeightDtoCopyWithImpl<$Res>
    implements _$WeightDtoCopyWith<$Res> {
  __$WeightDtoCopyWithImpl(this._self, this._then);

  final _WeightDto _self;
  final $Res Function(_WeightDto) _then;

/// Create a copy of WeightDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kg = null,Object? measuredAt = null,Object? timezone = null,Object? notes = freezed,Object? deleted = null,}) {
  return _then(_WeightDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kg: null == kg ? _self.kg : kg // ignore: cast_nullable_to_non_nullable
as double,measuredAt: null == measuredAt ? _self.measuredAt : measuredAt // ignore: cast_nullable_to_non_nullable
as DateTime,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
