// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Nutrients {

 double? get kcal; double? get protein; double? get carbs; double? get fiber; double? get fat; CarbBasis get carbBasis;
/// Create a copy of Nutrients
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientsCopyWith<Nutrients> get copyWith => _$NutrientsCopyWithImpl<Nutrients>(this as Nutrients, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Nutrients;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Nutrients&&(identical(other.kcal, _this.kcal) || other.kcal == _this.kcal)&&(identical(other.protein, _this.protein) || other.protein == _this.protein)&&(identical(other.carbs, _this.carbs) || other.carbs == _this.carbs)&&(identical(other.fiber, _this.fiber) || other.fiber == _this.fiber)&&(identical(other.fat, _this.fat) || other.fat == _this.fat)&&(identical(other.carbBasis, _this.carbBasis) || other.carbBasis == _this.carbBasis));
}


@override
int get hashCode {
  final _this = this as Nutrients;
  return Object.hash(runtimeType,_this.kcal,_this.protein,_this.carbs,_this.fiber,_this.fat,_this.carbBasis);
}

@override
String toString() {
  final _this = this as Nutrients;
  return 'Nutrients(kcal: ${_this.kcal}, protein: ${_this.protein}, carbs: ${_this.carbs}, fiber: ${_this.fiber}, fat: ${_this.fat}, carbBasis: ${_this.carbBasis})';
}


}

/// @nodoc
abstract mixin class $NutrientsCopyWith<$Res>  {
  factory $NutrientsCopyWith(Nutrients value, $Res Function(Nutrients) _then) = _$NutrientsCopyWithImpl;
@useResult
$Res call({
 double? kcal, double? protein, double? carbs, double? fiber, double? fat, CarbBasis carbBasis
});




}
/// @nodoc
class _$NutrientsCopyWithImpl<$Res>
    implements $NutrientsCopyWith<$Res> {
  _$NutrientsCopyWithImpl(this._self, this._then);

  final Nutrients _self;
  final $Res Function(Nutrients) _then;

/// Create a copy of Nutrients
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kcal = freezed,Object? protein = freezed,Object? carbs = freezed,Object? fiber = freezed,Object? fat = freezed,Object? carbBasis = null,}) {
  return _then(Nutrients(
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


/// Adds pattern-matching-related methods to [Nutrients].
extension NutrientsPatterns on Nutrients {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Nutrients value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Nutrients() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Nutrients value)  $default,){
final _that = this;
switch (_that) {
case _Nutrients():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Nutrients value)?  $default,){
final _that = this;
switch (_that) {
case _Nutrients() when $default != null:
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
case _Nutrients() when $default != null:
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
case _Nutrients():
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
case _Nutrients() when $default != null:
return $default(_that.kcal,_that.protein,_that.carbs,_that.fiber,_that.fat,_that.carbBasis);case _:
  return null;

}
}

}

/// @nodoc


class _Nutrients extends Nutrients {
  const _Nutrients({this.kcal, this.protein, this.carbs, this.fiber, this.fat, this.carbBasis = CarbBasis.includesFiber}): super._();


@override final  double? kcal;
@override final  double? protein;
@override final  double? carbs;
@override final  double? fiber;
@override final  double? fat;
@override@JsonKey() final  CarbBasis carbBasis;

/// Create a copy of Nutrients
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientsCopyWith<_Nutrients> get copyWith => __$NutrientsCopyWithImpl<_Nutrients>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Nutrients&&(identical(other.kcal, kcal) || other.kcal == kcal)&&(identical(other.protein, protein) || other.protein == protein)&&(identical(other.carbs, carbs) || other.carbs == carbs)&&(identical(other.fiber, fiber) || other.fiber == fiber)&&(identical(other.fat, fat) || other.fat == fat)&&(identical(other.carbBasis, carbBasis) || other.carbBasis == carbBasis));
}


