// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_assistance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EstimatedIngredient {

 String get name; double? get grams; AiUncertainty get uncertainty; AiIngredientKind get kind;
/// Create a copy of EstimatedIngredient
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EstimatedIngredientCopyWith<EstimatedIngredient> get copyWith => _$EstimatedIngredientCopyWithImpl<EstimatedIngredient>(this as EstimatedIngredient, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as EstimatedIngredient;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EstimatedIngredient&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.grams, _this.grams) || other.grams == _this.grams)&&(identical(other.uncertainty, _this.uncertainty) || other.uncertainty == _this.uncertainty)&&(identical(other.kind, _this.kind) || other.kind == _this.kind));
}


@override
int get hashCode {
  final _this = this as EstimatedIngredient;
  return Object.hash(runtimeType,_this.name,_this.grams,_this.uncertainty,_this.kind);
}

@override
String toString() {
  final _this = this as EstimatedIngredient;
  return 'EstimatedIngredient(name: ${_this.name}, grams: ${_this.grams}, uncertainty: ${_this.uncertainty}, kind: ${_this.kind})';
}


}

/// @nodoc
abstract mixin class $EstimatedIngredientCopyWith<$Res>  {
  factory $EstimatedIngredientCopyWith(EstimatedIngredient value, $Res Function(EstimatedIngredient) _then) = _$EstimatedIngredientCopyWithImpl;
@useResult
$Res call({
 String name, double? grams, AiUncertainty uncertainty, AiIngredientKind kind
});




}
/// @nodoc
class _$EstimatedIngredientCopyWithImpl<$Res>
    implements $EstimatedIngredientCopyWith<$Res> {
  _$EstimatedIngredientCopyWithImpl(this._self, this._then);

  final EstimatedIngredient _self;
  final $Res Function(EstimatedIngredient) _then;

/// Create a copy of EstimatedIngredient
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? grams = freezed,Object? uncertainty = null,Object? kind = null,}) {
  return _then(EstimatedIngredient(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grams: freezed == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as double?,uncertainty: null == uncertainty ? _self.uncertainty : uncertainty // ignore: cast_nullable_to_non_nullable
as AiUncertainty,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AiIngredientKind,
  ));
}

}


/// Adds pattern-matching-related methods to [EstimatedIngredient].
extension EstimatedIngredientPatterns on EstimatedIngredient {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EstimatedIngredient value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EstimatedIngredient() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EstimatedIngredient value)  $default,){
final _that = this;
switch (_that) {
case _EstimatedIngredient():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EstimatedIngredient value)?  $default,){
final _that = this;
switch (_that) {
case _EstimatedIngredient() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  double? grams,  AiUncertainty uncertainty,  AiIngredientKind kind)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EstimatedIngredient() when $default != null:
return $default(_that.name,_that.grams,_that.uncertainty,_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  double? grams,  AiUncertainty uncertainty,  AiIngredientKind kind)  $default,) {final _that = this;
switch (_that) {
case _EstimatedIngredient():
return $default(_that.name,_that.grams,_that.uncertainty,_that.kind);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  double? grams,  AiUncertainty uncertainty,  AiIngredientKind kind)?  $default,) {final _that = this;
switch (_that) {
case _EstimatedIngredient() when $default != null:
return $default(_that.name,_that.grams,_that.uncertainty,_that.kind);case _:
  return null;

}
}

}

/// @nodoc


class _EstimatedIngredient implements EstimatedIngredient {
  const _EstimatedIngredient({required this.name, required this.grams, required this.uncertainty, required this.kind});


@override final  String name;
@override final  double? grams;
@override final  AiUncertainty uncertainty;
@override final  AiIngredientKind kind;

/// Create a copy of EstimatedIngredient
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EstimatedIngredientCopyWith<_EstimatedIngredient> get copyWith => __$EstimatedIngredientCopyWithImpl<_EstimatedIngredient>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EstimatedIngredient&&(identical(other.name, name) || other.name == name)&&(identical(other.grams, grams) || other.grams == grams)&&(identical(other.uncertainty, uncertainty) || other.uncertainty == uncertainty)&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,grams,uncertainty,kind);
}

