// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodExpenseDto {

 String get id; String get dayKey; String get timezone; DateTime get recordedAtUtc; String get description; int get fils;
/// Create a copy of FoodExpenseDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodExpenseDtoCopyWith<FoodExpenseDto> get copyWith => _$FoodExpenseDtoCopyWithImpl<FoodExpenseDto>(this as FoodExpenseDto, _$identity);

  /// Serializes this FoodExpenseDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FoodExpenseDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodExpenseDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.recordedAtUtc, _this.recordedAtUtc) || other.recordedAtUtc == _this.recordedAtUtc)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.fils, _this.fils) || other.fils == _this.fils));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FoodExpenseDto;
  return Object.hash(runtimeType,_this.id,_this.dayKey,_this.timezone,_this.recordedAtUtc,_this.description,_this.fils);
}

@override
String toString() {
  final _this = this as FoodExpenseDto;
  return 'FoodExpenseDto(id: ${_this.id}, dayKey: ${_this.dayKey}, timezone: ${_this.timezone}, recordedAtUtc: ${_this.recordedAtUtc}, description: ${_this.description}, fils: ${_this.fils})';
}


}

/// @nodoc
abstract mixin class $FoodExpenseDtoCopyWith<$Res>  {
  factory $FoodExpenseDtoCopyWith(FoodExpenseDto value, $Res Function(FoodExpenseDto) _then) = _$FoodExpenseDtoCopyWithImpl;
@useResult
$Res call({
 String id, String dayKey, String timezone, DateTime recordedAtUtc, String description, int fils
});




}
/// @nodoc
class _$FoodExpenseDtoCopyWithImpl<$Res>
    implements $FoodExpenseDtoCopyWith<$Res> {
  _$FoodExpenseDtoCopyWithImpl(this._self, this._then);

  final FoodExpenseDto _self;
  final $Res Function(FoodExpenseDto) _then;

/// Create a copy of FoodExpenseDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dayKey = null,Object? timezone = null,Object? recordedAtUtc = null,Object? description = null,Object? fils = null,}) {
  return _then(FoodExpenseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,recordedAtUtc: null == recordedAtUtc ? _self.recordedAtUtc : recordedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fils: null == fils ? _self.fils : fils // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodExpenseDto].
extension FoodExpenseDtoPatterns on FoodExpenseDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodExpenseDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodExpenseDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodExpenseDto value)  $default,){
final _that = this;
switch (_that) {
case _FoodExpenseDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodExpenseDto value)?  $default,){
final _that = this;
switch (_that) {
case _FoodExpenseDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String dayKey,  String timezone,  DateTime recordedAtUtc,  String description,  int fils)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodExpenseDto() when $default != null:
return $default(_that.id,_that.dayKey,_that.timezone,_that.recordedAtUtc,_that.description,_that.fils);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String dayKey,  String timezone,  DateTime recordedAtUtc,  String description,  int fils)  $default,) {final _that = this;
switch (_that) {
case _FoodExpenseDto():
return $default(_that.id,_that.dayKey,_that.timezone,_that.recordedAtUtc,_that.description,_that.fils);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String dayKey,  String timezone,  DateTime recordedAtUtc,  String description,  int fils)?  $default,) {final _that = this;
switch (_that) {
case _FoodExpenseDto() when $default != null:
return $default(_that.id,_that.dayKey,_that.timezone,_that.recordedAtUtc,_that.description,_that.fils);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodExpenseDto implements FoodExpenseDto {
  const _FoodExpenseDto({required this.id, required this.dayKey, required this.timezone, required this.recordedAtUtc, required this.description, required this.fils});
  factory _FoodExpenseDto.fromJson(Map<String, dynamic> json) => _$FoodExpenseDtoFromJson(json);

@override final  String id;
@override final  String dayKey;
@override final  String timezone;
@override final  DateTime recordedAtUtc;
@override final  String description;
@override final  int fils;

/// Create a copy of FoodExpenseDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodExpenseDtoCopyWith<_FoodExpenseDto> get copyWith => __$FoodExpenseDtoCopyWithImpl<_FoodExpenseDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodExpenseDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodExpenseDto&&(identical(other.id, id) || other.id == id)&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.recordedAtUtc, recordedAtUtc) || other.recordedAtUtc == recordedAtUtc)&&(identical(other.description, description) || other.description == description)&&(identical(other.fils, fils) || other.fils == fils));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,dayKey,timezone,recordedAtUtc,description,fils);
}

@override
String toString() {
    return 'FoodExpenseDto(id: $id, dayKey: $dayKey, timezone: $timezone, recordedAtUtc: $recordedAtUtc, description: $description, fils: $fils)';
}


}

/// @nodoc
abstract mixin class _$FoodExpenseDtoCopyWith<$Res> implements $FoodExpenseDtoCopyWith<$Res> {
  factory _$FoodExpenseDtoCopyWith(_FoodExpenseDto value, $Res Function(_FoodExpenseDto) _then) = __$FoodExpenseDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String dayKey, String timezone, DateTime recordedAtUtc, String description, int fils
});




}
/// @nodoc
class __$FoodExpenseDtoCopyWithImpl<$Res>
    implements _$FoodExpenseDtoCopyWith<$Res> {
  __$FoodExpenseDtoCopyWithImpl(this._self, this._then);

  final _FoodExpenseDto _self;
  final $Res Function(_FoodExpenseDto) _then;

/// Create a copy of FoodExpenseDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dayKey = null,Object? timezone = null,Object? recordedAtUtc = null,Object? description = null,Object? fils = null,}) {
  return _then(_FoodExpenseDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,recordedAtUtc: null == recordedAtUtc ? _self.recordedAtUtc : recordedAtUtc // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,fils: null == fils ? _self.fils : fils // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$FoodPriceDto {

 String get foodId; int get filsPer100g;
/// Create a copy of FoodPriceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodPriceDtoCopyWith<FoodPriceDto> get copyWith => _$FoodPriceDtoCopyWithImpl<FoodPriceDto>(this as FoodPriceDto, _$identity);

  /// Serializes this FoodPriceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FoodPriceDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodPriceDto&&(identical(other.foodId, _this.foodId) || other.foodId == _this.foodId)&&(identical(other.filsPer100g, _this.filsPer100g) || other.filsPer100g == _this.filsPer100g));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FoodPriceDto;
  return Object.hash(runtimeType,_this.foodId,_this.filsPer100g);
}

@override
String toString() {
  final _this = this as FoodPriceDto;
  return 'FoodPriceDto(foodId: ${_this.foodId}, filsPer100g: ${_this.filsPer100g})';
}


}

