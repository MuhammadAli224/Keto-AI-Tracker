// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diary_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiaryState {

 DateTime get date;
/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryStateCopyWith<DiaryState> get copyWith => _$DiaryStateCopyWithImpl<DiaryState>(this as DiaryState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DiaryState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryState&&(identical(other.date, _this.date) || other.date == _this.date));
}


@override
int get hashCode {
  final _this = this as DiaryState;
  return Object.hash(runtimeType,_this.date);
}

@override
String toString() {
  final _this = this as DiaryState;
  return 'DiaryState(date: ${_this.date})';
}


}

/// @nodoc
abstract mixin class $DiaryStateCopyWith<$Res>  {
  factory $DiaryStateCopyWith(DiaryState value, $Res Function(DiaryState) _then) = _$DiaryStateCopyWithImpl;
@useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$DiaryStateCopyWithImpl<$Res>
    implements $DiaryStateCopyWith<$Res> {
  _$DiaryStateCopyWithImpl(this._self, this._then);

  final DiaryState _self;
  final $Res Function(DiaryState) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DiaryState].
extension DiaryStatePatterns on DiaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DiaryLoading value)?  loading,TResult Function( DiaryFailed value)?  failure,TResult Function( DiaryReady value)?  ready,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DiaryLoading() when loading != null:
return loading(_that);case DiaryFailed() when failure != null:
return failure(_that);case DiaryReady() when ready != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DiaryLoading value)  loading,required TResult Function( DiaryFailed value)  failure,required TResult Function( DiaryReady value)  ready,}){
final _that = this;
switch (_that) {
case DiaryLoading():
return loading(_that);case DiaryFailed():
return failure(_that);case DiaryReady():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DiaryLoading value)?  loading,TResult? Function( DiaryFailed value)?  failure,TResult? Function( DiaryReady value)?  ready,}){
final _that = this;
switch (_that) {
case DiaryLoading() when loading != null:
return loading(_that);case DiaryFailed() when failure != null:
return failure(_that);case DiaryReady() when ready != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime date)?  loading,TResult Function( DateTime date,  DiaryError error)?  failure,TResult Function( DateTime date,  DiaryDay day,  bool awaitingWrites,  DiaryError? writeError)?  ready,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DiaryLoading() when loading != null:
return loading(_that.date);case DiaryFailed() when failure != null:
return failure(_that.date,_that.error);case DiaryReady() when ready != null:
return ready(_that.date,_that.day,_that.awaitingWrites,_that.writeError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime date)  loading,required TResult Function( DateTime date,  DiaryError error)  failure,required TResult Function( DateTime date,  DiaryDay day,  bool awaitingWrites,  DiaryError? writeError)  ready,}) {final _that = this;
switch (_that) {
case DiaryLoading():
return loading(_that.date);case DiaryFailed():
return failure(_that.date,_that.error);case DiaryReady():
return ready(_that.date,_that.day,_that.awaitingWrites,_that.writeError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime date)?  loading,TResult? Function( DateTime date,  DiaryError error)?  failure,TResult? Function( DateTime date,  DiaryDay day,  bool awaitingWrites,  DiaryError? writeError)?  ready,}) {final _that = this;
switch (_that) {
case DiaryLoading() when loading != null:
return loading(_that.date);case DiaryFailed() when failure != null:
return failure(_that.date,_that.error);case DiaryReady() when ready != null:
return ready(_that.date,_that.day,_that.awaitingWrites,_that.writeError);case _:
  return null;

}
}

}

/// @nodoc


class DiaryLoading implements DiaryState {
  const DiaryLoading(this.date);


@override final  DateTime date;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryLoadingCopyWith<DiaryLoading> get copyWith => _$DiaryLoadingCopyWithImpl<DiaryLoading>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryLoading&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date);
}

@override
String toString() {
    return 'DiaryState.loading(date: $date)';
}


}

