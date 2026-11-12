// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoodExpense {

 String get id; String get dayKey; String get timezone; DateTime get recordedAtUtc; String get description; int get fils;
/// Create a copy of FoodExpense
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodExpenseCopyWith<FoodExpense> get copyWith => _$FoodExpenseCopyWithImpl<FoodExpense>(this as FoodExpense, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FoodExpense;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodExpense&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&(identical(other.timezone, _this.timezone) || other.timezone == _this.timezone)&&(identical(other.recordedAtUtc, _this.recordedAtUtc) || other.recordedAtUtc == _this.recordedAtUtc)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.fils, _this.fils) || other.fils == _this.fils));
}


@override
int get hashCode {
  final _this = this as FoodExpense;
  return Object.hash(runtimeType,_this.id,_this.dayKey,_this.timezone,_this.recordedAtUtc,_this.description,_this.fils);
}

@override
String toString() {
  final _this = this as FoodExpense;
  return 'FoodExpense(id: ${_this.id}, dayKey: ${_this.dayKey}, timezone: ${_this.timezone}, recordedAtUtc: ${_this.recordedAtUtc}, description: ${_this.description}, fils: ${_this.fils})';
}


}

/// @nodoc
abstract mixin class $FoodExpenseCopyWith<$Res>  {
  factory $FoodExpenseCopyWith(FoodExpense value, $Res Function(FoodExpense) _then) = _$FoodExpenseCopyWithImpl;
@useResult
$Res call({
 String id, String dayKey, String timezone, DateTime recordedAtUtc, String description, int fils
});




}
/// @nodoc
class _$FoodExpenseCopyWithImpl<$Res>
    implements $FoodExpenseCopyWith<$Res> {
  _$FoodExpenseCopyWithImpl(this._self, this._then);

  final FoodExpense _self;
  final $Res Function(FoodExpense) _then;

/// Create a copy of FoodExpense
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dayKey = null,Object? timezone = null,Object? recordedAtUtc = null,Object? description = null,Object? fils = null,}) {
  return _then(FoodExpense(
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


/// Adds pattern-matching-related methods to [FoodExpense].
extension FoodExpensePatterns on FoodExpense {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodExpense value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodExpense() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodExpense value)  $default,){
final _that = this;
switch (_that) {
case _FoodExpense():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodExpense value)?  $default,){
final _that = this;
switch (_that) {
case _FoodExpense() when $default != null:
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
case _FoodExpense() when $default != null:
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
case _FoodExpense():
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
case _FoodExpense() when $default != null:
return $default(_that.id,_that.dayKey,_that.timezone,_that.recordedAtUtc,_that.description,_that.fils);case _:
  return null;

}
}

}

/// @nodoc


class _FoodExpense implements FoodExpense {
  const _FoodExpense({required this.id, required this.dayKey, required this.timezone, required this.recordedAtUtc, required this.description, required this.fils});


@override final  String id;
@override final  String dayKey;
@override final  String timezone;
@override final  DateTime recordedAtUtc;
@override final  String description;
@override final  int fils;

/// Create a copy of FoodExpense
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodExpenseCopyWith<_FoodExpense> get copyWith => __$FoodExpenseCopyWithImpl<_FoodExpense>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodExpense&&(identical(other.id, id) || other.id == id)&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.recordedAtUtc, recordedAtUtc) || other.recordedAtUtc == recordedAtUtc)&&(identical(other.description, description) || other.description == description)&&(identical(other.fils, fils) || other.fils == fils));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,dayKey,timezone,recordedAtUtc,description,fils);
}

@override
String toString() {
    return 'FoodExpense(id: $id, dayKey: $dayKey, timezone: $timezone, recordedAtUtc: $recordedAtUtc, description: $description, fils: $fils)';
}


}

