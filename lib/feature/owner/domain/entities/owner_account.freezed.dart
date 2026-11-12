// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'owner_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OwnerAccount {

 String get uid;
/// Create a copy of OwnerAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OwnerAccountCopyWith<OwnerAccount> get copyWith => _$OwnerAccountCopyWithImpl<OwnerAccount>(this as OwnerAccount, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as OwnerAccount;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OwnerAccount&&(identical(other.uid, _this.uid) || other.uid == _this.uid));
}


@override
int get hashCode {
  final _this = this as OwnerAccount;
  return Object.hash(runtimeType,_this.uid);
}

@override
String toString() {
  final _this = this as OwnerAccount;
  return 'OwnerAccount(uid: ${_this.uid})';
}


}

/// @nodoc
abstract mixin class $OwnerAccountCopyWith<$Res>  {
  factory $OwnerAccountCopyWith(OwnerAccount value, $Res Function(OwnerAccount) _then) = _$OwnerAccountCopyWithImpl;
@useResult
$Res call({
 String uid
});




}
/// @nodoc
class _$OwnerAccountCopyWithImpl<$Res>
    implements $OwnerAccountCopyWith<$Res> {
  _$OwnerAccountCopyWithImpl(this._self, this._then);

  final OwnerAccount _self;
  final $Res Function(OwnerAccount) _then;

/// Create a copy of OwnerAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,}) {
  return _then(OwnerAccount(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OwnerAccount].
extension OwnerAccountPatterns on OwnerAccount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OwnerAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OwnerAccount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OwnerAccount value)  $default,){
final _that = this;
switch (_that) {
case _OwnerAccount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OwnerAccount value)?  $default,){
final _that = this;
switch (_that) {
case _OwnerAccount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OwnerAccount() when $default != null:
return $default(_that.uid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid)  $default,) {final _that = this;
switch (_that) {
case _OwnerAccount():
return $default(_that.uid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid)?  $default,) {final _that = this;
switch (_that) {
case _OwnerAccount() when $default != null:
return $default(_that.uid);case _:
  return null;

}
}

}

/// @nodoc


class _OwnerAccount implements OwnerAccount {
  const _OwnerAccount({required this.uid});


@override final  String uid;

/// Create a copy of OwnerAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OwnerAccountCopyWith<_OwnerAccount> get copyWith => __$OwnerAccountCopyWithImpl<_OwnerAccount>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OwnerAccount&&(identical(other.uid, uid) || other.uid == uid));
}


@override
int get hashCode {
    return Object.hash(runtimeType,uid);
}

@override
String toString() {
    return 'OwnerAccount(uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$OwnerAccountCopyWith<$Res> implements $OwnerAccountCopyWith<$Res> {
  factory _$OwnerAccountCopyWith(_OwnerAccount value, $Res Function(_OwnerAccount) _then) = __$OwnerAccountCopyWithImpl;
@override @useResult
$Res call({
 String uid
});




}
/// @nodoc
class __$OwnerAccountCopyWithImpl<$Res>
    implements _$OwnerAccountCopyWith<$Res> {
  __$OwnerAccountCopyWithImpl(this._self, this._then);

  final _OwnerAccount _self;
  final $Res Function(_OwnerAccount) _then;

/// Create a copy of OwnerAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,}) {
  return _then(_OwnerAccount(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
