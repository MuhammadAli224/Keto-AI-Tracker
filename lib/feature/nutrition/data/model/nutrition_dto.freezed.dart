// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientsDto {

 double? get kcal; double? get protein; double? get carbs; double? get fiber; double? get fat; CarbBasis get carbBasis;
/// Create a copy of NutrientsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientsDtoCopyWith<NutrientsDto> get copyWith => _$NutrientsDtoCopyWithImpl<NutrientsDto>(this as NutrientsDto, _$identity);

  /// Serializes this NutrientsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NutrientsDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientsDto&&(identical(other.kcal, _this.kcal) || other.kcal == _this.kcal)&&(identical(other.protein, _this.protein) || other.protein == _this.protein)&&(identical(other.carbs, _this.carbs) || other.carbs == _this.carbs)&&(identical(other.fiber, _this.fiber) || other.fiber == _this.fiber)&&(identical(other.fat, _this.fat) || other.fat == _this.fat)&&(identical(other.carbBasis, _this.carbBasis) || other.carbBasis == _this.carbBasis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NutrientsDto;
  return Object.hash(runtimeType,_this.kcal,_this.protein,_this.carbs,_this.fiber,_this.fat,_this.carbBasis);
}

@override
String toString() {
  final _this = this as NutrientsDto;
  return 'NutrientsDto(kcal: ${_this.kcal}, protein: ${_this.protein}, carbs: ${_this.carbs}, fiber: ${_this.fiber}, fat: ${_this.fat}, carbBasis: ${_this.carbBasis})';
}


}

/// @nodoc
abstract mixin class $NutrientsDtoCopyWith<$Res>  {
  factory $NutrientsDtoCopyWith(NutrientsDto value, $Res Function(NutrientsDto) _then) = _$NutrientsDtoCopyWithImpl;
@useResult
$Res call({
 double? kcal, double? protein, double? carbs, double? fiber, double? fat, CarbBasis carbBasis
});




}
/// @nodoc
class _$NutrientsDtoCopyWithImpl<$Res>
    implements $NutrientsDtoCopyWith<$Res> {
  _$NutrientsDtoCopyWithImpl(this._self, this._then);

  final NutrientsDto _self;
  final $Res Function(NutrientsDto) _then;

/// Create a copy of NutrientsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kcal = freezed,Object? protein = freezed,Object? carbs = freezed,Object? fiber = freezed,Object? fat = freezed,Object? carbBasis = null,}) {
  return _then(NutrientsDto(
kcal: freezed == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,carbBasis: null == carbBasis ? _self.carbBasis : carbBasis // ignore: cast_nullable_to_non_nullable
as CarbBasis,
  ));
}

}


