// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CatalogState()';
}


}

/// @nodoc
class $CatalogStateCopyWith<$Res>  {
$CatalogStateCopyWith(CatalogState _, $Res Function(CatalogState) __);
}


/// Adds pattern-matching-related methods to [CatalogState].
extension CatalogStatePatterns on CatalogState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CatalogLoading value)?  loading,TResult Function( CatalogLoadFailure value)?  failure,TResult Function( CatalogReady value)?  ready,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CatalogLoading() when loading != null:
return loading(_that);case CatalogLoadFailure() when failure != null:
return failure(_that);case CatalogReady() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CatalogLoading value)  loading,required TResult Function( CatalogLoadFailure value)  failure,required TResult Function( CatalogReady value)  ready,}){
final _that = this;
switch (_that) {
case CatalogLoading():
return loading(_that);case CatalogLoadFailure():
return failure(_that);case CatalogReady():
return ready(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CatalogLoading value)?  loading,TResult? Function( CatalogLoadFailure value)?  failure,TResult? Function( CatalogReady value)?  ready,}){
final _that = this;
switch (_that) {
case CatalogLoading() when loading != null:
return loading(_that);case CatalogLoadFailure() when failure != null:
return failure(_that);case CatalogReady() when ready != null:
return ready(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( CatalogError error)?  failure,TResult Function( List<Food> foods,  bool saving,  CatalogError? saveError)?  ready,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CatalogLoading() when loading != null:
return loading();case CatalogLoadFailure() when failure != null:
return failure(_that.error);case CatalogReady() when ready != null:
return ready(_that.foods,_that.saving,_that.saveError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( CatalogError error)  failure,required TResult Function( List<Food> foods,  bool saving,  CatalogError? saveError)  ready,}) {final _that = this;
switch (_that) {
case CatalogLoading():
return loading();case CatalogLoadFailure():
return failure(_that.error);case CatalogReady():
return ready(_that.foods,_that.saving,_that.saveError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( CatalogError error)?  failure,TResult? Function( List<Food> foods,  bool saving,  CatalogError? saveError)?  ready,}) {final _that = this;
switch (_that) {
case CatalogLoading() when loading != null:
return loading();case CatalogLoadFailure() when failure != null:
return failure(_that.error);case CatalogReady() when ready != null:
return ready(_that.foods,_that.saving,_that.saveError);case _:
  return null;

}
}

}

/// @nodoc


class CatalogLoading implements CatalogState {
  const CatalogLoading();







@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CatalogState.loading()';
}


}




/// @nodoc


class CatalogLoadFailure implements CatalogState {
  const CatalogLoadFailure(this.error);


 final  CatalogError error;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogLoadFailureCopyWith<CatalogLoadFailure> get copyWith => _$CatalogLoadFailureCopyWithImpl<CatalogLoadFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogLoadFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'CatalogState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $CatalogLoadFailureCopyWith<$Res> implements $CatalogStateCopyWith<$Res> {
  factory $CatalogLoadFailureCopyWith(CatalogLoadFailure value, $Res Function(CatalogLoadFailure) _then) = _$CatalogLoadFailureCopyWithImpl;
@useResult
$Res call({
 CatalogError error
});




}
/// @nodoc
class _$CatalogLoadFailureCopyWithImpl<$Res>
    implements $CatalogLoadFailureCopyWith<$Res> {
  _$CatalogLoadFailureCopyWithImpl(this._self, this._then);

  final CatalogLoadFailure _self;
  final $Res Function(CatalogLoadFailure) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(CatalogLoadFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as CatalogError,
  ));
}


}

/// @nodoc


class CatalogReady implements CatalogState {
  const CatalogReady( List<Food> foods, {this.saving = false, this.saveError}): _foods = foods;


 final  List<Food> _foods;
 List<Food> get foods {
  if (_foods is EqualUnmodifiableListView) return _foods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_foods);
}

@JsonKey() final  bool saving;
 final  CatalogError? saveError;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogReadyCopyWith<CatalogReady> get copyWith => _$CatalogReadyCopyWithImpl<CatalogReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogReady&&const DeepCollectionEquality().equals(other.foods, _foods)&&(identical(other.saving, saving) || other.saving == saving)&&(identical(other.saveError, saveError) || other.saveError == saveError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_foods),saving,saveError);
}

@override
String toString() {
    return 'CatalogState.ready(foods: $foods, saving: $saving, saveError: $saveError)';
}


}

/// @nodoc
abstract mixin class $CatalogReadyCopyWith<$Res> implements $CatalogStateCopyWith<$Res> {
  factory $CatalogReadyCopyWith(CatalogReady value, $Res Function(CatalogReady) _then) = _$CatalogReadyCopyWithImpl;
@useResult
$Res call({
 List<Food> foods, bool saving, CatalogError? saveError
});




}
/// @nodoc
class _$CatalogReadyCopyWithImpl<$Res>
    implements $CatalogReadyCopyWith<$Res> {
  _$CatalogReadyCopyWithImpl(this._self, this._then);

  final CatalogReady _self;
  final $Res Function(CatalogReady) _then;

/// Create a copy of CatalogState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? foods = null,Object? saving = null,Object? saveError = freezed,}) {
  return _then(CatalogReady(
null == foods ? _self._foods : foods // ignore: cast_nullable_to_non_nullable
as List<Food>,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,saveError: freezed == saveError ? _self.saveError : saveError // ignore: cast_nullable_to_non_nullable
as CatalogError?,
  ));
}


}

// dart format on
