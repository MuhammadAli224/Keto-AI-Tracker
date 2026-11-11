// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_profile_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OwnerProfileDto {

 int get birthYear; double get heightCm; double get startingWeightKg; double get currentWeightKg; String get activity; String get windowStart; String get windowEnd; String get locale; String get timezone; double get weeklyBudgetJod; int get calories; double get proteinGrams; double get carbsGrams; double get fatGrams; int get waterMl; int get confirmationVersion; DateTime? get updatedAt; DateTime? get confirmedAt;
/// Create a copy of OwnerProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerProfileDtoCopyWith<OwnerProfileDto> get copyWith => _$OwnerProfileDtoCopyWithImpl<OwnerProfileDto>(this as OwnerProfileDto, _$identity);

  /// Serializes this OwnerProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OwnerProfileDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerProfileDto&&(identical(other.birthYear, _this.birthYear) || other.birthYear == _this.birthYear)&&(identical(other.heightCm, _this.heightCm) || other.heightCm == _this.heightCm)&&(identical(other.startingWeightKg, _this.startingWeightKg) || other.startingWeightKg == _this.startingWeightKg)&&(identical(other.currentWeightKg, _this.currentWeightKg) || other.currentWeightKg == _this.currentWeightKg)&&(identical(other.activity, _this.activity) || other.activity == _this.activity)&&(identical(other.windowStart, _this.windowStart) || other.windowStart == _this.windowStart)&&(identical(other.windowEnd, _this.windowEnd) || other.windowEnd == _this.windowEnd)&&(identical(other.locale, _this.locale) || other.locale == _this.locale)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.weeklyBudgetJod, _this.weeklyBudgetJod) || other.weeklyBudgetJod == _this.weeklyBudgetJod)&&(identical(other.calories, _this.calories) || other.calories == _this.calories)&&(identical(other.proteinGrams, _this.proteinGrams) || other.proteinGrams == _this.proteinGrams)&&(identical(other.carbsGrams, _this.carbsGrams) || other.carbsGrams == _this.carbsGrams)&&(identical(other.fatGrams, _this.fatGrams) || other.fatGrams == _this.fatGrams)&&(identical(other.waterMl, _this.waterMl) || other.waterMl == _this.waterMl)&&(identical(other.confirmationVersion, _this.confirmationVersion) || other.confirmationVersion == _this.confirmationVersion)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.confirmedAt, _this.confirmedAt) || other.confirmedAt == _this.confirmedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OwnerProfileDto;
  return Object.hash(runtimeType,_this.birthYear,_this.heightCm,_this.startingWeightKg,_this.currentWeightKg,_this.activity,_this.windowStart,_this.windowEnd,_this.locale,_this.timezone,_this.weeklyBudgetJod,_this.calories,_this.proteinGrams,_this.carbsGrams,_this.fatGrams,_this.waterMl,_this.confirmationVersion,_this.updatedAt,_this.confirmedAt);
}

@override
String toString() {
  final _this = this as OwnerProfileDto;
  return 'OwnerProfileDto(birthYear: ${_this.birthYear}, heightCm: ${_this.heightCm}, startingWeightKg: ${_this.startingWeightKg}, currentWeightKg: ${_this.currentWeightKg}, activity: ${_this.activity}, windowStart: ${_this.windowStart}, windowEnd: ${_this.windowEnd}, locale: ${_this.locale}, timezone: ${_this.timezone}, weeklyBudgetJod: ${_this.weeklyBudgetJod}, calories: ${_this.calories}, proteinGrams: ${_this.proteinGrams}, carbsGrams: ${_this.carbsGrams}, fatGrams: ${_this.fatGrams}, waterMl: ${_this.waterMl}, confirmationVersion: ${_this.confirmationVersion}, updatedAt: ${_this.updatedAt}, confirmedAt: ${_this.confirmedAt})';
}


}