/// Adds pattern-matching-related methods to [NutrientsDto].
extension NutrientsDtoPatterns on NutrientsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientsDto value)  $default,){
final _that = this;
switch (_that) {
case _NutrientsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientsDto value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double? kcal,  double? protein,  double? carbs,  double? fiber,  double? fat,  CarbBasis carbBasis)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientsDto() when $default != null:
return $default(_that.kcal,_that.protein,_that.carbs,_that.fiber,_that.fat,_that.carbBasis);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double? kcal,  double? protein,  double? carbs,  double? fiber,  double? fat,  CarbBasis carbBasis)  $default,) {final _that = this;
switch (_that) {
case _NutrientsDto():
return $default(_that.kcal,_that.protein,_that.carbs,_that.fiber,_that.fat,_that.carbBasis);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double? kcal,  double? protein,  double? carbs,  double? fiber,  double? fat,  CarbBasis carbBasis)?  $default,) {final _that = this;
switch (_that) {
case _NutrientsDto() when $default != null:
return $default(_that.kcal,_that.protein,_that.carbs,_that.fiber,_that.fat,_that.carbBasis);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutrientsDto implements NutrientsDto {
  const _NutrientsDto({this.kcal, this.protein, this.carbs, this.fiber, this.fat, this.carbBasis = CarbBasis.includesFiber});
  factory _NutrientsDto.fromJson(Map<String, dynamic> json) => _$NutrientsDtoFromJson(json);

@override final  double? kcal;
@override final  double? protein;
@override final  double? carbs;
@override final  double? fiber;
@override final  double? fat;
@override@JsonKey() final  CarbBasis carbBasis;

/// Create a copy of NutrientsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientsDtoCopyWith<_NutrientsDto> get copyWith => __$NutrientsDtoCopyWithImpl<_NutrientsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrientsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientsDto&&(identical(other.kcal, kcal) || other.kcal == kcal)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.fiber, fiber) || other.fiber == fiber)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.carbBasis, carbBasis) || other.carbBasis == carbBasis));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,kcal,protein,carbs,fiber,fat,carbBasis);
}

@override
String toString() {
    return 'NutrientsDto(kcal: $kcal, protein: $protein, carbs: $carbs, fiber: $fiber, fat: $fat, carbBasis: $carbBasis)';
}


}

/// @nodoc
abstract mixin class _$NutrientsDtoCopyWith<$Res> implements $NutrientsDtoCopyWith<$Res> {
  factory _$NutrientsDtoCopyWith(_NutrientsDto value, $Res Function(_NutrientsDto) _then) = __$NutrientsDtoCopyWithImpl;
@override @useResult
$Res call({
 double? kcal, double? protein, double? carbs, double? fiber, double? fat, CarbBasis carbBasis
});




}
/// @nodoc
class __$NutrientsDtoCopyWithImpl<$Res>
    implements _$NutrientsDtoCopyWith<$Res> {
  __$NutrientsDtoCopyWithImpl(this._self, this._then);

  final _NutrientsDto _self;
  final $Res Function(_NutrientsDto) _then;

/// Create a copy of NutrientsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kcal = freezed,Object? protein = freezed,Object? carbs = freezed,Object? fiber = freezed,Object? fat = freezed,Object? carbBasis = null,}) {
  return _then(_NutrientsDto(
kcal: freezed == kcal ? _self.kcal : kcal // ignore: cast_nullable_to_non_nullable
as double?,protein: freezed == protein ? _self.protein : protein // ignore: cast_nullable_to_non_nullable
as double?,carbs: freezed == carbs ? _self.carbs : carbs // ignore: cast_nullable_to_non_nullable
as double?,fiber: freezed == fiber ? _self.fiber : fiber // ignore: cast_nullable_to_non_nullable
as double?,fat: freezed == fat ? _self.fat : fat // ignore: cast_nullable_to_non_nullable
as double?,carbBasis: null == carbBasis ? _self.carbBasis : carbBasis // ignore: cast_nullable_to_non_nullable
as CarbBasis,
  ));
}


}


/// @nodoc
mixin _$ServingDto {

 String get foodId; String get name; double get edibleGrams; NutrientsDto get nutrients; NutritionSource get source; String? get sourceReference;
/// Create a copy of ServingDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServingDtoCopyWith<ServingDto> get copyWith => _$ServingDtoCopyWithImpl<ServingDto>(this as ServingDto, _$identity);

  /// Serializes this ServingDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ServingDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServingDto&&(identical(other.foodId, _this.foodId) || other.foodId == _this.foodId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.edibleGrams, _this.edibleGrams) || other.edibleGrams == _this.edibleGrams)&&(identical(other.nutrients, _this.nutrients) || other.nutrients == _this.nutrients)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.sourceReference, _this.sourceReference) || other.sourceReference == _this.sourceReference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ServingDto;
  return Object.hash(runtimeType,_this.foodId,_this.name,_this.edibleGrams,_this.nutrients,_this.source,_this.sourceReference);
}

@override
String toString() {
  final _this = this as ServingDto;
  return 'ServingDto(foodId: ${_this.foodId}, name: ${_this.name}, edibleGrams: ${_this.edibleGrams}, nutrients: ${_this.nutrients}, source: ${_this.source}, sourceReference: ${_this.sourceReference})';
}


}