@override
String toString() {
    return 'EstimatedIngredient(name: $name, grams: $grams, uncertainty: $uncertainty, kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$EstimatedIngredientCopyWith<$Res> implements $EstimatedIngredientCopyWith<$Res> {
  factory _$EstimatedIngredientCopyWith(_EstimatedIngredient value, $Res Function(_EstimatedIngredient) _then) = __$EstimatedIngredientCopyWithImpl;
@override @useResult
$Res call({
 String name, double? grams, AiUncertainty uncertainty, AiIngredientKind kind
});




}
/// @nodoc
class __$EstimatedIngredientCopyWithImpl<$Res>
    implements _$EstimatedIngredientCopyWith<$Res> {
  __$EstimatedIngredientCopyWithImpl(this._self, this._then);

  final _EstimatedIngredient _self;
  final $Res Function(_EstimatedIngredient) _then;

/// Create a copy of EstimatedIngredient
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? grams = freezed,Object? uncertainty = null,Object? kind = null,}) {
  return _then(_EstimatedIngredient(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,grams: freezed == grams ? _self.grams : grams // ignore: cast_nullable_to_non_nullable
as double?,uncertainty: null == uncertainty ? _self.uncertainty : uncertainty // ignore: cast_nullable_to_non_nullable
as AiUncertainty,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AiIngredientKind,
  ));
}


}

/// @nodoc
mixin _$MealEstimate {

 List<EstimatedIngredient> get ingredients; List<String> get questions;
/// Create a copy of MealEstimate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealEstimateCopyWith<MealEstimate> get copyWith => _$MealEstimateCopyWithImpl<MealEstimate>(this as MealEstimate, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MealEstimate;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealEstimate&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients)&&const DeepCollectionEquality().equals(other.questions, _this.questions));
}


@override
int get hashCode {
  final _this = this as MealEstimate;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.ingredients),const DeepCollectionEquality().hash(_this.questions));
}

@override
String toString() {
  final _this = this as MealEstimate;
  return 'MealEstimate(ingredients: ${_this.ingredients}, questions: ${_this.questions})';
}


}

/// @nodoc
abstract mixin class $MealEstimateCopyWith<$Res>  {
  factory $MealEstimateCopyWith(MealEstimate value, $Res Function(MealEstimate) _then) = _$MealEstimateCopyWithImpl;
@useResult
$Res call({
 List<EstimatedIngredient> ingredients, List<String> questions
});




}
/// @nodoc
class _$MealEstimateCopyWithImpl<$Res>
    implements $MealEstimateCopyWith<$Res> {
  _$MealEstimateCopyWithImpl(this._self, this._then);

  final MealEstimate _self;
  final $Res Function(MealEstimate) _then;

/// Create a copy of MealEstimate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredients = null,Object? questions = null,}) {
  return _then(MealEstimate(
ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<EstimatedIngredient>,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MealEstimate].
extension MealEstimatePatterns on MealEstimate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealEstimate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealEstimate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealEstimate value)  $default,){
final _that = this;
switch (_that) {
case _MealEstimate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealEstimate value)?  $default,){
final _that = this;
switch (_that) {
case _MealEstimate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<EstimatedIngredient> ingredients,  List<String> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealEstimate() when $default != null:
return $default(_that.ingredients,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<EstimatedIngredient> ingredients,  List<String> questions)  $default,) {final _that = this;
switch (_that) {
case _MealEstimate():
return $default(_that.ingredients,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<EstimatedIngredient> ingredients,  List<String> questions)?  $default,) {final _that = this;
switch (_that) {
case _MealEstimate() when $default != null:
return $default(_that.ingredients,_that.questions);case _:
  return null;

}
}

}

/// @nodoc


class _MealEstimate implements MealEstimate {
  const _MealEstimate({required  List<EstimatedIngredient> ingredients, required  List<String> questions}): _ingredients = ingredients,_questions = questions;


 final  List<EstimatedIngredient> _ingredients;
@override List<EstimatedIngredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<String> _questions;
@override List<String> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of MealEstimate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealEstimateCopyWith<_MealEstimate> get copyWith => __$MealEstimateCopyWithImpl<_MealEstimate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealEstimate&&const DeepCollectionEquality().equals(other.ingredients, _ingredients)&&const DeepCollectionEquality().equals(other.questions, _questions));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_questions));
}

