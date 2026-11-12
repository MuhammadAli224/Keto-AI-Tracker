// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressState {

 WeightHistory? get history; WeeklyReport? get report; ProgressError? get historyError; ProgressError? get reportError; ProgressError? get writeError; bool get reportLoading;
/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressStateCopyWith<ProgressState> get copyWith => _$ProgressStateCopyWithImpl<ProgressState>(this as ProgressState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProgressState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressState&&(identical(other.history, _this.history) || other.history == _this.history)&&(identical(other.report, _this.report) || other.report == _this.report)&&(identical(other.historyError, _this.historyError) || other.historyError == _this.historyError)&&(identical(other.reportError, _this.reportError) || other.reportError == _this.reportError)&&(identical(other.writeError, _this.writeError) || other.writeError == _this.writeError)&&(identical(other.reportLoading, _this.reportLoading) || other.reportLoading == _this.reportLoading));
}


@override
int get hashCode {
  final _this = this as ProgressState;
  return Object.hash(runtimeType,_this.history,_this.report,_this.historyError,_this.reportError,_this.writeError,_this.reportLoading);
}

@override
String toString() {
  final _this = this as ProgressState;
  return 'ProgressState(history: ${_this.history}, report: ${_this.report}, historyError: ${_this.historyError}, reportError: ${_this.reportError}, writeError: ${_this.writeError}, reportLoading: ${_this.reportLoading})';
}


}

/// @nodoc
abstract mixin class $ProgressStateCopyWith<$Res>  {
  factory $ProgressStateCopyWith(ProgressState value, $Res Function(ProgressState) _then) = _$ProgressStateCopyWithImpl;
@useResult
$Res call({
 WeightHistory? history, WeeklyReport? report, ProgressError? historyError, ProgressError? reportError, ProgressError? writeError, bool reportLoading
});


$WeightHistoryCopyWith<$Res>? get history;$WeeklyReportCopyWith<$Res>? get report;

}
/// @nodoc
class _$ProgressStateCopyWithImpl<$Res>
    implements $ProgressStateCopyWith<$Res> {
  _$ProgressStateCopyWithImpl(this._self, this._then);

  final ProgressState _self;
  final $Res Function(ProgressState) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? history = freezed,Object? report = freezed,Object? historyError = freezed,Object? reportError = freezed,Object? writeError = freezed,Object? reportLoading = null,}) {
  return _then(ProgressState(
history: freezed == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as WeightHistory?,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as WeeklyReport?,historyError: freezed == historyError ? _self.historyError : historyError // ignore: cast_nullable_to_non_nullable
as ProgressError?,reportError: freezed == reportError ? _self.reportError : reportError // ignore: cast_nullable_to_non_nullable
as ProgressError?,writeError: freezed == writeError ? _self.writeError : writeError // ignore: cast_nullable_to_non_nullable
as ProgressError?,reportLoading: null == reportLoading ? _self.reportLoading : reportLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeightHistoryCopyWith<$Res>? get history {
    if (_self.history == null) {
    return null;
  }

  return $WeightHistoryCopyWith<$Res>(_self.history!, (value) {
    return _then(_self.copyWith(history: value));
  });
}/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklyReportCopyWith<$Res>? get report {
    if (_self.report == null) {
    return null;
  }

  return $WeeklyReportCopyWith<$Res>(_self.report!, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProgressState].
extension ProgressStatePatterns on ProgressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProgressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProgressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProgressState value)  $default,){
final _that = this;
switch (_that) {
case _ProgressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProgressState value)?  $default,){
final _that = this;
switch (_that) {
case _ProgressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WeightHistory? history,  WeeklyReport? report,  ProgressError? historyError,  ProgressError? reportError,  ProgressError? writeError,  bool reportLoading)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProgressState() when $default != null:
return $default(_that.history,_that.report,_that.historyError,_that.reportError,_that.writeError,_that.reportLoading);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WeightHistory? history,  WeeklyReport? report,  ProgressError? historyError,  ProgressError? reportError,  ProgressError? writeError,  bool reportLoading)  $default,) {final _that = this;
switch (_that) {
case _ProgressState():
return $default(_that.history,_that.report,_that.historyError,_that.reportError,_that.writeError,_that.reportLoading);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WeightHistory? history,  WeeklyReport? report,  ProgressError? historyError,  ProgressError? reportError,  ProgressError? writeError,  bool reportLoading)?  $default,) {final _that = this;
switch (_that) {
case _ProgressState() when $default != null:
return $default(_that.history,_that.report,_that.historyError,_that.reportError,_that.writeError,_that.reportLoading);case _:
  return null;

}
}

}