/// @nodoc
abstract mixin class $ServingDtoCopyWith<$Res>  {
  factory $ServingDtoCopyWith(ServingDto value, $Res Function(ServingDto) _then) = _$ServingDtoCopyWithImpl;
@useResult
$Res call({
 String foodId, String name, double edibleGrams, NutrientsDto nutrients, NutritionSource source, String? sourceReference
});


$NutrientsDtoCopyWith<$Res> get nutrients;

}
/// @nodoc
class _$ServingDtoCopyWithImpl<$Res>
    implements $ServingDtoCopyWith<$Res> {
  _$ServingDtoCopyWithImpl(this._self, this._then);

  final ServingDto _self;
  final $Res Function(ServingDto) _then;

/// Create a copy of ServingDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodId = null,Object? name = null,Object? edibleGrams = null,Object? nutrients = null,Object? source = null,Object? sourceReference = freezed,}) {
  return _then(ServingDto(
foodId: null == foodId ? _self.foodId : foodId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,edibleGrams: null == edibleGrams ? _self.edibleGrams : edibleGrams // ignore: cast_nullable_to_non_nullable
as double,nutrients: null == nutrients ? _self.nutrients : nutrients // ignore: cast_nullable_to_non_nullable
as NutrientsDto,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as NutritionSource,sourceReference: freezed == sourceReference ? _self.sourceReference : sourceReference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ServingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsDtoCopyWith<$Res> get nutrients {

  return $NutrientsDtoCopyWith<$Res>(_self.nutrients, (value) {
    return _then(_self.copyWith(nutrients: value));
  });
}
}


/// Adds pattern-matching-related methods to [ServingDto].
extension ServingDtoPatterns on ServingDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServingDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServingDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServingDto value)  $default,){
final _that = this;
switch (_that) {
case _ServingDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServingDto value)?  $default,){
final _that = this;
switch (_that) {
case _ServingDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String foodId,  String name,  double edibleGrams,  NutrientsDto nutrients,  NutritionSource source,  String? sourceReference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServingDto() when $default != null:
return $default(_that.foodId,_that.name,_that.edibleGrams,_that.nutrients,_that.source,_that.sourceReference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String foodId,  String name,  double edibleGrams,  NutrientsDto nutrients,  NutritionSource source,  String? sourceReference)  $default,) {final _that = this;
switch (_that) {
case _ServingDto():
return $default(_that.foodId,_that.name,_that.edibleGrams,_that.nutrients,_that.source,_that.sourceReference);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String foodId,  String name,  double edibleGrams,  NutrientsDto nutrients,  NutritionSource source,  String? sourceReference)?  $default,) {final _that = this;
switch (_that) {
case _ServingDto() when $default != null:
return $default(_that.foodId,_that.name,_that.edibleGrams,_that.nutrients,_that.source,_that.sourceReference);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ServingDto implements ServingDto {
  const _ServingDto({required this.foodId, required this.name, required this.edibleGrams, required this.nutrients, required this.source, this.sourceReference});
  factory _ServingDto.fromJson(Map<String, dynamic> json) => _$ServingDtoFromJson(json);

@override final  String foodId;
@override final  String name;
@override final  double edibleGrams;
@override final  NutrientsDto nutrients;
@override final  NutritionSource source;
@override final  String? sourceReference;

/// Create a copy of ServingDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServingDtoCopyWith<_ServingDto> get copyWith => __$ServingDtoCopyWithImpl<_ServingDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServingDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServingDto&&(identical(other.foodId, foodId) || other.foodId == foodId)&&(identical(other.name, name) || other.name == name)&&(identical(other.edibleGrams, edibleGrams) || other.edibleGrams == edibleGrams)&&(identical(other.nutrients, nutrients) || other.nutrients == nutrients)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceReference, sourceReference) || other.sourceReference == sourceReference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,foodId,name,edibleGrams,nutrients,source,sourceReference);
}

@override
String toString() {
    return 'ServingDto(foodId: $foodId, name: $name, edibleGrams: $edibleGrams, nutrients: $nutrients, source: $source, sourceReference: $sourceReference)';
}


}

/// @nodoc
abstract mixin class _$ServingDtoCopyWith<$Res> implements $ServingDtoCopyWith<$Res> {
  factory _$ServingDtoCopyWith(_ServingDto value, $Res Function(_ServingDto) _then) = __$ServingDtoCopyWithImpl;
@override @useResult
$Res call({
 String foodId, String name, double edibleGrams, NutrientsDto nutrients, NutritionSource source, String? sourceReference
});


@override $NutrientsDtoCopyWith<$Res> get nutrients;

}
/// @nodoc
class __$ServingDtoCopyWithImpl<$Res>
    implements _$ServingDtoCopyWith<$Res> {
  __$ServingDtoCopyWithImpl(this._self, this._then);

  final _ServingDto _self;
  final $Res Function(_ServingDto) _then;

/// Create a copy of ServingDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodId = null,Object? name = null,Object? edibleGrams = null,Object? nutrients = null,Object? source = null,Object? sourceReference = freezed,}) {
  return _then(_ServingDto(
foodId: null == foodId ? _self.foodId : foodId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,edibleGrams: null == edibleGrams ? _self.edibleGrams : edibleGrams // ignore: cast_nullable_to_non_nullable
as double,nutrients: null == nutrients ? _self.nutrients : nutrients // ignore: cast_nullable_to_non_nullable
as NutrientsDto,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as NutritionSource,sourceReference: freezed == sourceReference ? _self.sourceReference : sourceReference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ServingDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsDtoCopyWith<$Res> get nutrients {

  return $NutrientsDtoCopyWith<$Res>(_self.nutrients, (value) {
    return _then(_self.copyWith(nutrients: value));
  });
}
}


/// @nodoc
mixin _$RecipeDto {

 double get yieldGrams; List<ServingDto> get ingredients;
/// Create a copy of RecipeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeDtoCopyWith<RecipeDto> get copyWith => _$RecipeDtoCopyWithImpl<RecipeDto>(this as RecipeDto, _$identity);

  /// Serializes this RecipeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RecipeDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeDto&&(identical(other.yieldGrams, _this.yieldGrams) || other.yieldGrams == _this.yieldGrams)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RecipeDto;
  return Object.hash(runtimeType,_this.yieldGrams,const DeepCollectionEquality().hash(_this.ingredients));
}

@override
String toString() {
  final _this = this as RecipeDto;
  return 'RecipeDto(yieldGrams: ${_this.yieldGrams}, ingredients: ${_this.ingredients})';
}


}

/// @nodoc
abstract mixin class $RecipeDtoCopyWith<$Res>  {
  factory $RecipeDtoCopyWith(RecipeDto value, $Res Function(RecipeDto) _then) = _$RecipeDtoCopyWithImpl;
@useResult
$Res call({
 double yieldGrams, List<ServingDto> ingredients
});




}
/// @nodoc
class _$RecipeDtoCopyWithImpl<$Res>
    implements $RecipeDtoCopyWith<$Res> {
  _$RecipeDtoCopyWithImpl(this._self, this._then);

  final RecipeDto _self;
  final $Res Function(RecipeDto) _then;

/// Create a copy of RecipeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? yieldGrams = null,Object? ingredients = null,}) {
  return _then(RecipeDto(
yieldGrams: null == yieldGrams ? _self.yieldGrams : yieldGrams // ignore: cast_nullable_to_non_nullable
as double,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<ServingDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeDto].
extension RecipeDtoPatterns on RecipeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeDto value)  $default,){
final _that = this;
switch (_that) {
case _RecipeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeDto value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double yieldGrams,  List<ServingDto> ingredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeDto() when $default != null:
return $default(_that.yieldGrams,_that.ingredients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double yieldGrams,  List<ServingDto> ingredients)  $default,) {final _that = this;
switch (_that) {
case _RecipeDto():
return $default(_that.yieldGrams,_that.ingredients);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double yieldGrams,  List<ServingDto> ingredients)?  $default,) {final _that = this;
switch (_that) {
case _RecipeDto() when $default != null:
return $default(_that.yieldGrams,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _RecipeDto implements RecipeDto {
  const _RecipeDto({required this.yieldGrams, required  List<ServingDto> ingredients}): _ingredients = ingredients;
  factory _RecipeDto.fromJson(Map<String, dynamic> json) => _$RecipeDtoFromJson(json);

@override final  double yieldGrams;
 final  List<ServingDto> _ingredients;
@override List<ServingDto> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of RecipeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeDtoCopyWith<_RecipeDto> get copyWith => __$RecipeDtoCopyWithImpl<_RecipeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeDto&&(identical(other.yieldGrams, yieldGrams) || other.yieldGrams == yieldGrams)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,yieldGrams,const DeepCollectionEquality().hash(_ingredients));
}

@override
String toString() {
    return 'RecipeDto(yieldGrams: $yieldGrams, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$RecipeDtoCopyWith<$Res> implements $RecipeDtoCopyWith<$Res> {
  factory _$RecipeDtoCopyWith(_RecipeDto value, $Res Function(_RecipeDto) _then) = __$RecipeDtoCopyWithImpl;
@override @useResult
$Res call({
 double yieldGrams, List<ServingDto> ingredients
});




}
/// @nodoc
class __$RecipeDtoCopyWithImpl<$Res>
    implements _$RecipeDtoCopyWith<$Res> {
  __$RecipeDtoCopyWithImpl(this._self, this._then);

  final _RecipeDto _self;
  final $Res Function(_RecipeDto) _then;

/// Create a copy of RecipeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? yieldGrams = null,Object? ingredients = null,}) {
  return _then(_RecipeDto(
yieldGrams: null == yieldGrams ? _self.yieldGrams : yieldGrams // ignore: cast_nullable_to_non_nullable
as double,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<ServingDto>,
  ));
}


}


/// @nodoc
mixin _$FoodDto {

 String get id; String get name; NutritionSource get source; NutrientsDto get per100g; String? get sourceReference; RecipeDto? get recipe;
/// Create a copy of FoodDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodDtoCopyWith<FoodDto> get copyWith => _$FoodDtoCopyWithImpl<FoodDto>(this as FoodDto, _$identity);

  /// Serializes this FoodDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as FoodDto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodDto&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.per100g, _this.per100g) || other.per100g == _this.per100g)&&(identical(other.sourceReference, _this.sourceReference) || other.sourceReference == _this.sourceReference)&&(identical(other.recipe, _this.recipe) || other.recipe == _this.recipe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as FoodDto;
  return Object.hash(runtimeType,_this.id,_this.name,_this.source,_this.per100g,_this.sourceReference,_this.recipe);
}

@override
String toString() {
  final _this = this as FoodDto;
  return 'FoodDto(id: ${_this.id}, name: ${_this.name}, source: ${_this.source}, per100g: ${_this.per100g}, sourceReference: ${_this.sourceReference}, recipe: ${_this.recipe})';
}


}

/// @nodoc
abstract mixin class $FoodDtoCopyWith<$Res>  {
  factory $FoodDtoCopyWith(FoodDto value, $Res Function(FoodDto) _then) = _$FoodDtoCopyWithImpl;
@useResult
$Res call({
 String id, String name, NutritionSource source, NutrientsDto per100g, String? sourceReference, RecipeDto? recipe
});


$NutrientsDtoCopyWith<$Res> get per100g;$RecipeDtoCopyWith<$Res>? get recipe;

}
/// @nodoc
class _$FoodDtoCopyWithImpl<$Res>
    implements $FoodDtoCopyWith<$Res> {
  _$FoodDtoCopyWithImpl(this._self, this._then);

  final FoodDto _self;
  final $Res Function(FoodDto) _then;

/// Create a copy of FoodDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? source = null,Object? per100g = null,Object? sourceReference = freezed,Object? recipe = freezed,}) {
  return _then(FoodDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as NutritionSource,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as NutrientsDto,sourceReference: freezed == sourceReference ? _self.sourceReference : sourceReference // ignore: cast_nullable_to_non_nullable
as String?,recipe: freezed == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeDto?,
  ));
}
/// Create a copy of FoodDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsDtoCopyWith<$Res> get per100g {

  return $NutrientsDtoCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}/// Create a copy of FoodDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeDtoCopyWith<$Res>? get recipe {
    if (_self.recipe == null) {
    return null;
  }

  return $RecipeDtoCopyWith<$Res>(_self.recipe!, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [FoodDto].
extension FoodDtoPatterns on FoodDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodDto value)  $default,){
final _that = this;
switch (_that) {
case _FoodDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodDto value)?  $default,){
final _that = this;
switch (_that) {
case _FoodDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  NutritionSource source,  NutrientsDto per100g,  String? sourceReference,  RecipeDto? recipe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodDto() when $default != null:
return $default(_that.id,_that.name,_that.source,_that.per100g,_that.sourceReference,_that.recipe);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  NutritionSource source,  NutrientsDto per100g,  String? sourceReference,  RecipeDto? recipe)  $default,) {final _that = this;
switch (_that) {
case _FoodDto():
return $default(_that.id,_that.name,_that.source,_that.per100g,_that.sourceReference,_that.recipe);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  NutritionSource source,  NutrientsDto per100g,  String? sourceReference,  RecipeDto? recipe)?  $default,) {final _that = this;
switch (_that) {
case _FoodDto() when $default != null:
return $default(_that.id,_that.name,_that.source,_that.per100g,_that.sourceReference,_that.recipe);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _FoodDto implements FoodDto {
  const _FoodDto({required this.id, required this.name, required this.source, required this.per100g, this.sourceReference, this.recipe});
  factory _FoodDto.fromJson(Map<String, dynamic> json) => _$FoodDtoFromJson(json);

@override final  String id;
@override final  String name;
@override final  NutritionSource source;
@override final  NutrientsDto per100g;
@override final  String? sourceReference;
@override final  RecipeDto? recipe;

/// Create a copy of FoodDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodDtoCopyWith<_FoodDto> get copyWith => __$FoodDtoCopyWithImpl<_FoodDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodDtoToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.source, source) || other.source == source)&&(identical(other.per100g, per100g) || other.per100g == per100g)&&(identical(other.sourceReference, sourceReference) || other.sourceReference == sourceReference)&&(identical(other.recipe, recipe) || other.recipe == recipe));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,source,per100g,sourceReference,recipe);
}

@override
String toString() {
    return 'FoodDto(id: $id, name: $name, source: $source, per100g: $per100g, sourceReference: $sourceReference, recipe: $recipe)';
}


}

/// @nodoc
abstract mixin class _$FoodDtoCopyWith<$Res> implements $FoodDtoCopyWith<$Res> {
  factory _$FoodDtoCopyWith(_FoodDto value, $Res Function(_FoodDto) _then) = __$FoodDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, NutritionSource source, NutrientsDto per100g, String? sourceReference, RecipeDto? recipe
});


@override $NutrientsDtoCopyWith<$Res> get per100g;@override $RecipeDtoCopyWith<$Res>? get recipe;

}
/// @nodoc
class __$FoodDtoCopyWithImpl<$Res>
    implements _$FoodDtoCopyWith<$Res> {
  __$FoodDtoCopyWithImpl(this._self, this._then);

  final _FoodDto _self;
  final $Res Function(_FoodDto) _then;

/// Create a copy of FoodDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? source = null,Object? per100g = null,Object? sourceReference = freezed,Object? recipe = freezed,}) {
  return _then(_FoodDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as NutritionSource,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as NutrientsDto,sourceReference: freezed == sourceReference ? _self.sourceReference : sourceReference // ignore: cast_nullable_to_non_nullable
as String?,recipe: freezed == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as RecipeDto?,
  ));
}

/// Create a copy of FoodDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsDtoCopyWith<$Res> get per100g {

  return $NutrientsDtoCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}/// Create a copy of FoodDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeDtoCopyWith<$Res>? get recipe {
    if (_self.recipe == null) {
    return null;
  }

  return $RecipeDtoCopyWith<$Res>(_self.recipe!, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

// dart format on