@override
String toString() {
    return 'MealEstimate(ingredients: $ingredients, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$MealEstimateCopyWith<$Res> implements $MealEstimateCopyWith<$Res> {
  factory _$MealEstimateCopyWith(_MealEstimate value, $Res Function(_MealEstimate) _then) = __$MealEstimateCopyWithImpl;
@override @useResult
$Res call({
 List<EstimatedIngredient> ingredients, List<String> questions
});




}
/// @nodoc
class __$MealEstimateCopyWithImpl<$Res>
    implements _$MealEstimateCopyWith<$Res> {
  __$MealEstimateCopyWithImpl(this._self, this._then);

  final _MealEstimate _self;
  final $Res Function(_MealEstimate) _then;

/// Create a copy of MealEstimate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredients = null,Object? questions = null,}) {
  return _then(_MealEstimate(
ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<EstimatedIngredient>,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$CoachReply {

 List<String> get guidance; List<String> get questions;
/// Create a copy of CoachReply
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachReplyCopyWith<CoachReply> get copyWith => _$CoachReplyCopyWithImpl<CoachReply>(this as CoachReply, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CoachReply;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachReply&&const DeepCollectionEquality().equals(other.guidance, _this.guidance)&&const DeepCollectionEquality().equals(other.questions, _this.questions));
}


@override
int get hashCode {
  final _this = this as CoachReply;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.guidance),const DeepCollectionEquality().hash(_this.questions));
}

@override
String toString() {
  final _this = this as CoachReply;
  return 'CoachReply(guidance: ${_this.guidance}, questions: ${_this.questions})';
}


}

/// @nodoc
abstract mixin class $CoachReplyCopyWith<$Res>  {
  factory $CoachReplyCopyWith(CoachReply value, $Res Function(CoachReply) _then) = _$CoachReplyCopyWithImpl;
@useResult
$Res call({
 List<String> guidance, List<String> questions
});




}
/// @nodoc
class _$CoachReplyCopyWithImpl<$Res>
    implements $CoachReplyCopyWith<$Res> {
  _$CoachReplyCopyWithImpl(this._self, this._then);

  final CoachReply _self;
  final $Res Function(CoachReply) _then;

/// Create a copy of CoachReply
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? guidance = null,Object? questions = null,}) {
  return _then(CoachReply(
guidance: null == guidance ? _self.guidance : guidance // ignore: cast_nullable_to_non_nullable
as List<String>,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachReply].
extension CoachReplyPatterns on CoachReply {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachReply value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachReply() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachReply value)  $default,){
final _that = this;
switch (_that) {
case _CoachReply():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachReply value)?  $default,){
final _that = this;
switch (_that) {
case _CoachReply() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> guidance,  List<String> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachReply() when $default != null:
return $default(_that.guidance,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> guidance,  List<String> questions)  $default,) {final _that = this;
switch (_that) {
case _CoachReply():
return $default(_that.guidance,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> guidance,  List<String> questions)?  $default,) {final _that = this;
switch (_that) {
case _CoachReply() when $default != null:
return $default(_that.guidance,_that.questions);case _:
  return null;

}
}

}

/// @nodoc


class _CoachReply implements CoachReply {
  const _CoachReply({required  List<String> guidance, required  List<String> questions}): _guidance = guidance,_questions = questions;


 final  List<String> _guidance;
@override List<String> get guidance {
  if (_guidance is EqualUnmodifiableListView) return _guidance;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guidance);
}

 final  List<String> _questions;
@override List<String> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of CoachReply
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachReplyCopyWith<_CoachReply> get copyWith => __$CoachReplyCopyWithImpl<_CoachReply>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachReply&&const DeepCollectionEquality().equals(other.guidance, _guidance)&&const DeepCollectionEquality().equals(other.questions, _questions));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_guidance),const DeepCollectionEquality().hash(_questions));
}

@override
String toString() {
    return 'CoachReply(guidance: $guidance, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$CoachReplyCopyWith<$Res> implements $CoachReplyCopyWith<$Res> {
  factory _$CoachReplyCopyWith(_CoachReply value, $Res Function(_CoachReply) _then) = __$CoachReplyCopyWithImpl;
@override @useResult
$Res call({
 List<String> guidance, List<String> questions
});




}
/// @nodoc
class __$CoachReplyCopyWithImpl<$Res>
    implements _$CoachReplyCopyWith<$Res> {
  __$CoachReplyCopyWithImpl(this._self, this._then);

  final _CoachReply _self;
  final $Res Function(_CoachReply) _then;

/// Create a copy of CoachReply
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? guidance = null,Object? questions = null,}) {
  return _then(_CoachReply(
guidance: null == guidance ? _self._guidance : guidance // ignore: cast_nullable_to_non_nullable
as List<String>,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