@override
int get hashCode {
    return Object.hash(runtimeType,kcal,protein,carbs,fiber,fat,carbBasis);
}

@override
String toString() {
    return 'Nutrients(kcal: $kcal, protein: $protein, carbs: $carbs, fiber: $fiber, fat: $fat, carbBasis: $carbBasis)';
}


}

/// @nodoc
abstract mixin class _$NutrientsCopyWith<$Res> implements $NutrientsCopyWith<$Res> {
  factory _$NutrientsCopyWith(_Nutrients value, $Res Function(_Nutrients) _then) = __$NutrientsCopyWithImpl;
@override @useResult
$Res call({
 double? kcal, double? protein, double? carbs, double? fiber, double? fat, CarbBasis carbBasis
});




}
/// @nodoc
class __$NutrientsCopyWithImpl<$Res>
    implements _$NutrientsCopyWith<$Res> {
  __$NutrientsCopyWithImpl(this._self, this._then);

  final _Nutrients _self;
  final $Res Function(_Nutrients) _then;

/// Create a copy of Nutrients
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kcal = freezed,Object? protein = freezed,Object? carbs = freezed,Object? fiber = freezed,Object? fat = freezed,Object? carbBasis = null,}) {
  return _then(_Nutrients(
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
mixin _$Food {

 String get id; String get name; NutritionSource get source; Nutrients get per100g; String? get sourceReference; Recipe? get recipe;
/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodCopyWith<Food> get copyWith => _$FoodCopyWithImpl<Food>(this as Food, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Food;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Food&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.per100g, _this.per100g) || other.per100g == _this.per100g)&&(identical(other.sourceReference, _this.sourceReference) || other.sourceReference == _this.sourceReference)&&(identical(other.recipe, _this.recipe) || other.recipe == _this.recipe));
}


@override
int get hashCode {
  final _this = this as Food;
  return Object.hash(runtimeType,_this.id,_this.name,_this.source,_this.per100g,_this.sourceReference,_this.recipe);
}

@override
String toString() {
  final _this = this as Food;
  return 'Food(id: ${_this.id}, name: ${_this.name}, source: ${_this.source}, per100g: ${_this.per100g}, sourceReference: ${_this.sourceReference}, recipe: ${_this.recipe})';
}


}

/// @nodoc
abstract mixin class $FoodCopyWith<$Res>  {
  factory $FoodCopyWith(Food value, $Res Function(Food) _then) = _$FoodCopyWithImpl;
@useResult
$Res call({
 String id, String name, NutritionSource source, Nutrients per100g, String? sourceReference, Recipe? recipe
});


$NutrientsCopyWith<$Res> get per100g;$RecipeCopyWith<$Res>? get recipe;

}
/// @nodoc
class _$FoodCopyWithImpl<$Res>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._self, this._then);

  final Food _self;
  final $Res Function(Food) _then;

/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? source = null,Object? per100g = null,Object? sourceReference = freezed,Object? recipe = freezed,}) {
  return _then(Food(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as NutritionSource,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as Nutrients,sourceReference: freezed == sourceReference ? _self.sourceReference : sourceReference // ignore: cast_nullable_to_non_nullable
as String?,recipe: freezed == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe?,
  ));
}
/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get per100g {

  return $NutrientsCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res>? get recipe {
    if (_self.recipe == null) {
    return null;
  }

  return $RecipeCopyWith<$Res>(_self.recipe!, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [Food].
extension FoodPatterns on Food {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Food value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Food() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Food value)  $default,){
final _that = this;
switch (_that) {
case _Food():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Food value)?  $default,){
final _that = this;
switch (_that) {
case _Food() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  NutritionSource source,  Nutrients per100g,  String? sourceReference,  Recipe? recipe)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Food() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  NutritionSource source,  Nutrients per100g,  String? sourceReference,  Recipe? recipe)  $default,) {final _that = this;
switch (_that) {
case _Food():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  NutritionSource source,  Nutrients per100g,  String? sourceReference,  Recipe? recipe)?  $default,) {final _that = this;
switch (_that) {
case _Food() when $default != null:
return $default(_that.id,_that.name,_that.source,_that.per100g,_that.sourceReference,_that.recipe);case _:
  return null;

}
}

}