/// @nodoc
abstract mixin class $OwnerProfileDtoCopyWith<$Res>  {
  factory $OwnerProfileDtoCopyWith(OwnerProfileDto value, $Res Function(OwnerProfileDto) _then) = _$OwnerProfileDtoCopyWithImpl;
@useResult
$Res call({
 int birthYear, double heightCm, double startingWeightKg, double currentWeightKg, String activity, String windowStart, String windowEnd, String locale, String timezone, double weeklyBudgetJod, int calories, double proteinGrams, double carbsGrams, double fatGrams, int waterMl, int confirmationVersion, DateTime? updatedAt, DateTime? confirmedAt
});




}
/// @nodoc
class _$OwnerProfileDtoCopyWithImpl<$Res>
    implements $OwnerProfileDtoCopyWith<$Res> {
  _$OwnerProfileDtoCopyWithImpl(this._self, this._then);

  final OwnerProfileDto _self;
  final $Res Function(OwnerProfileDto) _then;

/// Create a copy of OwnerProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? birthYear = null,Object? heightCm = null,Object? startingWeightKg = null,Object? currentWeightKg = null,Object? activity = null,Object? windowStart = null,Object? windowEnd = null,Object? locale = null,Object? timezone = null,Object? weeklyBudgetJod = null,Object? calories = null,Object? proteinGrams = null,Object? carbsGrams = null,Object? fatGrams = null,Object? waterMl = null,Object? confirmationVersion = null,Object? updatedAt = freezed,Object? confirmedAt = freezed,}) {
  return _then(OwnerProfileDto(
birthYear: null == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,startingWeightKg: null == startingWeightKg ? _self.startingWeightKg : startingWeightKg // ignore: cast_nullable_to_non_nullable
as double,currentWeightKg: null == currentWeightKg ? _self.currentWeightKg : currentWeightKg // ignore: cast_nullable_to_non_nullable
as double,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as String,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,weeklyBudgetJod: null == weeklyBudgetJod ? _self.weeklyBudgetJod : weeklyBudgetJod // ignore: cast_nullable_to_non_nullable
as double,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,proteinGrams: null == proteinGrams ? _self.proteinGrams : proteinGrams // ignore: cast_nullable_to_non_nullable
as double,carbsGrams: null == carbsGrams ? _self.carbsGrams : carbsGrams // ignore: cast_nullable_to_non_nullable
as double,fatGrams: null == fatGrams ? _self.fatGrams : fatGrams // ignore: cast_nullable_to_non_nullable
as double,waterMl: null == waterMl ? _self.waterMl : waterMl // ignore: cast_nullable_to_non_nullable
as int,confirmationVersion: null == confirmationVersion ? _self.confirmationVersion : confirmationVersion // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [OwnerProfileDto].
extension OwnerProfileDtoPatterns on OwnerProfileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OwnerProfileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OwnerProfileDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OwnerProfileDto value)  $default,){
final _that = this;
switch (_that) {
case _OwnerProfileDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OwnerProfileDto value)?  $default,){
final _that = this;
switch (_that) {
case _OwnerProfileDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int birthYear,  double heightCm,  double startingWeightKg,  double currentWeightKg,  String activity,  String windowStart,  String windowEnd,  String locale,  String timezone,  double weeklyBudgetJod,  int calories,  double proteinGrams,  double carbsGrams,  double fatGrams,  int waterMl,  int confirmationVersion,  DateTime? updatedAt,  DateTime? confirmedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OwnerProfileDto() when $default != null:
return $default(_that.birthYear,_that.heightCm,_that.startingWeightKg,_that.currentWeightKg,_that.activity,_that.windowStart,_that.windowEnd,_that.locale,_that.timezone,_that.weeklyBudgetJod,_that.calories,_that.proteinGrams,_that.carbsGrams,_that.fatGrams,_that.waterMl,_that.confirmationVersion,_that.updatedAt,_that.confirmedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int birthYear,  double heightCm,  double startingWeightKg,  double currentWeightKg,  String activity,  String windowStart,  String windowEnd,  String locale,  String timezone,  double weeklyBudgetJod,  int calories,  double proteinGrams,  double carbsGrams,  double fatGrams,  int waterMl,  int confirmationVersion,  DateTime? updatedAt,  DateTime? confirmedAt)  $default,) {final _that = this;
switch (_that) {
case _OwnerProfileDto():
return $default(_that.birthYear,_that.heightCm,_that.startingWeightKg,_that.currentWeightKg,_that.activity,_that.windowStart,_that.windowEnd,_that.locale,_that.timezone,_that.weeklyBudgetJod,_that.calories,_that.proteinGrams,_that.carbsGrams,_that.fatGrams,_that.waterMl,_that.confirmationVersion,_that.updatedAt,_that.confirmedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int birthYear,  double heightCm,  double startingWeightKg,  double currentWeightKg,  String activity,  String windowStart,  String windowEnd,  String locale,  String timezone,  double weeklyBudgetJod,  int calories,  double proteinGrams,  double carbsGrams,  double fatGrams,  int waterMl,  int confirmationVersion,  DateTime? updatedAt,  DateTime? confirmedAt)?  $default,) {final _that = this;
switch (_that) {
case _OwnerProfileDto() when $default != null:
return $default(_that.birthYear,_that.heightCm,_that.startingWeightKg,_that.currentWeightKg,_that.activity,_that.windowStart,_that.windowEnd,_that.locale,_that.timezone,_that.weeklyBudgetJod,_that.calories,_that.proteinGrams,_that.carbsGrams,_that.fatGrams,_that.waterMl,_that.confirmationVersion,_that.updatedAt,_that.confirmedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OwnerProfileDto implements OwnerProfileDto {
  const _OwnerProfileDto({this.birthYear = -1, this.heightCm = -1, this.startingWeightKg = -1, this.currentWeightKg = -1, this.activity = '', this.windowStart = '', this.windowEnd = '', this.locale = '', this.timezone = '', this.weeklyBudgetJod = -1, this.calories = -1, this.proteinGrams = -1, this.carbsGrams = -1, this.fatGrams = -1, this.waterMl = -1, this.confirmationVersion = 0, this.updatedAt, this.confirmedAt});
  factory _OwnerProfileDto.fromJson(Map<String, dynamic> json) => _$OwnerProfileDtoFromJson(json);

@override@JsonKey() final  int birthYear;
@override@JsonKey() final  double heightCm;
@override@JsonKey() final  double startingWeightKg;
@override@JsonKey() final  double currentWeightKg;
@override@JsonKey() final  String activity;
@override@JsonKey() final  String windowStart;
@override@JsonKey() final  String windowEnd;
@override@JsonKey() final  String locale;
@override@JsonKey() final  String timezone;
@override@JsonKey() final  double weeklyBudgetJod;
@override@JsonKey() final  int calories;
@override@JsonKey() final  double proteinGrams;
@override@JsonKey() final  double carbsGrams;
@override@JsonKey() final  double fatGrams;
@override@JsonKey() final  int waterMl;
@override@JsonKey() final  int confirmationVersion;
@override final  DateTime? updatedAt;
@override final  DateTime? confirmedAt;

/// Create a copy of OwnerProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerProfileDtoCopyWith<_OwnerProfileDto> get copyWith => __$OwnerProfileDtoCopyWithImpl<_OwnerProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OwnerProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnerProfileDto&&(identical(other.birthYear, birthYear) || other.birthYear == birthYear)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm)&&(identical(other.startingWeightKg, startingWeightKg) || other.startingWeightKg == startingWeightKg)&&(identical(other.currentWeightKg, currentWeightKg) || other.currentWeightKg == currentWeightKg)&&(identical(other.activity, activity) || other.activity == activity)&&(identical(other.windowStart, windowStart) || other.windowStart == windowStart)&&(identical(other.windowEnd, windowEnd) || other.windowEnd == windowEnd)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.weeklyBudgetJod, weeklyBudgetJod) || other.weeklyBudgetJod == weeklyBudgetJod)&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.proteinGrams, proteinGrams) || other.proteinGrams == proteinGrams)&&(identical(other.carbsGrams, carbsGrams) || other.carbsGrams == carbsGrams)&&(identical(other.fatGrams, fatGrams) || other.fatGrams == fatGrams)&&(identical(other.waterMl, waterMl) || other.waterMl == waterMl)&&(identical(other.confirmationVersion, confirmationVersion) || other.confirmationVersion == confirmationVersion)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,birthYear,heightCm,startingWeightKg,currentWeightKg,activity,windowStart,windowEnd,locale,timezone,weeklyBudgetJod,calories,proteinGrams,carbsGrams,fatGrams,waterMl,confirmationVersion,updatedAt,confirmedAt);
}

@override
String toString() {
    return 'OwnerProfileDto(birthYear: $birthYear, heightCm: $heightCm, startingWeightKg: $startingWeightKg, currentWeightKg: $currentWeightKg, activity: $activity, windowStart: $windowStart, windowEnd: $windowEnd, locale: $locale, timezone: $timezone, weeklyBudgetJod: $weeklyBudgetJod, calories: $calories, proteinGrams: $proteinGrams, carbsGrams: $carbsGrams, fatGrams: $fatGrams, waterMl: $waterMl, confirmationVersion: $confirmationVersion, updatedAt: $updatedAt, confirmedAt: $confirmedAt)';
}


}

/// @nodoc
abstract mixin class _$OwnerProfileDtoCopyWith<$Res> implements $OwnerProfileDtoCopyWith<$Res> {
  factory _$OwnerProfileDtoCopyWith(_OwnerProfileDto value, $Res Function(_OwnerProfileDto) _then) = __$OwnerProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 int birthYear, double heightCm, double startingWeightKg, double currentWeightKg, String activity, String windowStart, String windowEnd, String locale, String timezone, double weeklyBudgetJod, int calories, double proteinGrams, double carbsGrams, double fatGrams, int waterMl, int confirmationVersion, DateTime? updatedAt, DateTime? confirmedAt
});




}
/// @nodoc
class __$OwnerProfileDtoCopyWithImpl<$Res>
    implements _$OwnerProfileDtoCopyWith<$Res> {
  __$OwnerProfileDtoCopyWithImpl(this._self, this._then);

  final _OwnerProfileDto _self;
  final $Res Function(_OwnerProfileDto) _then;

/// Create a copy of OwnerProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? birthYear = null,Object? heightCm = null,Object? startingWeightKg = null,Object? currentWeightKg = null,Object? activity = null,Object? windowStart = null,Object? windowEnd = null,Object? locale = null,Object? timezone = null,Object? weeklyBudgetJod = null,Object? calories = null,Object? proteinGrams = null,Object? carbsGrams = null,Object? fatGrams = null,Object? waterMl = null,Object? confirmationVersion = null,Object? updatedAt = freezed,Object? confirmedAt = freezed,}) {
  return _then(_OwnerProfileDto(
birthYear: null == birthYear ? _self.birthYear : birthYear // ignore: cast_nullable_to_non_nullable
as int,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as double,startingWeightKg: null == startingWeightKg ? _self.startingWeightKg : startingWeightKg // ignore: cast_nullable_to_non_nullable
as double,currentWeightKg: null == currentWeightKg ? _self.currentWeightKg : currentWeightKg // ignore: cast_nullable_to_non_nullable
as double,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as String,windowStart: null == windowStart ? _self.windowStart : windowStart // ignore: cast_nullable_to_non_nullable
as String,windowEnd: null == windowEnd ? _self.windowEnd : windowEnd // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,weeklyBudgetJod: null == weeklyBudgetJod ? _self.weeklyBudgetJod : weeklyBudgetJod // ignore: cast_nullable_to_non_nullable
as double,calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as int,proteinGrams: null == proteinGrams ? _self.proteinGrams : proteinGrams // ignore: cast_nullable_to_non_nullable
as double,carbsGrams: null == carbsGrams ? _self.carbsGrams : carbsGrams // ignore: cast_nullable_to_non_nullable
as double,fatGrams: null == fatGrams ? _self.fatGrams : fatGrams // ignore: cast_nullable_to_non_nullable
as double,waterMl: null == waterMl ? _self.waterMl : waterMl // ignore: cast_nullable_to_non_nullable
as int,confirmationVersion: null == confirmationVersion ? _self.confirmationVersion : confirmationVersion // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
