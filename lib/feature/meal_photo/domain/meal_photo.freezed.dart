// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealPhoto {

 String get ref; String get localPath; int get width; int get height;
/// Create a copy of MealPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealPhotoCopyWith<MealPhoto> get copyWith => _$MealPhotoCopyWithImpl<MealPhoto>(this as MealPhoto, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MealPhoto;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealPhoto&&(identical(other.ref, _this.ref) || other.ref == _this.ref)&&(identical(other.localPath, _this.localPath) || other.localPath == _this.localPath)&&(identical(other.width, _this.width) || other.width == _this.width)&&(identical(other.height, _this.height) || other.height == _this.height));
}


@override
int get hashCode {
  final _this = this as MealPhoto;
  return Object.hash(runtimeType,_this.ref,_this.localPath,_this.width,_this.height);
}

@override
String toString() {
  final _this = this as MealPhoto;
  return 'MealPhoto(ref: ${_this.ref}, localPath: ${_this.localPath}, width: ${_this.width}, height: ${_this.height})';
}


}

/// @nodoc
abstract mixin class $MealPhotoCopyWith<$Res>  {
  factory $MealPhotoCopyWith(MealPhoto value, $Res Function(MealPhoto) _then) = _$MealPhotoCopyWithImpl;
@useResult
$Res call({
 String ref, String localPath, int width, int height
});




}
/// @nodoc
class _$MealPhotoCopyWithImpl<$Res>
    implements $MealPhotoCopyWith<$Res> {
  _$MealPhotoCopyWithImpl(this._self, this._then);

  final MealPhoto _self;
  final $Res Function(MealPhoto) _then;

/// Create a copy of MealPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ref = null,Object? localPath = null,Object? width = null,Object? height = null,}) {
  return _then(MealPhoto(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as String,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MealPhoto].
extension MealPhotoPatterns on MealPhoto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealPhoto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealPhoto value)  $default,){
final _that = this;
switch (_that) {
case _MealPhoto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _MealPhoto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ref,  String localPath,  int width,  int height)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealPhoto() when $default != null:
return $default(_that.ref,_that.localPath,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ref,  String localPath,  int width,  int height)  $default,) {final _that = this;
switch (_that) {
case _MealPhoto():
return $default(_that.ref,_that.localPath,_that.width,_that.height);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ref,  String localPath,  int width,  int height)?  $default,) {final _that = this;
switch (_that) {
case _MealPhoto() when $default != null:
return $default(_that.ref,_that.localPath,_that.width,_that.height);case _:
  return null;

}
}

}

/// @nodoc


class _MealPhoto implements MealPhoto {
  const _MealPhoto({required this.ref, required this.localPath, required this.width, required this.height});


@override final  String ref;
@override final  String localPath;
@override final  int width;
@override final  int height;

/// Create a copy of MealPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealPhotoCopyWith<_MealPhoto> get copyWith => __$MealPhotoCopyWithImpl<_MealPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealPhoto&&(identical(other.ref, ref) || other.ref == ref)&&(identical(other.localPath, localPath) || other.localPath == localPath)&&(identical(other.width, width) || other.width == width)&&(identical(other.height, height) || other.height == height));
}


@override
int get hashCode {
    return Object.hash(runtimeType,ref,localPath,width,height);
}

@override
String toString() {
    return 'MealPhoto(ref: $ref, localPath: $localPath, width: $width, height: $height)';
}


}