/// @nodoc


class _Food extends Food {
  const _Food({required this.id, required this.name, required this.source, required this.per100g, this.sourceReference, this.recipe}): super._();


@override final  String id;
@override final  String name;
@override final  NutritionSource source;
@override final  Nutrients per100g;
@override final  String? sourceReference;
@override final  Recipe? recipe;

/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodCopyWith<_Food> get copyWith => __$FoodCopyWithImpl<_Food>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Food&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.source, source) || other.source == source)&&(identical(other.per100g, per100g) || other.per100g == per100g)&&(identical(other.sourceReference, sourceReference) || other.sourceReference == sourceReference)&&(identical(other.recipe, recipe) || other.recipe == recipe));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,name,source,per100g,sourceReference,recipe);
}

@override
String toString() {
    return 'Food(id: $id, name: $name, source: $source, per100g: $per100g, sourceReference: $sourceReference, recipe: $recipe)';
}


}

/// @nodoc
abstract mixin class _$FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$FoodCopyWith(_Food value, $Res Function(_Food) _then) = __$FoodCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, NutritionSource source, Nutrients per100g, String? sourceReference, Recipe? recipe
});


@override $NutrientsCopyWith<$Res> get per100g;@override $RecipeCopyWith<$Res>? get recipe;

}
/// @nodoc
class __$FoodCopyWithImpl<$Res>
    implements _$FoodCopyWith<$Res> {
  __$FoodCopyWithImpl(this._self, this._then);

  final _Food _self;
  final $Res Function(_Food) _then;

/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? source = null,Object? per100g = null,Object? sourceReference = freezed,Object? recipe = freezed,}) {
  return _then(_Food(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as NutritionSource,per100g: null == per100g ? _self.per100g : per100g // ignore: cast_nullable_to_non_nullable
as Nutrients,sourceReference: freezed == sourceReference ? _self.sourceReference : sourceReference // ignore: cast_nullable_to_non_nullable
as String?,recipe: freezed == recipe ? _self.recipe : recipe // ignore: cast_nullable_to_non_nullable
as Recipe?,
  ));
}

/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get per100g {

  return $NutrientsCopyWith<$Res>(_self.per100g, (value) {
    return _then(_self.copyWith(per100g: value));
  });
}/// Create a copy of Food
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeCopyWith<$Res>? get recipe {
    if (_self.recipe == null) {
    return null;
  }

  return $RecipeCopyWith<$Res>(_self.recipe!, (value) {
    return _then(_self.copyWith(recipe: value));
  });
}
}

/// @nodoc
mixin _$Serving {

 String get foodId; String get name; double get edibleGrams; Nutrients get nutrients; NutritionSource get source; String? get sourceReference;
/// Create a copy of Serving
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServingCopyWith<Serving> get copyWith => _$ServingCopyWithImpl<Serving>(this as Serving, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Serving;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Serving&&(identical(other.foodId, _this.foodId) || other.foodId == _this.foodId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.edibleGrams, _this.edibleGrams) || other.edibleGrams == _this.edibleGrams)&&(identical(other.nutrients, _this.nutrients) || other.nutrients == _this.nutrients)&&(identical(other.source, _this.source) || other.source == _this.source)&&(identical(other.sourceReference, _this.sourceReference) || other.sourceReference == _this.sourceReference));
}


@override
int get hashCode {
  final _this = this as Serving;
  return Object.hash(runtimeType,_this.foodId,_this.name,_this.edibleGrams,_this.nutrients,_this.source,_this.sourceReference);
}