/// @nodoc
abstract mixin class _$FoodExpenseCopyWith<$Res> implements $FoodExpenseCopyWith<$Res> {
  factory _$FoodExpenseCopyWith(_FoodExpense value, $Res Function(_FoodExpense) _then) = __$FoodExpenseCopyWithImpl;
@override @useResult
$Res call({
 String id, String dayKey, String timezone, DateTime recordedAtUtc, String description, int fils
});




}
/// @nodoc
class __$FoodExpenseCopyWithImpl<$Res>
    implements _$FoodExpenseCopyWith<$Res> {
  __$FoodExpenseCopyWithImpl(this._self, this._then);

  final _FoodExpense _self;
  final $Res Function(_FoodExpense) _then;

/// Create a copy of FoodExpense
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dayKey = null,Object? timezone = null,Object? recordedAtUtc = null,Object? description = null,Object? fils = null,}) {
  return _then(_FoodExpense(
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
mixin _$FoodPrice {

 String get foodId; int get filsPer100g;
/// Create a copy of FoodPrice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodPriceCopyWith<FoodPrice> get copyWith => _$FoodPriceCopyWithImpl<FoodPrice>(this as FoodPrice, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as FoodPrice;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodPrice&&(identical(other.foodId, _this.foodId) || other.foodId == _this.foodId)&&(identical(other.filsPer100g, _this.filsPer100g) || other.filsPer100g == _this.filsPer100g));
}


@override
int get hashCode {
  final _this = this as FoodPrice;
  return Object.hash(runtimeType,_this.foodId,_this.filsPer100g);
}

@override
String toString() {
  final _this = this as FoodPrice;
  return 'FoodPrice(foodId: ${_this.foodId}, filsPer100g: ${_this.filsPer100g})';
}


}

/// @nodoc
abstract mixin class $FoodPriceCopyWith<$Res>  {
  factory $FoodPriceCopyWith(FoodPrice value, $Res Function(FoodPrice) _then) = _$FoodPriceCopyWithImpl;
@useResult
$Res call({
 String foodId, int filsPer100g
});




}
/// @nodoc
class _$FoodPriceCopyWithImpl<$Res>
    implements $FoodPriceCopyWith<$Res> {
  _$FoodPriceCopyWithImpl(this._self, this._then);

  final FoodPrice _self;
  final $Res Function(FoodPrice) _then;

/// Create a copy of FoodPrice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodId = null,Object? filsPer100g = null,}) {
  return _then(FoodPrice(
foodId: null == foodId ? _self.foodId : foodId // ignore: cast_nullable_to_non_nullable
as String,filsPer100g: null == filsPer100g ? _self.filsPer100g : filsPer100g // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodPrice].
extension FoodPricePatterns on FoodPrice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodPrice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodPrice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodPrice value)  $default,){
final _that = this;
switch (_that) {
case _FoodPrice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodPrice value)?  $default,){
final _that = this;
switch (_that) {
case _FoodPrice() when $default != null:
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
case _FoodPrice() when $default != null:
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
case _FoodPrice():
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
case _FoodPrice() when $default != null:
return $default(_that.foodId,_that.filsPer100g);case _:
  return null;

}
}

}

/// @nodoc


class _FoodPrice implements FoodPrice {
  const _FoodPrice({required this.foodId, required this.filsPer100g});


@override final  String foodId;
@override final  int filsPer100g;

/// Create a copy of FoodPrice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodPriceCopyWith<_FoodPrice> get copyWith => __$FoodPriceCopyWithImpl<_FoodPrice>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodPrice&&(identical(other.foodId, foodId) || other.foodId == foodId)&&(identical(other.filsPer100g, filsPer100g) || other.filsPer100g == filsPer100g));
}


@override
int get hashCode {
    return Object.hash(runtimeType,foodId,filsPer100g);
}

@override
String toString() {
    return 'FoodPrice(foodId: $foodId, filsPer100g: $filsPer100g)';
}


}

/// @nodoc
abstract mixin class _$FoodPriceCopyWith<$Res> implements $FoodPriceCopyWith<$Res> {
  factory _$FoodPriceCopyWith(_FoodPrice value, $Res Function(_FoodPrice) _then) = __$FoodPriceCopyWithImpl;
@override @useResult
$Res call({
 String foodId, int filsPer100g
});




}
/// @nodoc
class __$FoodPriceCopyWithImpl<$Res>
    implements _$FoodPriceCopyWith<$Res> {
  __$FoodPriceCopyWithImpl(this._self, this._then);

  final _FoodPrice _self;
  final $Res Function(_FoodPrice) _then;

/// Create a copy of FoodPrice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodId = null,Object? filsPer100g = null,}) {
  return _then(_FoodPrice(
foodId: null == foodId ? _self.foodId : foodId // ignore: cast_nullable_to_non_nullable
as String,filsPer100g: null == filsPer100g ? _self.filsPer100g : filsPer100g // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$PlannedDay {

 String get dayKey; String get meals;
/// Create a copy of PlannedDay
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlannedDayCopyWith<PlannedDay> get copyWith => _$PlannedDayCopyWithImpl<PlannedDay>(this as PlannedDay, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PlannedDay;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlannedDay&&(identical(other.dayKey, _this.dayKey) || other.dayKey == _this.dayKey)&&(identical(other.meals, _this.meals) || other.meals == _this.meals));
}


@override
int get hashCode {
  final _this = this as PlannedDay;
  return Object.hash(runtimeType,_this.dayKey,_this.meals);
}

@override
String toString() {
  final _this = this as PlannedDay;
  return 'PlannedDay(dayKey: ${_this.dayKey}, meals: ${_this.meals})';
}


}

/// @nodoc
abstract mixin class $PlannedDayCopyWith<$Res>  {
  factory $PlannedDayCopyWith(PlannedDay value, $Res Function(PlannedDay) _then) = _$PlannedDayCopyWithImpl;
@useResult
$Res call({
 String dayKey, String meals
});




}
/// @nodoc
class _$PlannedDayCopyWithImpl<$Res>
    implements $PlannedDayCopyWith<$Res> {
  _$PlannedDayCopyWithImpl(this._self, this._then);

  final PlannedDay _self;
  final $Res Function(PlannedDay) _then;

/// Create a copy of PlannedDay
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dayKey = null,Object? meals = null,}) {
  return _then(PlannedDay(
dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,meals: null == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlannedDay].
extension PlannedDayPatterns on PlannedDay {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlannedDay value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlannedDay() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlannedDay value)  $default,){
final _that = this;
switch (_that) {
case _PlannedDay():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlannedDay value)?  $default,){
final _that = this;
switch (_that) {
case _PlannedDay() when $default != null:
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
case _PlannedDay() when $default != null:
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
case _PlannedDay():
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
case _PlannedDay() when $default != null:
return $default(_that.dayKey,_that.meals);case _:
  return null;

}
}

}

/// @nodoc


class _PlannedDay implements PlannedDay {
  const _PlannedDay({required this.dayKey, required this.meals});


@override final  String dayKey;
@override final  String meals;

/// Create a copy of PlannedDay
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlannedDayCopyWith<_PlannedDay> get copyWith => __$PlannedDayCopyWithImpl<_PlannedDay>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlannedDay&&(identical(other.dayKey, dayKey) || other.dayKey == dayKey)&&(identical(other.meals, meals) || other.meals == meals));
}


