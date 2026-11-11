// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OwnerAuthState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerAuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OwnerAuthState()';
}


}

/// @nodoc
class $OwnerAuthStateCopyWith<$Res>  {
$OwnerAuthStateCopyWith(OwnerAuthState _, $Res Function(OwnerAuthState) __);
}


/// Adds pattern-matching-related methods to [OwnerAuthState].
extension OwnerAuthStatePatterns on OwnerAuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthIdle value)?  idle,TResult Function( AuthWorking value)?  working,TResult Function( AuthFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthIdle() when idle != null:
return idle(_that);case AuthWorking() when working != null:
return working(_that);case AuthFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthIdle value)  idle,required TResult Function( AuthWorking value)  working,required TResult Function( AuthFailure value)  failure,}){
final _that = this;
switch (_that) {
case AuthIdle():
return idle(_that);case AuthWorking():
return working(_that);case AuthFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthIdle value)?  idle,TResult? Function( AuthWorking value)?  working,TResult? Function( AuthFailure value)?  failure,}){
final _that = this;
switch (_that) {
case AuthIdle() when idle != null:
return idle(_that);case AuthWorking() when working != null:
return working(_that);case AuthFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  working,TResult Function( OwnerError error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthIdle() when idle != null:
return idle();case AuthWorking() when working != null:
return working();case AuthFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  working,required TResult Function( OwnerError error)  failure,}) {final _that = this;
switch (_that) {
case AuthIdle():
return idle();case AuthWorking():
return working();case AuthFailure():
return failure(_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  working,TResult? Function( OwnerError error)?  failure,}) {final _that = this;
switch (_that) {
case AuthIdle() when idle != null:
return idle();case AuthWorking() when working != null:
return working();case AuthFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class AuthIdle implements OwnerAuthState {
  const AuthIdle();







@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OwnerAuthState.idle()';
}


}




/// @nodoc


class AuthWorking implements OwnerAuthState {
  const AuthWorking();







@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthWorking);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OwnerAuthState.working()';
}


}




/// @nodoc


class AuthFailure implements OwnerAuthState {
  const AuthFailure(this.error);


 final  OwnerError error;

/// Create a copy of OwnerAuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'OwnerAuthState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $OwnerAuthStateCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 OwnerError error
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of OwnerAuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(AuthFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as OwnerError,
  ));
}


}

// dart format on
