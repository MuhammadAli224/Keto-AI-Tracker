// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wellness_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WellnessState {

 WaterDay? get water; FastSnapshot? get fast; WellnessError? get waterError; WellnessError? get fastError; WellnessError? get writeError; bool get fastWriting;
/// Create a copy of WellnessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WellnessStateCopyWith<WellnessState> get copyWith => _$WellnessStateCopyWithImpl<WellnessState>(this as WellnessState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as WellnessState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WellnessState&&(identical(other.water, _this.water) || other.water == _this.water)&&(identical(other.fast, _this.fast) || other.fast == _this.fast)&&(identical(other.waterError, _this.waterError) || other.waterError == _this.waterError)&&(identical(other.fastError, _this.fastError) || other.fastError == _this.fastError)&&(identical(other.writeError, _this.writeError) || other.writeError == _this.writeError)&&(identical(other.fastWriting, _this.fastWriting) || other.fastWriting == _this.fastWriting));
}


@override
int get hashCode {
  final _this = this as WellnessState;
  return Object.hash(runtimeType,_this.water,_this.fast,_this.waterError,_this.fastError,_this.writeError,_this.fastWriting);
}

@override
String toString() {
  final _this = this as WellnessState;
  return 'WellnessState(water: ${_this.water}, fast: ${_this.fast}, waterError: ${_this.waterError}, fastError: ${_this.fastError}, writeError: ${_this.writeError}, fastWriting: ${_this.fastWriting})';
}


}

/// @nodoc
abstract mixin class $WellnessStateCopyWith<$Res>  {
  factory $WellnessStateCopyWith(WellnessState value, $Res Function(WellnessState) _then) = _$WellnessStateCopyWithImpl;
@useResult
$Res call({
 WaterDay? water, FastSnapshot? fast, WellnessError? waterError, WellnessError? fastError, WellnessError? writeError, bool fastWriting
});


$WaterDayCopyWith<$Res>? get water;$FastSnapshotCopyWith<$Res>? get fast;

}
/// @nodoc
class _$WellnessStateCopyWithImpl<$Res>
    implements $WellnessStateCopyWith<$Res> {
  _$WellnessStateCopyWithImpl(this._self, this._then);

  final WellnessState _self;
  final $Res Function(WellnessState) _then;

/// Create a copy of WellnessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? water = freezed,Object? fast = freezed,Object? waterError = freezed,Object? fastError = freezed,Object? writeError = freezed,Object? fastWriting = null,}) {
  return _then(WellnessState(
water: freezed == water ? _self.water : water // ignore: cast_nullable_to_non_nullable
as WaterDay?,fast: freezed == fast ? _self.fast : fast // ignore: cast_nullable_to_non_nullable
as FastSnapshot?,waterError: freezed == waterError ? _self.waterError : waterError // ignore: cast_nullable_to_non_nullable
as WellnessError?,fastError: freezed == fastError ? _self.fastError : fastError // ignore: cast_nullable_to_non_nullable
as WellnessError?,writeError: freezed == writeError ? _self.writeError : writeError // ignore: cast_nullable_to_non_nullable
as WellnessError?,fastWriting: null == fastWriting ? _self.fastWriting : fastWriting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of WellnessState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterDayCopyWith<$Res>? get water {
    if (_self.water == null) {
    return null;
  }

  return $WaterDayCopyWith<$Res>(_self.water!, (value) {
    return _then(_self.copyWith(water: value));
  });
}/// Create a copy of WellnessState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FastSnapshotCopyWith<$Res>? get fast {
    if (_self.fast == null) {
    return null;
  }

  return $FastSnapshotCopyWith<$Res>(_self.fast!, (value) {
    return _then(_self.copyWith(fast: value));
  });
}
}


/// Adds pattern-matching-related methods to [WellnessState].
extension WellnessStatePatterns on WellnessState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WellnessState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WellnessState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WellnessState value)  $default,){
final _that = this;
switch (_that) {
case _WellnessState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WellnessState value)?  $default,){
final _that = this;
switch (_that) {
case _WellnessState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WaterDay? water,  FastSnapshot? fast,  WellnessError? waterError,  WellnessError? fastError,  WellnessError? writeError,  bool fastWriting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WellnessState() when $default != null:
return $default(_that.water,_that.fast,_that.waterError,_that.fastError,_that.writeError,_that.fastWriting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WaterDay? water,  FastSnapshot? fast,  WellnessError? waterError,  WellnessError? fastError,  WellnessError? writeError,  bool fastWriting)  $default,) {final _that = this;
switch (_that) {
case _WellnessState():
return $default(_that.water,_that.fast,_that.waterError,_that.fastError,_that.writeError,_that.fastWriting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WaterDay? water,  FastSnapshot? fast,  WellnessError? waterError,  WellnessError? fastError,  WellnessError? writeError,  bool fastWriting)?  $default,) {final _that = this;
switch (_that) {
case _WellnessState() when $default != null:
return $default(_that.water,_that.fast,_that.waterError,_that.fastError,_that.writeError,_that.fastWriting);case _:
  return null;

}
}

}

/// @nodoc


class _WellnessState implements WellnessState {
  const _WellnessState({this.water, this.fast, this.waterError, this.fastError, this.writeError, this.fastWriting = false});


@override final  WaterDay? water;
@override final  FastSnapshot? fast;
@override final  WellnessError? waterError;
@override final  WellnessError? fastError;
@override final  WellnessError? writeError;
@override@JsonKey() final  bool fastWriting;

/// Create a copy of WellnessState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WellnessStateCopyWith<_WellnessState> get copyWith => __$WellnessStateCopyWithImpl<_WellnessState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WellnessState&&(identical(other.water, water) || other.water == water)&&(identical(other.fast, fast) || other.fast == fast)&&(identical(other.waterError, waterError) || other.waterError == waterError)&&(identical(other.fastError, fastError) || other.fastError == fastError)&&(identical(other.writeError, writeError) || other.writeError == writeError)&&(identical(other.fastWriting, fastWriting) || other.fastWriting == fastWriting));
}


@override
int get hashCode {
    return Object.hash(runtimeType,water,fast,waterError,fastError,writeError,fastWriting);
}

@override
String toString() {
    return 'WellnessState(water: $water, fast: $fast, waterError: $waterError, fastError: $fastError, writeError: $writeError, fastWriting: $fastWriting)';
}


}