@override
int get hashCode {
    return Object.hash(runtimeType,dayKey,meals);
}

@override
String toString() {
    return 'PlannedDay(dayKey: $dayKey, meals: $meals)';
}


}

/// @nodoc
abstract mixin class _$PlannedDayCopyWith<$Res> implements $PlannedDayCopyWith<$Res> {
  factory _$PlannedDayCopyWith(_PlannedDay value, $Res Function(_PlannedDay) _then) = __$PlannedDayCopyWithImpl;
@override @useResult
$Res call({
 String dayKey, String meals
});




}
/// @nodoc
class __$PlannedDayCopyWithImpl<$Res>
    implements _$PlannedDayCopyWith<$Res> {
  __$PlannedDayCopyWithImpl(this._self, this._then);

  final _PlannedDay _self;
  final $Res Function(_PlannedDay) _then;

/// Create a copy of PlannedDay
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dayKey = null,Object? meals = null,}) {
  return _then(_PlannedDay(
dayKey: null == dayKey ? _self.dayKey : dayKey // ignore: cast_nullable_to_non_nullable
as String,meals: null == meals ? _self.meals : meals // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$BudgetJournal {

 List<FoodExpense> get expenses; List<FoodPrice> get prices; List<PlannedDay> get plan;
/// Create a copy of BudgetJournal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetJournalCopyWith<BudgetJournal> get copyWith => _$BudgetJournalCopyWithImpl<BudgetJournal>(this as BudgetJournal, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BudgetJournal;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetJournal&&const DeepCollectionEquality().equals(other.expenses, _this.expenses)&&const DeepCollectionEquality().equals(other.prices, _this.prices)&&const DeepCollectionEquality().equals(other.plan, _this.plan));
}


@override
int get hashCode {
  final _this = this as BudgetJournal;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.expenses),const DeepCollectionEquality().hash(_this.prices),const DeepCollectionEquality().hash(_this.plan));
}

@override
String toString() {
  final _this = this as BudgetJournal;
  return 'BudgetJournal(expenses: ${_this.expenses}, prices: ${_this.prices}, plan: ${_this.plan})';
}


}

