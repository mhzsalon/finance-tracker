// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryState {

 CategoryEntity? get selectedCategory; GetCategoryState get getCategoryState;
/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryStateCopyWith<CategoryState> get copyWith => _$CategoryStateCopyWithImpl<CategoryState>(this as CategoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryState&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.getCategoryState, getCategoryState) || other.getCategoryState == getCategoryState));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategory,getCategoryState);

@override
String toString() {
  return 'CategoryState(selectedCategory: $selectedCategory, getCategoryState: $getCategoryState)';
}


}

/// @nodoc
abstract mixin class $CategoryStateCopyWith<$Res>  {
  factory $CategoryStateCopyWith(CategoryState value, $Res Function(CategoryState) _then) = _$CategoryStateCopyWithImpl;
@useResult
$Res call({
 CategoryEntity? selectedCategory, GetCategoryState getCategoryState
});


$GetCategoryStateCopyWith<$Res> get getCategoryState;

}
/// @nodoc
class _$CategoryStateCopyWithImpl<$Res>
    implements $CategoryStateCopyWith<$Res> {
  _$CategoryStateCopyWithImpl(this._self, this._then);

  final CategoryState _self;
  final $Res Function(CategoryState) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedCategory = freezed,Object? getCategoryState = null,}) {
  return _then(_self.copyWith(
selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CategoryEntity?,getCategoryState: null == getCategoryState ? _self.getCategoryState : getCategoryState // ignore: cast_nullable_to_non_nullable
as GetCategoryState,
  ));
}
/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetCategoryStateCopyWith<$Res> get getCategoryState {
  
  return $GetCategoryStateCopyWith<$Res>(_self.getCategoryState, (value) {
    return _then(_self.copyWith(getCategoryState: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryState].
extension CategoryStatePatterns on CategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryState value)  $default,){
final _that = this;
switch (_that) {
case _CategoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryState value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CategoryEntity? selectedCategory,  GetCategoryState getCategoryState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
return $default(_that.selectedCategory,_that.getCategoryState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CategoryEntity? selectedCategory,  GetCategoryState getCategoryState)  $default,) {final _that = this;
switch (_that) {
case _CategoryState():
return $default(_that.selectedCategory,_that.getCategoryState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CategoryEntity? selectedCategory,  GetCategoryState getCategoryState)?  $default,) {final _that = this;
switch (_that) {
case _CategoryState() when $default != null:
return $default(_that.selectedCategory,_that.getCategoryState);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryState implements CategoryState {
   _CategoryState({this.selectedCategory, this.getCategoryState = const GetCategoryState.initial()});
  

@override final  CategoryEntity? selectedCategory;
@override@JsonKey() final  GetCategoryState getCategoryState;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryStateCopyWith<_CategoryState> get copyWith => __$CategoryStateCopyWithImpl<_CategoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryState&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.getCategoryState, getCategoryState) || other.getCategoryState == getCategoryState));
}


@override
int get hashCode => Object.hash(runtimeType,selectedCategory,getCategoryState);

@override
String toString() {
  return 'CategoryState(selectedCategory: $selectedCategory, getCategoryState: $getCategoryState)';
}


}

/// @nodoc
abstract mixin class _$CategoryStateCopyWith<$Res> implements $CategoryStateCopyWith<$Res> {
  factory _$CategoryStateCopyWith(_CategoryState value, $Res Function(_CategoryState) _then) = __$CategoryStateCopyWithImpl;
@override @useResult
$Res call({
 CategoryEntity? selectedCategory, GetCategoryState getCategoryState
});


@override $GetCategoryStateCopyWith<$Res> get getCategoryState;

}
/// @nodoc
class __$CategoryStateCopyWithImpl<$Res>
    implements _$CategoryStateCopyWith<$Res> {
  __$CategoryStateCopyWithImpl(this._self, this._then);

  final _CategoryState _self;
  final $Res Function(_CategoryState) _then;

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedCategory = freezed,Object? getCategoryState = null,}) {
  return _then(_CategoryState(
selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as CategoryEntity?,getCategoryState: null == getCategoryState ? _self.getCategoryState : getCategoryState // ignore: cast_nullable_to_non_nullable
as GetCategoryState,
  ));
}

/// Create a copy of CategoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GetCategoryStateCopyWith<$Res> get getCategoryState {
  
  return $GetCategoryStateCopyWith<$Res>(_self.getCategoryState, (value) {
    return _then(_self.copyWith(getCategoryState: value));
  });
}
}

/// @nodoc
mixin _$GetCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetCategoryState()';
}


}

/// @nodoc
class $GetCategoryStateCopyWith<$Res>  {
$GetCategoryStateCopyWith(GetCategoryState _, $Res Function(GetCategoryState) __);
}