/// @nodoc
abstract mixin class $DiaryLoadingCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory $DiaryLoadingCopyWith(DiaryLoading value, $Res Function(DiaryLoading) _then) = _$DiaryLoadingCopyWithImpl;
@override @useResult
$Res call({
 DateTime date
});




}
/// @nodoc
class _$DiaryLoadingCopyWithImpl<$Res>
    implements $DiaryLoadingCopyWith<$Res> {
  _$DiaryLoadingCopyWithImpl(this._self, this._then);

  final DiaryLoading _self;
  final $Res Function(DiaryLoading) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,}) {
  return _then(DiaryLoading(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc


class DiaryFailed implements DiaryState {
  const DiaryFailed(this.date, this.error);


@override final  DateTime date;
 final  DiaryError error;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryFailedCopyWith<DiaryFailed> get copyWith => _$DiaryFailedCopyWithImpl<DiaryFailed>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryFailed&&(identical(other.date, date) || other.date == date)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,error);
}

@override
String toString() {
    return 'DiaryState.failure(date: $date, error: $error)';
}


}

/// @nodoc
abstract mixin class $DiaryFailedCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory $DiaryFailedCopyWith(DiaryFailed value, $Res Function(DiaryFailed) _then) = _$DiaryFailedCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, DiaryError error
});




}
/// @nodoc
class _$DiaryFailedCopyWithImpl<$Res>
    implements $DiaryFailedCopyWith<$Res> {
  _$DiaryFailedCopyWithImpl(this._self, this._then);

  final DiaryFailed _self;
  final $Res Function(DiaryFailed) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? error = null,}) {
  return _then(DiaryFailed(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as DiaryError,
  ));
}


}

/// @nodoc


class DiaryReady implements DiaryState {
  const DiaryReady(this.date, this.day, {this.awaitingWrites = false, this.writeError});


@override final  DateTime date;
 final  DiaryDay day;
@JsonKey() final  bool awaitingWrites;
 final  DiaryError? writeError;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiaryReadyCopyWith<DiaryReady> get copyWith => _$DiaryReadyCopyWithImpl<DiaryReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiaryReady&&(identical(other.date, date) || other.date == date)&&(identical(other.day, day) || other.day == day)&&(identical(other.awaitingWrites, awaitingWrites) || other.awaitingWrites == awaitingWrites)&&(identical(other.writeError, writeError) || other.writeError == writeError));
}


@override
int get hashCode {
    return Object.hash(runtimeType,date,day,awaitingWrites,writeError);
}

@override
String toString() {
    return 'DiaryState.ready(date: $date, day: $day, awaitingWrites: $awaitingWrites, writeError: $writeError)';
}


}

/// @nodoc
abstract mixin class $DiaryReadyCopyWith<$Res> implements $DiaryStateCopyWith<$Res> {
  factory $DiaryReadyCopyWith(DiaryReady value, $Res Function(DiaryReady) _then) = _$DiaryReadyCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, DiaryDay day, bool awaitingWrites, DiaryError? writeError
});


$DiaryDayCopyWith<$Res> get day;

}
/// @nodoc
class _$DiaryReadyCopyWithImpl<$Res>
    implements $DiaryReadyCopyWith<$Res> {
  _$DiaryReadyCopyWithImpl(this._self, this._then);

  final DiaryReady _self;
  final $Res Function(DiaryReady) _then;

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? day = null,Object? awaitingWrites = null,Object? writeError = freezed,}) {
  return _then(DiaryReady(
null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as DiaryDay,awaitingWrites: null == awaitingWrites ? _self.awaitingWrites : awaitingWrites // ignore: cast_nullable_to_non_nullable
as bool,writeError: freezed == writeError ? _self.writeError : writeError // ignore: cast_nullable_to_non_nullable
as DiaryError?,
  ));
}

/// Create a copy of DiaryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiaryDayCopyWith<$Res> get day {

  return $DiaryDayCopyWith<$Res>(_self.day, (value) {
    return _then(_self.copyWith(day: value));
  });
}
}

// dart format on