/// @nodoc
abstract mixin class $BudgetJournalCopyWith<$Res>  {
  factory $BudgetJournalCopyWith(BudgetJournal value, $Res Function(BudgetJournal) _then) = _$BudgetJournalCopyWithImpl;
@useResult
$Res call({
 List<FoodExpense> expenses, List<FoodPrice> prices, List<PlannedDay> plan
});




}
/// @nodoc
class _$BudgetJournalCopyWithImpl<$Res>
    implements $BudgetJournalCopyWith<$Res> {
  _$BudgetJournalCopyWithImpl(this._self, this._then);

  final BudgetJournal _self;
  final $Res Function(BudgetJournal) _then;

/// Create a copy of BudgetJournal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? expenses = null,Object? prices = null,Object? plan = null,}) {
  return _then(BudgetJournal(
expenses: null == expenses ? _self.expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<FoodExpense>,prices: null == prices ? _self.prices : prices // ignore: cast_nullable_to_non_nullable
as List<FoodPrice>,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as List<PlannedDay>,
  ));
}

}


/// Adds pattern-matching-related methods to [BudgetJournal].
extension BudgetJournalPatterns on BudgetJournal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetJournal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetJournal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetJournal value)  $default,){
final _that = this;
switch (_that) {
case _BudgetJournal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetJournal value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetJournal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<FoodExpense> expenses,  List<FoodPrice> prices,  List<PlannedDay> plan)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetJournal() when $default != null:
return $default(_that.expenses,_that.prices,_that.plan);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<FoodExpense> expenses,  List<FoodPrice> prices,  List<PlannedDay> plan)  $default,) {final _that = this;
switch (_that) {
case _BudgetJournal():
return $default(_that.expenses,_that.prices,_that.plan);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<FoodExpense> expenses,  List<FoodPrice> prices,  List<PlannedDay> plan)?  $default,) {final _that = this;
switch (_that) {
case _BudgetJournal() when $default != null:
return $default(_that.expenses,_that.prices,_that.plan);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetJournal implements BudgetJournal {
  const _BudgetJournal({ List<FoodExpense> expenses = const [],  List<FoodPrice> prices = const [],  List<PlannedDay> plan = const []}): _expenses = expenses,_prices = prices,_plan = plan;


 final  List<FoodExpense> _expenses;
@override@JsonKey() List<FoodExpense> get expenses {
  if (_expenses is EqualUnmodifiableListView) return _expenses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_expenses);
}

 final  List<FoodPrice> _prices;
@override@JsonKey() List<FoodPrice> get prices {
  if (_prices is EqualUnmodifiableListView) return _prices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_prices);
}

 final  List<PlannedDay> _plan;
@override@JsonKey() List<PlannedDay> get plan {
  if (_plan is EqualUnmodifiableListView) return _plan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plan);
}


/// Create a copy of BudgetJournal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetJournalCopyWith<_BudgetJournal> get copyWith => __$BudgetJournalCopyWithImpl<_BudgetJournal>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetJournal&&const DeepCollectionEquality().equals(other.expenses, _expenses)&&const DeepCollectionEquality().equals(other.prices, _prices)&&const DeepCollectionEquality().equals(other.plan, _plan));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_expenses),const DeepCollectionEquality().hash(_prices),const DeepCollectionEquality().hash(_plan));
}

@override
String toString() {
    return 'BudgetJournal(expenses: $expenses, prices: $prices, plan: $plan)';
}


}

/// @nodoc
abstract mixin class _$BudgetJournalCopyWith<$Res> implements $BudgetJournalCopyWith<$Res> {
  factory _$BudgetJournalCopyWith(_BudgetJournal value, $Res Function(_BudgetJournal) _then) = __$BudgetJournalCopyWithImpl;
@override @useResult
$Res call({
 List<FoodExpense> expenses, List<FoodPrice> prices, List<PlannedDay> plan
});




}
/// @nodoc
class __$BudgetJournalCopyWithImpl<$Res>
    implements _$BudgetJournalCopyWith<$Res> {
  __$BudgetJournalCopyWithImpl(this._self, this._then);

  final _BudgetJournal _self;
  final $Res Function(_BudgetJournal) _then;

/// Create a copy of BudgetJournal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? expenses = null,Object? prices = null,Object? plan = null,}) {
  return _then(_BudgetJournal(
expenses: null == expenses ? _self._expenses : expenses // ignore: cast_nullable_to_non_nullable
as List<FoodExpense>,prices: null == prices ? _self._prices : prices // ignore: cast_nullable_to_non_nullable
as List<FoodPrice>,plan: null == plan ? _self._plan : plan // ignore: cast_nullable_to_non_nullable
as List<PlannedDay>,
  ));
}


}

// dart format on
