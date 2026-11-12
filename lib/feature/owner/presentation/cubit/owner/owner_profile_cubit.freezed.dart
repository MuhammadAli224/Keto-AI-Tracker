// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_profile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OwnerProfileState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OwnerProfileState()';
}


}

/// @nodoc
class $OwnerProfileStateCopyWith<$Res>  {
$OwnerProfileStateCopyWith(OwnerProfileState _, $Res Function(OwnerProfileState) __);
}


/// Adds pattern-matching-related methods to [OwnerProfileState].
extension OwnerProfileStatePatterns on OwnerProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileLoading value)?  loading,TResult Function( ProfileReady value)?  ready,TResult Function( ProfileFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileLoading() when loading != null:
return loading(_that);case ProfileReady() when ready != null:
return ready(_that);case ProfileFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileLoading value)  loading,required TResult Function( ProfileReady value)  ready,required TResult Function( ProfileFailure value)  failure,}){
final _that = this;
switch (_that) {
case ProfileLoading():
return loading(_that);case ProfileReady():
return ready(_that);case ProfileFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileLoading value)?  loading,TResult? Function( ProfileReady value)?  ready,TResult? Function( ProfileFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ProfileLoading() when loading != null:
return loading(_that);case ProfileReady() when ready != null:
return ready(_that);case ProfileFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( OwnerProfileSnapshot snapshot,  bool saving,  OwnerError? saveError)?  ready,TResult Function( OwnerError error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileLoading() when loading != null:
return loading();case ProfileReady() when ready != null:
return ready(_that.snapshot,_that.saving,_that.saveError);case ProfileFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( OwnerProfileSnapshot snapshot,  bool saving,  OwnerError? saveError)  ready,required TResult Function( OwnerError error)  failure,}) {final _that = this;
switch (_that) {
case ProfileLoading():
return loading();case ProfileReady():
return ready(_that.snapshot,_that.saving,_that.saveError);case ProfileFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( OwnerProfileSnapshot snapshot,  bool saving,  OwnerError? saveError)?  ready,TResult? Function( OwnerError error)?  failure,}) {final _that = this;
switch (_that) {
case ProfileLoading() when loading != null:
return loading();case ProfileReady() when ready != null:
return ready(_that.snapshot,_that.saving,_that.saveError);case ProfileFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ProfileLoading implements OwnerProfileState {
  const ProfileLoading();







@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OwnerProfileState.loading()';
}


}




/// @nodoc


class ProfileReady implements OwnerProfileState {
  const ProfileReady(this.snapshot, {this.saving = false, this.saveError});


 final  OwnerProfileSnapshot snapshot;
@JsonKey() final  bool saving;
 final  OwnerError? saveError;

/// Create a copy of OwnerProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileReadyCopyWith<ProfileReady> get copyWith => _$ProfileReadyCopyWithImpl<ProfileReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileReady&&(identical(other.snapshot, snapshot) || other.snapshot == snapshot)&&(identical(other.saving, saving) || other.saving == saving)&&(identical(other.saveError, saveError) || other.saveError == saveError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,snapshot,saving,saveError);
}

@override
String toString() {
    return 'OwnerProfileState.ready(snapshot: $snapshot, saving: $saving, saveError: $saveError)';
}


}

/// @nodoc
abstract mixin class $ProfileReadyCopyWith<$Res> implements $OwnerProfileStateCopyWith<$Res> {
  factory $ProfileReadyCopyWith(ProfileReady value, $Res Function(ProfileReady) _then) = _$ProfileReadyCopyWithImpl;
@useResult
$Res call({
 OwnerProfileSnapshot snapshot, bool saving, OwnerError? saveError
});


$OwnerProfileSnapshotCopyWith<$Res> get snapshot;

}
/// @nodoc
class _$ProfileReadyCopyWithImpl<$Res>
    implements $ProfileReadyCopyWith<$Res> {
  _$ProfileReadyCopyWithImpl(this._self, this._then);

  final ProfileReady _self;
  final $Res Function(ProfileReady) _then;

/// Create a copy of OwnerProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? snapshot = null,Object? saving = null,Object? saveError = freezed,}) {
  return _then(ProfileReady(
null == snapshot ? _self.snapshot : snapshot // ignore: cast_nullable_to_non_nullable
as OwnerProfileSnapshot,saving: null == saving ? _self.saving : saving // ignore: cast_nullable_to_non_nullable
as bool,saveError: freezed == saveError ? _self.saveError : saveError // ignore: cast_nullable_to_non_nullable
as OwnerError?,
  ));
}

/// Create a copy of OwnerProfileState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OwnerProfileSnapshotCopyWith<$Res> get snapshot {

  return $OwnerProfileSnapshotCopyWith<$Res>(_self.snapshot, (value) {
    return _then(_self.copyWith(snapshot: value));
  });
}
}

/// @nodoc


class ProfileFailure implements OwnerProfileState {
  const ProfileFailure(this.error);


 final  OwnerError error;

/// Create a copy of OwnerProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileFailureCopyWith<ProfileFailure> get copyWith => _$ProfileFailureCopyWithImpl<ProfileFailure>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,error);
}

@override
String toString() {
    return 'OwnerProfileState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $ProfileFailureCopyWith<$Res> implements $OwnerProfileStateCopyWith<$Res> {
  factory $ProfileFailureCopyWith(ProfileFailure value, $Res Function(ProfileFailure) _then) = _$ProfileFailureCopyWithImpl;
@useResult
$Res call({
 OwnerError error
});




}
/// @nodoc
class _$ProfileFailureCopyWithImpl<$Res>
    implements $ProfileFailureCopyWith<$Res> {
  _$ProfileFailureCopyWithImpl(this._self, this._then);

  final ProfileFailure _self;
  final $Res Function(ProfileFailure) _then;

/// Create a copy of OwnerProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ProfileFailure(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as OwnerError,
  ));
}


}

// dart format on