@override
String toString() {
  final _this = this as Serving;
  return 'Serving(foodId: ${_this.foodId}, name: ${_this.name}, edibleGrams: ${_this.edibleGrams}, nutrients: ${_this.nutrients}, source: ${_this.source}, sourceReference: ${_this.sourceReference})';
}


}

/// @nodoc
abstract mixin class $ServingCopyWith<$Res>  {
  factory $ServingCopyWith(Serving value, $Res Function(Serving) _then) = _$ServingCopyWithImpl;
@useResult
$Res call({
 String foodId, String name, double edibleGrams, Nutrients nutrients, NutritionSource source, String? sourceReference
});


$NutrientsCopyWith<$Res> get nutrients;

}
/// @nodoc
class _$ServingCopyWithImpl<$Res>
    implements $ServingCopyWith<$Res> {
  _$ServingCopyWithImpl(this._self, this._then);

  final Serving _self;
  final $Res Function(Serving) _then;

/// Create a copy of Serving
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? foodId = null,Object? name = null,Object? edibleGrams = null,Object? nutrients = null,Object? source = null,Object? sourceReference = freezed,}) {
  return _then(Serving(
foodId: null == foodId ? _self.foodId : foodId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,edibleGrams: null == edibleGrams ? _self.edibleGrams : edibleGrams // ignore: cast_nullable_to_non_nullable
as double,nutrients: null == nutrients ? _self.nutrients : nutrients // ignore: cast_nullable_to_non_nullable
as Nutrients,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as NutritionSource,sourceReference: freezed == sourceReference ? _self.sourceReference : sourceReference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Serving
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get nutrients {

  return $NutrientsCopyWith<$Res>(_self.nutrients, (value) {
    return _then(_self.copyWith(nutrients: value));
  });
}
}


/// Adds pattern-matching-related methods to [Serving].
extension ServingPatterns on Serving {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Serving value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Serving() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Serving value)  $default,){
final _that = this;
switch (_that) {
case _Serving():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Serving value)?  $default,){
final _that = this;
switch (_that) {
case _Serving() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String foodId,  String name,  double edibleGrams,  Nutrients nutrients,  NutritionSource source,  String? sourceReference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Serving() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String foodId,  String name,  double edibleGrams,  Nutrients nutrients,  NutritionSource source,  String? sourceReference)  $default,) {final _that = this;
switch (_that) {
case _Serving():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String foodId,  String name,  double edibleGrams,  Nutrients nutrients,  NutritionSource source,  String? sourceReference)?  $default,) {final _that = this;
switch (_that) {
case _Serving() when $default != null:
return $default(_that.foodId,_that.name,_that.edibleGrams,_that.nutrients,_that.source,_that.sourceReference);case _:
  return null;

}
}

}

/// @nodoc


class _Serving implements Serving {
  const _Serving({required this.foodId, required this.name, required this.edibleGrams, required this.nutrients, required this.source, this.sourceReference});


@override final  String foodId;
@override final  String name;
@override final  double edibleGrams;
@override final  Nutrients nutrients;
@override final  NutritionSource source;
@override final  String? sourceReference;

/// Create a copy of Serving
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServingCopyWith<_Serving> get copyWith => __$ServingCopyWithImpl<_Serving>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Serving&&(identical(other.foodId, foodId) || other.foodId == foodId)&&(identical(other.name, name) || other.name == name)&&(identical(other.edibleGrams, edibleGrams) || other.edibleGrams == edibleGrams)&&(identical(other.nutrients, nutrients) || other.nutrients == nutrients)&&(identical(other.source, source) || other.source == source)&&(identical(other.sourceReference, sourceReference) || other.sourceReference == sourceReference));
}


@override
int get hashCode {
    return Object.hash(runtimeType,foodId,name,edibleGrams,nutrients,source,sourceReference);
}

@override
String toString() {
    return 'Serving(foodId: $foodId, name: $name, edibleGrams: $edibleGrams, nutrients: $nutrients, source: $source, sourceReference: $sourceReference)';
}


}

