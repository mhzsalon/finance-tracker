// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {

/// The state of the reels feed.
 AppRefState get appRefState;
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateCopyWith<OnboardingState> get copyWith => _$OnboardingStateCopyWithImpl<OnboardingState>(this as OnboardingState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState&&(identical(other.appRefState, appRefState) || other.appRefState == appRefState));
}


@override
int get hashCode => Object.hash(runtimeType,appRefState);

@override
String toString() {
  return 'OnboardingState(appRefState: $appRefState)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateCopyWith<$Res>  {
  factory $OnboardingStateCopyWith(OnboardingState value, $Res Function(OnboardingState) _then) = _$OnboardingStateCopyWithImpl;
@useResult
$Res call({
 AppRefState appRefState
});


$AppRefStateCopyWith<$Res> get appRefState;

}
/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._self, this._then);

  final OnboardingState _self;
  final $Res Function(OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appRefState = null,}) {
  return _then(_self.copyWith(
appRefState: null == appRefState ? _self.appRefState : appRefState // ignore: cast_nullable_to_non_nullable
as AppRefState,
  ));
}
/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppRefStateCopyWith<$Res> get appRefState {
  
  return $AppRefStateCopyWith<$Res>(_self.appRefState, (value) {
    return _then(_self.copyWith(appRefState: value));
  });
}
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingState value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingState value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppRefState appRefState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.appRefState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppRefState appRefState)  $default,) {final _that = this;
switch (_that) {
case _OnboardingState():
return $default(_that.appRefState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppRefState appRefState)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingState() when $default != null:
return $default(_that.appRefState);case _:
  return null;

}
}

}

/// @nodoc


class _OnboardingState implements OnboardingState {
   _OnboardingState({this.appRefState = const AppRefState.initial()});
  

/// The state of the reels feed.
@override@JsonKey() final  AppRefState appRefState;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingStateCopyWith<_OnboardingState> get copyWith => __$OnboardingStateCopyWithImpl<_OnboardingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingState&&(identical(other.appRefState, appRefState) || other.appRefState == appRefState));
}


@override
int get hashCode => Object.hash(runtimeType,appRefState);

@override
String toString() {
  return 'OnboardingState(appRefState: $appRefState)';
}


}

/// @nodoc
abstract mixin class _$OnboardingStateCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory _$OnboardingStateCopyWith(_OnboardingState value, $Res Function(_OnboardingState) _then) = __$OnboardingStateCopyWithImpl;
@override @useResult
$Res call({
 AppRefState appRefState
});


@override $AppRefStateCopyWith<$Res> get appRefState;

}
/// @nodoc
class __$OnboardingStateCopyWithImpl<$Res>
    implements _$OnboardingStateCopyWith<$Res> {
  __$OnboardingStateCopyWithImpl(this._self, this._then);

  final _OnboardingState _self;
  final $Res Function(_OnboardingState) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appRefState = null,}) {
  return _then(_OnboardingState(
appRefState: null == appRefState ? _self.appRefState : appRefState // ignore: cast_nullable_to_non_nullable
as AppRefState,
  ));
}

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppRefStateCopyWith<$Res> get appRefState {
  
  return $AppRefStateCopyWith<$Res>(_self.appRefState, (value) {
    return _then(_self.copyWith(appRefState: value));
  });
}
}

/// @nodoc
mixin _$AppRefState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppRefState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRefState()';
}


}

/// @nodoc
class $AppRefStateCopyWith<$Res>  {
$AppRefStateCopyWith(AppRefState _, $Res Function(AppRefState) __);
}