/// @nodoc
abstract mixin class _$MealPhotoCopyWith<$Res> implements $MealPhotoCopyWith<$Res> {
  factory _$MealPhotoCopyWith(_MealPhoto value, $Res Function(_MealPhoto) _then) = __$MealPhotoCopyWithImpl;
@override @useResult
$Res call({
 String ref, String localPath, int width, int height
});




}
/// @nodoc
class __$MealPhotoCopyWithImpl<$Res>
    implements _$MealPhotoCopyWith<$Res> {
  __$MealPhotoCopyWithImpl(this._self, this._then);

  final _MealPhoto _self;
  final $Res Function(_MealPhoto) _then;

/// Create a copy of MealPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ref = null,Object? localPath = null,Object? width = null,Object? height = null,}) {
  return _then(_MealPhoto(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as String,localPath: null == localPath ? _self.localPath : localPath // ignore: cast_nullable_to_non_nullable
as String,width: null == width ? _self.width : width // ignore: cast_nullable_to_non_nullable
as int,height: null == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$MealPhotoAttachment {

 MealPhoto? get photo; MealPhotoStatus get status; bool get uploadApproved;
/// Create a copy of MealPhotoAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealPhotoAttachmentCopyWith<MealPhotoAttachment> get copyWith => _$MealPhotoAttachmentCopyWithImpl<MealPhotoAttachment>(this as MealPhotoAttachment, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as MealPhotoAttachment;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealPhotoAttachment&&(identical(other.photo, _this.photo) || other.photo == _this.photo)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.uploadApproved, _this.uploadApproved) || other.uploadApproved == _this.uploadApproved));
}


@override
int get hashCode {
  final _this = this as MealPhotoAttachment;
  return Object.hash(runtimeType,_this.photo,_this.status,_this.uploadApproved);
}

@override
String toString() {
  final _this = this as MealPhotoAttachment;
  return 'MealPhotoAttachment(photo: ${_this.photo}, status: ${_this.status}, uploadApproved: ${_this.uploadApproved})';
}


}

/// @nodoc
abstract mixin class $MealPhotoAttachmentCopyWith<$Res>  {
  factory $MealPhotoAttachmentCopyWith(MealPhotoAttachment value, $Res Function(MealPhotoAttachment) _then) = _$MealPhotoAttachmentCopyWithImpl;
@useResult
$Res call({
 MealPhoto? photo, MealPhotoStatus status, bool uploadApproved
});


$MealPhotoCopyWith<$Res>? get photo;

}
/// @nodoc
class _$MealPhotoAttachmentCopyWithImpl<$Res>
    implements $MealPhotoAttachmentCopyWith<$Res> {
  _$MealPhotoAttachmentCopyWithImpl(this._self, this._then);

  final MealPhotoAttachment _self;
  final $Res Function(MealPhotoAttachment) _then;

/// Create a copy of MealPhotoAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photo = freezed,Object? status = null,Object? uploadApproved = null,}) {
  return _then(MealPhotoAttachment(
photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as MealPhoto?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealPhotoStatus,uploadApproved: null == uploadApproved ? _self.uploadApproved : uploadApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MealPhotoAttachment
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


/// Adds pattern-matching-related methods to [MealPhotoAttachment].
extension MealPhotoAttachmentPatterns on MealPhotoAttachment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealPhotoAttachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealPhotoAttachment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealPhotoAttachment value)  $default,){
final _that = this;
switch (_that) {
case _MealPhotoAttachment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealPhotoAttachment value)?  $default,){
final _that = this;
switch (_that) {
case _MealPhotoAttachment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( MealPhoto? photo,  MealPhotoStatus status,  bool uploadApproved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealPhotoAttachment() when $default != null:
return $default(_that.photo,_that.status,_that.uploadApproved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( MealPhoto? photo,  MealPhotoStatus status,  bool uploadApproved)  $default,) {final _that = this;
switch (_that) {
case _MealPhotoAttachment():
return $default(_that.photo,_that.status,_that.uploadApproved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( MealPhoto? photo,  MealPhotoStatus status,  bool uploadApproved)?  $default,) {final _that = this;
switch (_that) {
case _MealPhotoAttachment() when $default != null:
return $default(_that.photo,_that.status,_that.uploadApproved);case _:
  return null;

}
}

}

/// @nodoc


class _MealPhotoAttachment implements MealPhotoAttachment {
  const _MealPhotoAttachment({this.photo, this.status = MealPhotoStatus.localOnly, this.uploadApproved = false});


@override final  MealPhoto? photo;
@override@JsonKey() final  MealPhotoStatus status;
@override@JsonKey() final  bool uploadApproved;

/// Create a copy of MealPhotoAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealPhotoAttachmentCopyWith<_MealPhotoAttachment> get copyWith => __$MealPhotoAttachmentCopyWithImpl<_MealPhotoAttachment>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealPhotoAttachment&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.status, status) || other.status == status)&&(identical(other.uploadApproved, uploadApproved) || other.uploadApproved == uploadApproved));
}


@override
int get hashCode {
    return Object.hash(runtimeType,photo,status,uploadApproved);
}

@override
String toString() {
    return 'MealPhotoAttachment(photo: $photo, status: $status, uploadApproved: $uploadApproved)';
}


}

/// @nodoc
abstract mixin class _$MealPhotoAttachmentCopyWith<$Res> implements $MealPhotoAttachmentCopyWith<$Res> {
  factory _$MealPhotoAttachmentCopyWith(_MealPhotoAttachment value, $Res Function(_MealPhotoAttachment) _then) = __$MealPhotoAttachmentCopyWithImpl;
@override @useResult
$Res call({
 MealPhoto? photo, MealPhotoStatus status, bool uploadApproved
});


@override $MealPhotoCopyWith<$Res>? get photo;

}
/// @nodoc
class __$MealPhotoAttachmentCopyWithImpl<$Res>
    implements _$MealPhotoAttachmentCopyWith<$Res> {
  __$MealPhotoAttachmentCopyWithImpl(this._self, this._then);

  final _MealPhotoAttachment _self;
  final $Res Function(_MealPhotoAttachment) _then;

/// Create a copy of MealPhotoAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photo = freezed,Object? status = null,Object? uploadApproved = null,}) {
  return _then(_MealPhotoAttachment(
photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as MealPhoto?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MealPhotoStatus,uploadApproved: null == uploadApproved ? _self.uploadApproved : uploadApproved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MealPhotoAttachment
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