/// @nodoc
abstract mixin class $FoodPriceDtoCopyWith<$Res>  {
  factory $FoodPriceDtoCopyWith(FoodPriceDto value, $Res Function(FoodPriceDto) _then) = _$FoodPriceDtoCopyWithImpl;
@useResult
$Res call({
 String foodId, int filsPer100g
});




}
/// @nodoc
class _$FoodPriceDtoCopyWithImpl<$Res>
    implements $FoodPriceDtoCopyWith<$Res> {
  _$FoodPriceDtoCopyWithImpl(this._self, this._then);

  final FoodPriceDto _self;
  final $Res Function(FoodPriceDto) _then;

/// Create a copy of FoodPriceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodId = null,Object? filsPer100g = null,}) {
  return _then(FoodPriceDto(
foodId: null == foodId ? _self.foodId : foodId // ignore: cast_nullable_to_non_nullable
as String,filsPer100g: null == filsPer100g ? _self.filsPer100g : filsPer100g // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodPriceDto].
extension FoodPriceDtoPatterns on FoodPriceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodPriceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodPriceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodPriceDto value)  $default,){
final _that = this;
switch (_that) {
case _FoodPriceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodPriceDto value)?  $default,){
final _that = this;
switch (_that) {
case _FoodPriceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String foodId,  int filsPer100g)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodPriceDto() when $default != null:
return $default(_that.foodId,_that.filsPer100g);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String foodId,  int filsPer100g)  $default,) {final _that = this;
switch (_that) {
case _FoodPriceDto():
return $default(_that.foodId,_that.filsPer100g);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String foodId,  int filsPer100g)?  $default,) {final _that = this;
switch (_that) {
case _FoodPriceDto() when $default != null:
return $default(_that.foodId,_that.filsPer100g);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodPriceDto implements FoodPriceDto {
  const _FoodPriceDto({required this.foodId, required this.filsPer100g});
  factory _FoodPriceDto.fromJson(Map<String, dynamic> json) => _$FoodPriceDtoFromJson(json);

@override final  String foodId;
@override final  int filsPer100g;

/// Create a copy of FoodPriceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodPriceDtoCopyWith<_FoodPriceDto> get copyWith => __$FoodPriceDtoCopyWithImpl<_FoodPriceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodPriceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodPriceDto&&(identical(other.foodId, foodId) || other.foodId == foodId)&&(identical(other.filsPer100g, filsPer100g) || other.filsPer100g == filsPer100g));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,foodId,filsPer100g);
}

@override
String toString() {
    return 'FoodPriceDto(foodId: $foodId, filsPer100g: $filsPer100g)';
}


}

/// @nodoc
abstract mixin class _$FoodPriceDtoCopyWith<$Res> implements $FoodPriceDtoCopyWith<$Res> {
  factory _$FoodPriceDtoCopyWith(_FoodPriceDto value, $Res Function(_FoodPriceDto) _then) = __$FoodPriceDtoCopyWithImpl;
@override @useResult
$Res call({
 String foodId, int filsPer100g
});




}
/// @nodoc
class __$FoodPriceDtoCopyWithImpl<$Res>
    implements _$FoodPriceDtoCopyWith<$Res> {
  __$FoodPriceDtoCopyWithImpl(this._self, this._then);

  final _FoodPriceDto _self;
  final $Res Function(_FoodPriceDto) _then;

/// Create a copy of FoodPriceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodId = null,Object? filsPer100g = null,}) {
  return _then(_FoodPriceDto(
foodId: null == foodId ? _self.foodId : foodId // ignore: cast_nullable_to_non_nullable
as String,filsPer100g: null == filsPer100g ? _self.filsPer100g : filsPer100g // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PlannedDayDto {

 String get dayKey; String get meals;
/// Create a copy of PlannedDayDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlannedDayDtoCopyWith<PlannedDayDto> get copyWith => _$PlannedDayDtoCopyWithImpl<PlannedDayDto>(this as PlannedDayDto, _$identity);

  /// Serializes this PlannedDayDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlannedDayDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlannedDayDto&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&(identical(other.meals, _this.meals) || other.meals == _this.meals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlannedDayDto;
  return Object.hash(runtimeType,_this.dayKey,_this.meals);
}

@override
String toString() {
  final _this = this as PlannedDayDto;
  return 'PlannedDayDto(dayKey: ${_this.dayKey}, meals: ${_this.meals})';
}


}

/// @nodoc
abstract mixin class $PlannedDayDtoCopyWith<$Res>  {
  factory $PlannedDayDtoCopyWith(PlannedDayDto value, $Res Function(PlannedDayDto) _then) = _$PlannedDayDtoCopyWithImpl;
@useResult
$Res call({
 String dayKey, String meals
});




}
/// @nodoc
class _$PlannedDayDtoCopyWithImpl<$Res>
    implements $PlannedDayDtoCopyWith<$Res> {
  _$PlannedDayDtoCopyWithImpl(this._self, this._then);

  final PlannedDayDto _self;
  final $Res Function(PlannedDayDto) _then;

/// Create a copy of PlannedDayDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayKey = null,Object? meals = null,}) {
  return _then(PlannedDayDto(
dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,meals: null == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlannedDayDto].
extension PlannedDayDtoPatterns on PlannedDayDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlannedDayDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlannedDayDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlannedDayDto value)  $default,){
final _that = this;
switch (_that) {
case _PlannedDayDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlannedDayDto value)?  $default,){
final _that = this;
switch (_that) {
case _PlannedDayDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String dayKey,  String meals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlannedDayDto() when $default != null:
return $default(_that.dayKey,_that.meals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String dayKey,  String meals)  $default,) {final _that = this;
switch (_that) {
case _PlannedDayDto():
return $default(_that.dayKey,_that.meals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String dayKey,  String meals)?  $default,) {final _that = this;
switch (_that) {
case _PlannedDayDto() when $default != null:
return $default(_that.dayKey,_that.meals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlannedDayDto implements PlannedDayDto {
  const _PlannedDayDto({required this.dayKey, required this.meals});
  factory _PlannedDayDto.fromJson(Map<String, dynamic> json) => _$PlannedDayDtoFromJson(json);

@override final  String dayKey;
@override final  String meals;

/// Create a copy of PlannedDayDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlannedDayDtoCopyWith<_PlannedDayDto> get copyWith => __$PlannedDayDtoCopyWithImpl<_PlannedDayDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlannedDayDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlannedDayDto&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&(identical(other.meals, meals) || other.meals == meals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,dayKey,meals);
}

@override
String toString() {
    return 'PlannedDayDto(dayKey: $dayKey, meals: $meals)';
}


}

/// @nodoc
abstract mixin class _$PlannedDayDtoCopyWith<$Res> implements $PlannedDayDtoCopyWith<$Res> {
  factory _$PlannedDayDtoCopyWith(_PlannedDayDto value, $Res Function(_PlannedDayDto) _then) = __$PlannedDayDtoCopyWithImpl;
@override @useResult
$Res call({
 String dayKey, String meals
});




}
/// @nodoc
class __$PlannedDayDtoCopyWithImpl<$Res>
    implements _$PlannedDayDtoCopyWith<$Res> {
  __$PlannedDayDtoCopyWithImpl(this._self, this._then);

  final _PlannedDayDto _self;
  final $Res Function(_PlannedDayDto) _then;

/// Create a copy of PlannedDayDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayKey = null,Object? meals = null,}) {
  return _then(_PlannedDayDto(
dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,meals: null == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
