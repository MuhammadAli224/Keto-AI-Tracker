// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_photo_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealPhotoState {

 MealPhoto? get photo; MealPhotoStatus get status; bool get upload; bool get ready; bool get busy; bool get failed;
/// Create a copy of MealPhotoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealPhotoStateCopyWith<MealPhotoState> get copyWith => _$MealPhotoStateCopyWithImpl<MealPhotoState>(this as MealPhotoState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MealPhotoState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealPhotoState&&(identical(other.photo, _this.photo) || other.photo == _this.photo)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.upload, _this.upload) || other.upload == _this.upload)&&(identical(other.ready, _this.ready) || other.ready == _this.ready)&&(identical(other.busy, _this.busy) || other.busy == _this.busy)&&(identical(other.failed, _this.failed) || other.failed == _this.failed));
}


@override
int get hashCode {
  final _this = this as MealPhotoState;
  return Object.hash(runtimeType,_this.photo,_this.status,_this.upload,_this.ready,_this.busy,_this.failed);
}

@override
String toString() {
  final _this = this as MealPhotoState;
  return 'MealPhotoState(photo: ${_this.photo}, status: ${_this.status}, upload: ${_this.upload}, ready: ${_this.ready}, busy: ${_this.busy}, failed: ${_this.failed})';
}


}

/// @nodoc
abstract mixin class $MealPhotoStateCopyWith<$Res>  {
  factory $MealPhotoStateCopyWith(MealPhotoState value, $Res Function(MealPhotoState) _then) = _$MealPhotoStateCopyWithImpl;
@useResult
$Res call({
 MealPhoto? photo, MealPhotoStatus status, bool upload, bool ready, bool busy, bool failed
});


$MealPhotoCopyWith<$Res>? get photo;

}
/// @nodoc
class _$MealPhotoStateCopyWithImpl<$Res>
    implements $MealPhotoStateCopyWith<$Res> {
  _$MealPhotoStateCopyWithImpl(this._self, this._then);

  final MealPhotoState _self;
  final $Res Function(MealPhotoState) _then;

/// Create a copy of MealPhotoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photo = freezed,Object? status = null,Object? upload = null,Object? ready = null,Object? busy = null,Object? failed = null,}) {
  return _then(MealPhotoState(
photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as MealPhoto?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealPhotoStatus,upload: null == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as bool,ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as bool,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,failed: null == failed ? _self.failed : failed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MealPhotoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealPhotoCopyWith<$Res>? get photo {
    if (_self.photo == null) {
    return null;
  }

  return $MealPhotoCopyWith<$Res>(_self.photo!, (value) {
    return _then(_self.copyWith(photo: value));
  });
}
}


/// Adds pattern-matching-related methods to [MealPhotoState].
extension MealPhotoStatePatterns on MealPhotoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealPhotoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealPhotoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealPhotoState value)  $default,){
final _that = this;
switch (_that) {
case _MealPhotoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealPhotoState value)?  $default,){
final _that = this;
switch (_that) {
case _MealPhotoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MealPhoto? photo,  MealPhotoStatus status,  bool upload,  bool ready,  bool busy,  bool failed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealPhotoState() when $default != null:
return $default(_that.photo,_that.status,_that.upload,_that.ready,_that.busy,_that.failed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MealPhoto? photo,  MealPhotoStatus status,  bool upload,  bool ready,  bool busy,  bool failed)  $default,) {final _that = this;
switch (_that) {
case _MealPhotoState():
return $default(_that.photo,_that.status,_that.upload,_that.ready,_that.busy,_that.failed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MealPhoto? photo,  MealPhotoStatus status,  bool upload,  bool ready,  bool busy,  bool failed)?  $default,) {final _that = this;
switch (_that) {
case _MealPhotoState() when $default != null:
return $default(_that.photo,_that.status,_that.upload,_that.ready,_that.busy,_that.failed);case _:
  return null;

}
}

}

/// @nodoc


class _MealPhotoState implements MealPhotoState {
  const _MealPhotoState({this.photo, this.status = MealPhotoStatus.localOnly, this.upload = false, this.ready = false, this.busy = false, this.failed = false});


@override final  MealPhoto? photo;
@override@JsonKey() final  MealPhotoStatus status;
@override@JsonKey() final  bool upload;
@override@JsonKey() final  bool ready;
@override@JsonKey() final  bool busy;
@override@JsonKey() final  bool failed;

/// Create a copy of MealPhotoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealPhotoStateCopyWith<_MealPhotoState> get copyWith => __$MealPhotoStateCopyWithImpl<_MealPhotoState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealPhotoState&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.status, status) || other.status == status)&&(identical(other.upload, upload) || other.upload == upload)&&(identical(other.ready, ready) || other.ready == ready)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.failed, failed) || other.failed == failed));
}


@override
int get hashCode {
    return Object.hash(runtimeType,photo,status,upload,ready,busy,failed);
}

@override
String toString() {
    return 'MealPhotoState(photo: $photo, status: $status, upload: $upload, ready: $ready, busy: $busy, failed: $failed)';
}


}

/// @nodoc
abstract mixin class _$MealPhotoStateCopyWith<$Res> implements $MealPhotoStateCopyWith<$Res> {
  factory _$MealPhotoStateCopyWith(_MealPhotoState value, $Res Function(_MealPhotoState) _then) = __$MealPhotoStateCopyWithImpl;
@override @useResult
$Res call({
 MealPhoto? photo, MealPhotoStatus status, bool upload, bool ready, bool busy, bool failed
});


@override $MealPhotoCopyWith<$Res>? get photo;

}
/// @nodoc
class __$MealPhotoStateCopyWithImpl<$Res>
    implements _$MealPhotoStateCopyWith<$Res> {
  __$MealPhotoStateCopyWithImpl(this._self, this._then);

  final _MealPhotoState _self;
  final $Res Function(_MealPhotoState) _then;

/// Create a copy of MealPhotoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photo = freezed,Object? status = null,Object? upload = null,Object? ready = null,Object? busy = null,Object? failed = null,}) {
  return _then(_MealPhotoState(
photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as MealPhoto?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealPhotoStatus,upload: null == upload ? _self.upload : upload // ignore: cast_nullable_to_non_nullable
as bool,ready: null == ready ? _self.ready : ready // ignore: cast_nullable_to_non_nullable
as bool,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,failed: null == failed ? _self.failed : failed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MealPhotoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MealPhotoCopyWith<$Res>? get photo {
    if (_self.photo == null) {
    return null;
  }

  return $MealPhotoCopyWith<$Res>(_self.photo!, (value) {
    return _then(_self.copyWith(photo: value));
  });
}
}

// dart format on
