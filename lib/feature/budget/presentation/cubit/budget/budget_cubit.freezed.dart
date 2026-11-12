// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BudgetState {

 DateTime get start; BudgetJournal? get journal; bool get busy; BudgetFeedback? get feedback;
/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BudgetStateCopyWith<BudgetState> get copyWith => _$BudgetStateCopyWithImpl<BudgetState>(this as BudgetState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as BudgetState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BudgetState&&(identical(other.start, _this.start) || other.start == _this.start)&&(identical(other.journal, _this.journal) || other.journal == _this.journal)&&(identical(other.busy, _this.busy) || other.busy == _this.busy)&&(identical(other.feedback, _this.feedback) || other.feedback == _this.feedback));
}


@override
int get hashCode {
  final _this = this as BudgetState;
  return Object.hash(runtimeType,_this.start,_this.journal,_this.busy,_this.feedback);
}

@override
String toString() {
  final _this = this as BudgetState;
  return 'BudgetState(start: ${_this.start}, journal: ${_this.journal}, busy: ${_this.busy}, feedback: ${_this.feedback})';
}


}

/// @nodoc
abstract mixin class $BudgetStateCopyWith<$Res>  {
  factory $BudgetStateCopyWith(BudgetState value, $Res Function(BudgetState) _then) = _$BudgetStateCopyWithImpl;
@useResult
$Res call({
 DateTime start, BudgetJournal? journal, bool busy, BudgetFeedback? feedback
});


$BudgetJournalCopyWith<$Res>? get journal;

}
/// @nodoc
class _$BudgetStateCopyWithImpl<$Res>
    implements $BudgetStateCopyWith<$Res> {
  _$BudgetStateCopyWithImpl(this._self, this._then);

  final BudgetState _self;
  final $Res Function(BudgetState) _then;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? journal = freezed,Object? busy = null,Object? feedback = freezed,}) {
  return _then(BudgetState(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,journal: freezed == journal ? _self.journal : journal // ignore: cast_nullable_to_non_nullable
as BudgetJournal?,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as BudgetFeedback?,
  ));
}
/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetJournalCopyWith<$Res>? get journal {
    if (_self.journal == null) {
    return null;
  }

  return $BudgetJournalCopyWith<$Res>(_self.journal!, (value) {
    return _then(_self.copyWith(journal: value));
  });
}
}


/// Adds pattern-matching-related methods to [BudgetState].
extension BudgetStatePatterns on BudgetState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BudgetState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BudgetState value)  $default,){
final _that = this;
switch (_that) {
case _BudgetState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BudgetState value)?  $default,){
final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime start,  BudgetJournal? journal,  bool busy,  BudgetFeedback? feedback)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
return $default(_that.start,_that.journal,_that.busy,_that.feedback);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime start,  BudgetJournal? journal,  bool busy,  BudgetFeedback? feedback)  $default,) {final _that = this;
switch (_that) {
case _BudgetState():
return $default(_that.start,_that.journal,_that.busy,_that.feedback);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime start,  BudgetJournal? journal,  bool busy,  BudgetFeedback? feedback)?  $default,) {final _that = this;
switch (_that) {
case _BudgetState() when $default != null:
return $default(_that.start,_that.journal,_that.busy,_that.feedback);case _:
  return null;

}
}

}

/// @nodoc


class _BudgetState implements BudgetState {
  const _BudgetState({required this.start, this.journal, this.busy = false, this.feedback});


@override final  DateTime start;
@override final  BudgetJournal? journal;
@override@JsonKey() final  bool busy;
@override final  BudgetFeedback? feedback;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BudgetStateCopyWith<_BudgetState> get copyWith => __$BudgetStateCopyWithImpl<_BudgetState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _BudgetState&&(identical(other.start, start) || other.start == start)&&(identical(other.journal, journal) || other.journal == journal)&&(identical(other.busy, busy) || other.busy == busy)&&(identical(other.feedback, feedback) || other.feedback == feedback));
}


@override
int get hashCode {
    return Object.hash(runtimeType,start,journal,busy,feedback);
}

@override
String toString() {
    return 'BudgetState(start: $start, journal: $journal, busy: $busy, feedback: $feedback)';
}


}

/// @nodoc
abstract mixin class _$BudgetStateCopyWith<$Res> implements $BudgetStateCopyWith<$Res> {
  factory _$BudgetStateCopyWith(_BudgetState value, $Res Function(_BudgetState) _then) = __$BudgetStateCopyWithImpl;
@override @useResult
$Res call({
 DateTime start, BudgetJournal? journal, bool busy, BudgetFeedback? feedback
});


@override $BudgetJournalCopyWith<$Res>? get journal;

}
/// @nodoc
class __$BudgetStateCopyWithImpl<$Res>
    implements _$BudgetStateCopyWith<$Res> {
  __$BudgetStateCopyWithImpl(this._self, this._then);

  final _BudgetState _self;
  final $Res Function(_BudgetState) _then;

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? journal = freezed,Object? busy = null,Object? feedback = freezed,}) {
  return _then(_BudgetState(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as DateTime,journal: freezed == journal ? _self.journal : journal // ignore: cast_nullable_to_non_nullable
as BudgetJournal?,busy: null == busy ? _self.busy : busy // ignore: cast_nullable_to_non_nullable
as bool,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as BudgetFeedback?,
  ));
}

/// Create a copy of BudgetState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BudgetJournalCopyWith<$Res>? get journal {
    if (_self.journal == null) {
    return null;
  }

  return $BudgetJournalCopyWith<$Res>(_self.journal!, (value) {
    return _then(_self.copyWith(journal: value));
  });
}
}

// dart format on