/// Adds pattern-matching-related methods to [AppRefState].
extension AppRefStatePatterns on AppRefState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AppRefStateInitial value)?  initial,TResult Function( _AppRefStateLoading value)?  loading,TResult Function( _AppRefStateSuccess value)?  success,TResult Function( _AppRefStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppRefStateInitial() when initial != null:
return initial(_that);case _AppRefStateLoading() when loading != null:
return loading(_that);case _AppRefStateSuccess() when success != null:
return success(_that);case _AppRefStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AppRefStateInitial value)  initial,required TResult Function( _AppRefStateLoading value)  loading,required TResult Function( _AppRefStateSuccess value)  success,required TResult Function( _AppRefStateError value)  error,}){
final _that = this;
switch (_that) {
case _AppRefStateInitial():
return initial(_that);case _AppRefStateLoading():
return loading(_that);case _AppRefStateSuccess():
return success(_that);case _AppRefStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AppRefStateInitial value)?  initial,TResult? Function( _AppRefStateLoading value)?  loading,TResult? Function( _AppRefStateSuccess value)?  success,TResult? Function( _AppRefStateError value)?  error,}){
final _that = this;
switch (_that) {
case _AppRefStateInitial() when initial != null:
return initial(_that);case _AppRefStateLoading() when loading != null:
return loading(_that);case _AppRefStateSuccess() when success != null:
return success(_that);case _AppRefStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( bool success)?  success,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppRefStateInitial() when initial != null:
return initial();case _AppRefStateLoading() when loading != null:
return loading();case _AppRefStateSuccess() when success != null:
return success(_that.success);case _AppRefStateError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( bool success)  success,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _AppRefStateInitial():
return initial();case _AppRefStateLoading():
return loading();case _AppRefStateSuccess():
return success(_that.success);case _AppRefStateError():
return error(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( bool success)?  success,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _AppRefStateInitial() when initial != null:
return initial();case _AppRefStateLoading() when loading != null:
return loading();case _AppRefStateSuccess() when success != null:
return success(_that.success);case _AppRefStateError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _AppRefStateInitial implements AppRefState {
  const _AppRefStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppRefStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRefState.initial()';
}


}




/// @nodoc


class _AppRefStateLoading implements AppRefState {
  const _AppRefStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppRefStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRefState.loading()';
}


}




/// @nodoc


class _AppRefStateSuccess implements AppRefState {
  const _AppRefStateSuccess(this.success);
  

 final  bool success;

/// Create a copy of AppRefState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppRefStateSuccessCopyWith<_AppRefStateSuccess> get copyWith => __$AppRefStateSuccessCopyWithImpl<_AppRefStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppRefStateSuccess&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'AppRefState.success(success: $success)';
}


}

/// @nodoc
abstract mixin class _$AppRefStateSuccessCopyWith<$Res> implements $AppRefStateCopyWith<$Res> {
  factory _$AppRefStateSuccessCopyWith(_AppRefStateSuccess value, $Res Function(_AppRefStateSuccess) _then) = __$AppRefStateSuccessCopyWithImpl;
@useResult
$Res call({
 bool success
});




}
/// @nodoc
class __$AppRefStateSuccessCopyWithImpl<$Res>
    implements _$AppRefStateSuccessCopyWith<$Res> {
  __$AppRefStateSuccessCopyWithImpl(this._self, this._then);

  final _AppRefStateSuccess _self;
  final $Res Function(_AppRefStateSuccess) _then;

/// Create a copy of AppRefState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_AppRefStateSuccess(
null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class _AppRefStateError implements AppRefState {
  const _AppRefStateError(this.failure);
  

 final  Failure failure;

/// Create a copy of AppRefState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppRefStateErrorCopyWith<_AppRefStateError> get copyWith => __$AppRefStateErrorCopyWithImpl<_AppRefStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppRefStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AppRefState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$AppRefStateErrorCopyWith<$Res> implements $AppRefStateCopyWith<$Res> {
  factory _$AppRefStateErrorCopyWith(_AppRefStateError value, $Res Function(_AppRefStateError) _then) = __$AppRefStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$AppRefStateErrorCopyWithImpl<$Res>
    implements _$AppRefStateErrorCopyWith<$Res> {
  __$AppRefStateErrorCopyWithImpl(this._self, this._then);

  final _AppRefStateError _self;
  final $Res Function(_AppRefStateError) _then;

/// Create a copy of AppRefState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_AppRefStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