/// @nodoc


class _ProgressState implements ProgressState {
  const _ProgressState({this.history, this.report, this.historyError, this.reportError, this.writeError, this.reportLoading = false});


@override final  WeightHistory? history;
@override final  WeeklyReport? report;
@override final  ProgressError? historyError;
@override final  ProgressError? reportError;
@override final  ProgressError? writeError;
@override@JsonKey() final  bool reportLoading;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressStateCopyWith<_ProgressState> get copyWith => __$ProgressStateCopyWithImpl<_ProgressState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressState&&(identical(other.history, history) || other.history == history)&&(identical(other.report, report) || other.report == report)&&(identical(other.historyError, historyError) || other.historyError == historyError)&&(identical(other.reportError, reportError) || other.reportError == reportError)&&(identical(other.writeError, writeError) || other.writeError == writeError)&&(identical(other.reportLoading, reportLoading) || other.reportLoading == reportLoading));
}


@override
int get hashCode {
    return Object.hash(runtimeType,history,report,historyError,reportError,writeError,reportLoading);
}

@override
String toString() {
    return 'ProgressState(history: $history, report: $report, historyError: $historyError, reportError: $reportError, writeError: $writeError, reportLoading: $reportLoading)';
}


}

/// @nodoc
abstract mixin class _$ProgressStateCopyWith<$Res> implements $ProgressStateCopyWith<$Res> {
  factory _$ProgressStateCopyWith(_ProgressState value, $Res Function(_ProgressState) _then) = __$ProgressStateCopyWithImpl;
@override @useResult
$Res call({
 WeightHistory? history, WeeklyReport? report, ProgressError? historyError, ProgressError? reportError, ProgressError? writeError, bool reportLoading
});


@override $WeightHistoryCopyWith<$Res>? get history;@override $WeeklyReportCopyWith<$Res>? get report;

}
/// @nodoc
class __$ProgressStateCopyWithImpl<$Res>
    implements _$ProgressStateCopyWith<$Res> {
  __$ProgressStateCopyWithImpl(this._self, this._then);

  final _ProgressState _self;
  final $Res Function(_ProgressState) _then;

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? history = freezed,Object? report = freezed,Object? historyError = freezed,Object? reportError = freezed,Object? writeError = freezed,Object? reportLoading = null,}) {
  return _then(_ProgressState(
history: freezed == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as WeightHistory?,report: freezed == report ? _self.report : report // ignore: cast_nullable_to_non_nullable
as WeeklyReport?,historyError: freezed == historyError ? _self.historyError : historyError // ignore: cast_nullable_to_non_nullable
as ProgressError?,reportError: freezed == reportError ? _self.reportError : reportError // ignore: cast_nullable_to_non_nullable
as ProgressError?,writeError: freezed == writeError ? _self.writeError : writeError // ignore: cast_nullable_to_non_nullable
as ProgressError?,reportLoading: null == reportLoading ? _self.reportLoading : reportLoading // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeightHistoryCopyWith<$Res>? get history {
    if (_self.history == null) {
    return null;
  }

  return $WeightHistoryCopyWith<$Res>(_self.history!, (value) {
    return _then(_self.copyWith(history: value));
  });
}/// Create a copy of ProgressState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeeklyReportCopyWith<$Res>? get report {
    if (_self.report == null) {
    return null;
  }

  return $WeeklyReportCopyWith<$Res>(_self.report!, (value) {
    return _then(_self.copyWith(report: value));
  });
}
}

// dart format on