/// @nodoc
abstract mixin class _$ServingCopyWith<$Res> implements $ServingCopyWith<$Res> {
  factory _$ServingCopyWith(_Serving value, $Res Function(_Serving) _then) = __$ServingCopyWithImpl;
@override @useResult
$Res call({
 String foodId, String name, double edibleGrams, Nutrients nutrients, NutritionSource source, String? sourceReference
});


@override $NutrientsCopyWith<$Res> get nutrients;

}
/// @nodoc
class __$ServingCopyWithImpl<$Res>
    implements _$ServingCopyWith<$Res> {
  __$ServingCopyWithImpl(this._self, this._then);

  final _Serving _self;
  final $Res Function(_Serving) _then;

/// Create a copy of Serving
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? foodId = null,Object? name = null,Object? edibleGrams = null,Object? nutrients = null,Object? source = null,Object? sourceReference = freezed,}) {
  return _then(_Serving(
foodId: null == foodId ? _self.foodId : foodId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,edibleGrams: null == edibleGrams ? _self.edibleGrams : edibleGrams // ignore: cast_nullable_to_non_nullable
as double,nutrients: null == nutrients ? _self.nutrients : nutrients // ignore: cast_nullable_to_non_nullable
as Nutrients,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as NutritionSource,sourceReference: freezed == sourceReference ? _self.sourceReference : sourceReference // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Serving
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutrientsCopyWith<$Res> get nutrients {

  return $NutrientsCopyWith<$Res>(_self.nutrients, (value) {
    return _then(_self.copyWith(nutrients: value));
  });
}
}

/// @nodoc
mixin _$Recipe {

 double get yieldGrams; List<Serving> get ingredients;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Recipe;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.yieldGrams, _this.yieldGrams) || other.yieldGrams == _this.yieldGrams)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients));
}


@override
int get hashCode {
  final _this = this as Recipe;
  return Object.hash(runtimeType,_this.yieldGrams,const DeepCollectionEquality().hash(_this.ingredients));
}

@override
String toString() {
  final _this = this as Recipe;
  return 'Recipe(yieldGrams: ${_this.yieldGrams}, ingredients: ${_this.ingredients})';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 double yieldGrams, List<Serving> ingredients
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? yieldGrams = null,Object? ingredients = null,}) {
  return _then(Recipe(
yieldGrams: null == yieldGrams ? _self.yieldGrams : yieldGrams // ignore: cast_nullable_to_non_nullable
as double,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Serving>,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipe].
extension RecipePatterns on Recipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipe value)  $default,){
final _that = this;
switch (_that) {
case _Recipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipe value)?  $default,){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double yieldGrams,  List<Serving> ingredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double yieldGrams,  List<Serving> ingredients)  $default,) {final _that = this;
switch (_that) {
case _Recipe():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double yieldGrams,  List<Serving> ingredients)?  $default,) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.yieldGrams,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc


class _Recipe extends Recipe {
  const _Recipe({required this.yieldGrams, required  List<Serving> ingredients}): _ingredients = ingredients,super._();


@override final  double yieldGrams;
 final  List<Serving> _ingredients;
@override List<Serving> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.yieldGrams, yieldGrams) || other.yieldGrams == yieldGrams)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients));
}


@override
int get hashCode {
    return Object.hash(runtimeType,yieldGrams,const DeepCollectionEquality().hash(_ingredients));
}

@override
String toString() {
    return 'Recipe(yieldGrams: $yieldGrams, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 double yieldGrams, List<Serving> ingredients
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? yieldGrams = null,Object? ingredients = null,}) {
  return _then(_Recipe(
yieldGrams: null == yieldGrams ? _self.yieldGrams : yieldGrams // ignore: cast_nullable_to_non_nullable
as double,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Serving>,
  ));
}


}

// dart format on