/// @nodoc
abstract mixin class _$WellnessStateCopyWith<$Res> implements $WellnessStateCopyWith<$Res> {
  factory _$WellnessStateCopyWith(_WellnessState value, $Res Function(_WellnessState) _then) = __$WellnessStateCopyWithImpl;
@override @useResult
$Res call({
 WaterDay? water, FastSnapshot? fast, WellnessError? waterError, WellnessError? fastError, WellnessError? writeError, bool fastWriting
});


@override $WaterDayCopyWith<$Res>? get water;@override $FastSnapshotCopyWith<$Res>? get fast;

}
/// @nodoc
class __$WellnessStateCopyWithImpl<$Res>
    implements _$WellnessStateCopyWith<$Res> {
  __$WellnessStateCopyWithImpl(this._self, this._then);

  final _WellnessState _self;
  final $Res Function(_WellnessState) _then;

/// Create a copy of WellnessState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? water = freezed,Object? fast = freezed,Object? waterError = freezed,Object? fastError = freezed,Object? writeError = freezed,Object? fastWriting = null,}) {
  return _then(_WellnessState(
water: freezed == water ? _self.water : water // ignore: cast_nullable_to_non_nullable
as WaterDay?,fast: freezed == fast ? _self.fast : fast // ignore: cast_nullable_to_non_nullable
as FastSnapshot?,waterError: freezed == waterError ? _self.waterError : waterError // ignore: cast_nullable_to_non_nullable
as WellnessError?,fastError: freezed == fastError ? _self.fastError : fastError // ignore: cast_nullable_to_non_nullable
as WellnessError?,writeError: freezed == writeError ? _self.writeError : writeError // ignore: cast_nullable_to_non_nullable
as WellnessError?,fastWriting: null == fastWriting ? _self.fastWriting : fastWriting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of WellnessState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WaterDayCopyWith<$Res>? get water {
    if (_self.water == null) {
    return null;
  }

  return $WaterDayCopyWith<$Res>(_self.water!, (value) {
    return _then(_self.copyWith(water: value));
  });
}/// Create a copy of WellnessState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FastSnapshotCopyWith<$Res>? get fast {
    if (_self.fast == null) {
    return null;
  }

  return $FastSnapshotCopyWith<$Res>(_self.fast!, (value) {
    return _then(_self.copyWith(fast: value));
  });
}
}

// dart format on
