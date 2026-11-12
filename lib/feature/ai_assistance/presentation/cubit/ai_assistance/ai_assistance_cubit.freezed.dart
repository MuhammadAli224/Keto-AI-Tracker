// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_assistance_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiAssistanceState {

 bool get busy; AiFailure? get failure; MealEstimate? get meal; CoachReply? get reply;
/// Create a copy of AiAssistanceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiAssistanceStateCopyWith<AiAssistanceState> get copyWith => _$AiAssistanceStateCopyWithImpl<AiAssistanceState>(this as AiAssistanceState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AiAssistanceState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiAssistanceState&&(identical(other.busy, _this.busy) || other.busy == _this.busy)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.meal, _this.meal) || other.meal == _this.meal)&&(identical(other.reply, _this.reply) || other.reply == _this.reply));
}


@override
int get hashCode {
  final _this = this as AiAssistanceState;
  return Object.hash(runtimeType,_this.busy,_this.failure,_this.meal,_this.reply);
}

@override
String toString() {
  final _this = this as AiAssistanceState;
  return 'AiAssistanceState(busy: ${_this.busy}, failure: ${_this.failure}, meal: ${_this.meal}, reply: ${_this.reply})';
}


}

/// @nodoc
abstract mixin class $AiAssistanceStateCopyWith<$Res>  {
  factory $AiAssistanceStateCopyWith(AiAssistanceState value, $Res Function(AiAssistanceState) _then) = _$AiAssistanceStateCopyWithImpl;
@useResult
$Res call({
 bool busy, AiFailure? failure, MealEstimate? meal, CoachReply? reply
});


$MealEstimateCopyWith<$Res>? get meal;$CoachReplyCopyWith<$Res>? get reply;

}
/// @nodoc
class _$AiAssistanceStateCopyWithImpl<$Res>
    implements $AiAssistanceStateCopyWith<$Res> {
  _$AiAssistanceStateCopyWithImpl(this._self, this._then);

  final AiAssistanceState _self;
  final $Res Function(AiAssistanceState) _then;

/// Create a copy of AiAssistanceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? busy = null,Object? failure = freezed,Object? meal = freezed,Object? reply = freezed,}) {
  return _then(AiAssistanceState(
busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AiFailure?,meal: freezed == meal ? _self.meal : meal // ignore: cast_nullable_to_non_nullable
as MealEstimate?,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as CoachReply?,
  ));
}
/// Create a copy of AiAssistanceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealEstimateCopyWith<$Res>? get meal {
    if (_self.meal == null) {
    return null;
  }

  return $MealEstimateCopyWith<$Res>(_self.meal!, (value) {
    return _then(_self.copyWith(meal: value));
  });
}/// Create a copy of AiAssistanceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoachReplyCopyWith<$Res>? get reply {
    if (_self.reply == null) {
    return null;
  }

  return $CoachReplyCopyWith<$Res>(_self.reply!, (value) {
    return _then(_self.copyWith(reply: value));
  });
}
}


/// Adds pattern-matching-related methods to [AiAssistanceState].
extension AiAssistanceStatePatterns on AiAssistanceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiAssistanceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiAssistanceState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiAssistanceState value)  $default,){
final _that = this;
switch (_that) {
case _AiAssistanceState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiAssistanceState value)?  $default,){
final _that = this;
switch (_that) {
case _AiAssistanceState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool busy,  AiFailure? failure,  MealEstimate? meal,  CoachReply? reply)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiAssistanceState() when $default != null:
return $default(_that.busy,_that.failure,_that.meal,_that.reply);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool busy,  AiFailure? failure,  MealEstimate? meal,  CoachReply? reply)  $default,) {final _that = this;
switch (_that) {
case _AiAssistanceState():
return $default(_that.busy,_that.failure,_that.meal,_that.reply);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool busy,  AiFailure? failure,  MealEstimate? meal,  CoachReply? reply)?  $default,) {final _that = this;
switch (_that) {
case _AiAssistanceState() when $default != null:
return $default(_that.busy,_that.failure,_that.meal,_that.reply);case _:
  return null;

}
}

}

/// @nodoc


class _AiAssistanceState implements AiAssistanceState {
  const _AiAssistanceState({this.busy = false, this.failure, this.meal, this.reply});


@override@JsonKey() final  bool busy;
@override final  AiFailure? failure;
@override final  MealEstimate? meal;
@override final  CoachReply? reply;

/// Create a copy of AiAssistanceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiAssistanceStateCopyWith<_AiAssistanceState> get copyWith => __$AiAssistanceStateCopyWithImpl<_AiAssistanceState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiAssistanceState&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.meal, meal) || other.meal == meal)&&(identical(other.reply, reply) || other.reply == reply));
}


@override
int get hashCode {
    return Object.hash(runtimeType,busy,failure,meal,reply);
}

@override
String toString() {
    return 'AiAssistanceState(busy: $busy, failure: $failure, meal: $meal, reply: $reply)';
}


}

/// @nodoc
abstract mixin class _$AiAssistanceStateCopyWith<$Res> implements $AiAssistanceStateCopyWith<$Res> {
  factory _$AiAssistanceStateCopyWith(_AiAssistanceState value, $Res Function(_AiAssistanceState) _then) = __$AiAssistanceStateCopyWithImpl;
@override @useResult
$Res call({
 bool busy, AiFailure? failure, MealEstimate? meal, CoachReply? reply
});


@override $MealEstimateCopyWith<$Res>? get meal;@override $CoachReplyCopyWith<$Res>? get reply;

}
/// @nodoc
class __$AiAssistanceStateCopyWithImpl<$Res>
    implements _$AiAssistanceStateCopyWith<$Res> {
  __$AiAssistanceStateCopyWithImpl(this._self, this._then);

  final _AiAssistanceState _self;
  final $Res Function(_AiAssistanceState) _then;

/// Create a copy of AiAssistanceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? busy = null,Object? failure = freezed,Object? meal = freezed,Object? reply = freezed,}) {
  return _then(_AiAssistanceState(
busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as AiFailure?,meal: freezed == meal ? _self.meal : meal // ignore: cast_nullable_to_non_nullable
as MealEstimate?,reply: freezed == reply ? _self.reply : reply // ignore: cast_nullable_to_non_nullable
as CoachReply?,
  ));
}

/// Create a copy of AiAssistanceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealEstimateCopyWith<$Res>? get meal {
    if (_self.meal == null) {
    return null;
  }

  return $MealEstimateCopyWith<$Res>(_self.meal!, (value) {
    return _then(_self.copyWith(meal: value));
  });
}/// Create a copy of AiAssistanceState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoachReplyCopyWith<$Res>? get reply {
    if (_self.reply == null) {
    return null;
  }

  return $CoachReplyCopyWith<$Res>(_self.reply!, (value) {
    return _then(_self.copyWith(reply: value));
  });
}
}

// dart format on