/// Adds pattern-matching-related methods to [GetCategoryState].
extension GetCategoryStatePatterns on GetCategoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetCategoryStateInitial value)?  initial,TResult Function( _GetCategoryStateLoading value)?  loading,TResult Function( _GetCategoryStateSuccess value)?  success,TResult Function( _GetCategoryStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetCategoryStateInitial() when initial != null:
return initial(_that);case _GetCategoryStateLoading() when loading != null:
return loading(_that);case _GetCategoryStateSuccess() when success != null:
return success(_that);case _GetCategoryStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetCategoryStateInitial value)  initial,required TResult Function( _GetCategoryStateLoading value)  loading,required TResult Function( _GetCategoryStateSuccess value)  success,required TResult Function( _GetCategoryStateError value)  error,}){
final _that = this;
switch (_that) {
case _GetCategoryStateInitial():
return initial(_that);case _GetCategoryStateLoading():
return loading(_that);case _GetCategoryStateSuccess():
return success(_that);case _GetCategoryStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetCategoryStateInitial value)?  initial,TResult? Function( _GetCategoryStateLoading value)?  loading,TResult? Function( _GetCategoryStateSuccess value)?  success,TResult? Function( _GetCategoryStateError value)?  error,}){
final _that = this;
switch (_that) {
case _GetCategoryStateInitial() when initial != null:
return initial(_that);case _GetCategoryStateLoading() when loading != null:
return loading(_that);case _GetCategoryStateSuccess() when success != null:
return success(_that);case _GetCategoryStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CategoryEntity> success)?  success,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetCategoryStateInitial() when initial != null:
return initial();case _GetCategoryStateLoading() when loading != null:
return loading();case _GetCategoryStateSuccess() when success != null:
return success(_that.success);case _GetCategoryStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CategoryEntity> success)  success,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _GetCategoryStateInitial():
return initial();case _GetCategoryStateLoading():
return loading();case _GetCategoryStateSuccess():
return success(_that.success);case _GetCategoryStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CategoryEntity> success)?  success,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _GetCategoryStateInitial() when initial != null:
return initial();case _GetCategoryStateLoading() when loading != null:
return loading();case _GetCategoryStateSuccess() when success != null:
return success(_that.success);case _GetCategoryStateError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _GetCategoryStateInitial implements GetCategoryState {
  const _GetCategoryStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoryStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetCategoryState.initial()';
}


}




/// @nodoc


class _GetCategoryStateLoading implements GetCategoryState {
  const _GetCategoryStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoryStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GetCategoryState.loading()';
}


}




/// @nodoc


class _GetCategoryStateSuccess implements GetCategoryState {
  const _GetCategoryStateSuccess(final  List<CategoryEntity> success): _success = success;
  

 final  List<CategoryEntity> _success;
 List<CategoryEntity> get success {
  if (_success is EqualUnmodifiableListView) return _success;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_success);
}


/// Create a copy of GetCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCategoryStateSuccessCopyWith<_GetCategoryStateSuccess> get copyWith => __$GetCategoryStateSuccessCopyWithImpl<_GetCategoryStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoryStateSuccess&&const DeepCollectionEquality().equals(other._success, _success));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_success));

@override
String toString() {
  return 'GetCategoryState.success(success: $success)';
}


}

/// @nodoc
abstract mixin class _$GetCategoryStateSuccessCopyWith<$Res> implements $GetCategoryStateCopyWith<$Res> {
  factory _$GetCategoryStateSuccessCopyWith(_GetCategoryStateSuccess value, $Res Function(_GetCategoryStateSuccess) _then) = __$GetCategoryStateSuccessCopyWithImpl;
@useResult
$Res call({
 List<CategoryEntity> success
});




}
/// @nodoc
class __$GetCategoryStateSuccessCopyWithImpl<$Res>
    implements _$GetCategoryStateSuccessCopyWith<$Res> {
  __$GetCategoryStateSuccessCopyWithImpl(this._self, this._then);

  final _GetCategoryStateSuccess _self;
  final $Res Function(_GetCategoryStateSuccess) _then;

/// Create a copy of GetCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_GetCategoryStateSuccess(
null == success ? _self._success : success // ignore: cast_nullable_to_non_nullable
as List<CategoryEntity>,
  ));
}


}

/// @nodoc


class _GetCategoryStateError implements GetCategoryState {
  const _GetCategoryStateError(this.failure);
  

 final  Failure failure;

/// Create a copy of GetCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetCategoryStateErrorCopyWith<_GetCategoryStateError> get copyWith => __$GetCategoryStateErrorCopyWithImpl<_GetCategoryStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetCategoryStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'GetCategoryState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$GetCategoryStateErrorCopyWith<$Res> implements $GetCategoryStateCopyWith<$Res> {
  factory _$GetCategoryStateErrorCopyWith(_GetCategoryStateError value, $Res Function(_GetCategoryStateError) _then) = __$GetCategoryStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$GetCategoryStateErrorCopyWithImpl<$Res>
    implements _$GetCategoryStateErrorCopyWith<$Res> {
  __$GetCategoryStateErrorCopyWithImpl(this._self, this._then);

  final _GetCategoryStateError _self;
  final $Res Function(_GetCategoryStateError) _then;

/// Create a copy of GetCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_GetCategoryStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
