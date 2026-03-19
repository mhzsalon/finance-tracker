// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TransactionState {

 CreateTransactionState get createTransactionState; TransactionExportState get transactionExportState;// Filter oprions States
 TransactionType? get type; int? get categoryId; DateTime? get dateFilter; int get limit;
/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionStateCopyWith<TransactionState> get copyWith => _$TransactionStateCopyWithImpl<TransactionState>(this as TransactionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionState&&(identical(other.createTransactionState, createTransactionState) || other.createTransactionState == createTransactionState)&&(identical(other.transactionExportState, transactionExportState) || other.transactionExportState == transactionExportState)&&(identical(other.type, type) || other.type == type)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.dateFilter, dateFilter) || other.dateFilter == dateFilter)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,createTransactionState,transactionExportState,type,categoryId,dateFilter,limit);

@override
String toString() {
  return 'TransactionState(createTransactionState: $createTransactionState, transactionExportState: $transactionExportState, type: $type, categoryId: $categoryId, dateFilter: $dateFilter, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $TransactionStateCopyWith<$Res>  {
  factory $TransactionStateCopyWith(TransactionState value, $Res Function(TransactionState) _then) = _$TransactionStateCopyWithImpl;
@useResult
$Res call({
 CreateTransactionState createTransactionState, TransactionExportState transactionExportState, TransactionType? type, int? categoryId, DateTime? dateFilter, int limit
});


$CreateTransactionStateCopyWith<$Res> get createTransactionState;$TransactionExportStateCopyWith<$Res> get transactionExportState;

}
/// @nodoc
class _$TransactionStateCopyWithImpl<$Res>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._self, this._then);

  final TransactionState _self;
  final $Res Function(TransactionState) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createTransactionState = null,Object? transactionExportState = null,Object? type = freezed,Object? categoryId = freezed,Object? dateFilter = freezed,Object? limit = null,}) {
  return _then(_self.copyWith(
createTransactionState: null == createTransactionState ? _self.createTransactionState : createTransactionState // ignore: cast_nullable_to_non_nullable
as CreateTransactionState,transactionExportState: null == transactionExportState ? _self.transactionExportState : transactionExportState // ignore: cast_nullable_to_non_nullable
as TransactionExportState,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,dateFilter: freezed == dateFilter ? _self.dateFilter : dateFilter // ignore: cast_nullable_to_non_nullable
as DateTime?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTransactionStateCopyWith<$Res> get createTransactionState {
  
  return $CreateTransactionStateCopyWith<$Res>(_self.createTransactionState, (value) {
    return _then(_self.copyWith(createTransactionState: value));
  });
}/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionExportStateCopyWith<$Res> get transactionExportState {
  
  return $TransactionExportStateCopyWith<$Res>(_self.transactionExportState, (value) {
    return _then(_self.copyWith(transactionExportState: value));
  });
}
}


/// Adds pattern-matching-related methods to [TransactionState].
extension TransactionStatePatterns on TransactionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionState value)  $default,){
final _that = this;
switch (_that) {
case _TransactionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionState value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CreateTransactionState createTransactionState,  TransactionExportState transactionExportState,  TransactionType? type,  int? categoryId,  DateTime? dateFilter,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
return $default(_that.createTransactionState,_that.transactionExportState,_that.type,_that.categoryId,_that.dateFilter,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CreateTransactionState createTransactionState,  TransactionExportState transactionExportState,  TransactionType? type,  int? categoryId,  DateTime? dateFilter,  int limit)  $default,) {final _that = this;
switch (_that) {
case _TransactionState():
return $default(_that.createTransactionState,_that.transactionExportState,_that.type,_that.categoryId,_that.dateFilter,_that.limit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CreateTransactionState createTransactionState,  TransactionExportState transactionExportState,  TransactionType? type,  int? categoryId,  DateTime? dateFilter,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _TransactionState() when $default != null:
return $default(_that.createTransactionState,_that.transactionExportState,_that.type,_that.categoryId,_that.dateFilter,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionState implements TransactionState {
   _TransactionState({this.createTransactionState = const CreateTransactionState.initial(), this.transactionExportState = const TransactionExportState.initial(), this.type, this.categoryId, this.dateFilter, this.limit = 10});
  

@override@JsonKey() final  CreateTransactionState createTransactionState;
@override@JsonKey() final  TransactionExportState transactionExportState;
// Filter oprions States
@override final  TransactionType? type;
@override final  int? categoryId;
@override final  DateTime? dateFilter;
@override@JsonKey() final  int limit;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionStateCopyWith<_TransactionState> get copyWith => __$TransactionStateCopyWithImpl<_TransactionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionState&&(identical(other.createTransactionState, createTransactionState) || other.createTransactionState == createTransactionState)&&(identical(other.transactionExportState, transactionExportState) || other.transactionExportState == transactionExportState)&&(identical(other.type, type) || other.type == type)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.dateFilter, dateFilter) || other.dateFilter == dateFilter)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,createTransactionState,transactionExportState,type,categoryId,dateFilter,limit);

@override
String toString() {
  return 'TransactionState(createTransactionState: $createTransactionState, transactionExportState: $transactionExportState, type: $type, categoryId: $categoryId, dateFilter: $dateFilter, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$TransactionStateCopyWith<$Res> implements $TransactionStateCopyWith<$Res> {
  factory _$TransactionStateCopyWith(_TransactionState value, $Res Function(_TransactionState) _then) = __$TransactionStateCopyWithImpl;
@override @useResult
$Res call({
 CreateTransactionState createTransactionState, TransactionExportState transactionExportState, TransactionType? type, int? categoryId, DateTime? dateFilter, int limit
});


@override $CreateTransactionStateCopyWith<$Res> get createTransactionState;@override $TransactionExportStateCopyWith<$Res> get transactionExportState;

}
/// @nodoc
class __$TransactionStateCopyWithImpl<$Res>
    implements _$TransactionStateCopyWith<$Res> {
  __$TransactionStateCopyWithImpl(this._self, this._then);

  final _TransactionState _self;
  final $Res Function(_TransactionState) _then;

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? createTransactionState = null,Object? transactionExportState = null,Object? type = freezed,Object? categoryId = freezed,Object? dateFilter = freezed,Object? limit = null,}) {
  return _then(_TransactionState(
createTransactionState: null == createTransactionState ? _self.createTransactionState : createTransactionState // ignore: cast_nullable_to_non_nullable
as CreateTransactionState,transactionExportState: null == transactionExportState ? _self.transactionExportState : transactionExportState // ignore: cast_nullable_to_non_nullable
as TransactionExportState,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as TransactionType?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,dateFilter: freezed == dateFilter ? _self.dateFilter : dateFilter // ignore: cast_nullable_to_non_nullable
as DateTime?,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateTransactionStateCopyWith<$Res> get createTransactionState {
  
  return $CreateTransactionStateCopyWith<$Res>(_self.createTransactionState, (value) {
    return _then(_self.copyWith(createTransactionState: value));
  });
}/// Create a copy of TransactionState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionExportStateCopyWith<$Res> get transactionExportState {
  
  return $TransactionExportStateCopyWith<$Res>(_self.transactionExportState, (value) {
    return _then(_self.copyWith(transactionExportState: value));
  });
}
}

/// @nodoc
mixin _$CreateTransactionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateTransactionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateTransactionState()';
}


}

/// @nodoc
class $CreateTransactionStateCopyWith<$Res>  {
$CreateTransactionStateCopyWith(CreateTransactionState _, $Res Function(CreateTransactionState) __);
}


/// Adds pattern-matching-related methods to [CreateTransactionState].
extension CreateTransactionStatePatterns on CreateTransactionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CreateTransactionStateInitial value)?  initial,TResult Function( _CreateTransactionStateLoading value)?  loading,TResult Function( _CreateTransactionStateSuccess value)?  success,TResult Function( _CreateTransactionStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateTransactionStateInitial() when initial != null:
return initial(_that);case _CreateTransactionStateLoading() when loading != null:
return loading(_that);case _CreateTransactionStateSuccess() when success != null:
return success(_that);case _CreateTransactionStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CreateTransactionStateInitial value)  initial,required TResult Function( _CreateTransactionStateLoading value)  loading,required TResult Function( _CreateTransactionStateSuccess value)  success,required TResult Function( _CreateTransactionStateError value)  error,}){
final _that = this;
switch (_that) {
case _CreateTransactionStateInitial():
return initial(_that);case _CreateTransactionStateLoading():
return loading(_that);case _CreateTransactionStateSuccess():
return success(_that);case _CreateTransactionStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CreateTransactionStateInitial value)?  initial,TResult? Function( _CreateTransactionStateLoading value)?  loading,TResult? Function( _CreateTransactionStateSuccess value)?  success,TResult? Function( _CreateTransactionStateError value)?  error,}){
final _that = this;
switch (_that) {
case _CreateTransactionStateInitial() when initial != null:
return initial(_that);case _CreateTransactionStateLoading() when loading != null:
return loading(_that);case _CreateTransactionStateSuccess() when success != null:
return success(_that);case _CreateTransactionStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String success)?  success,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateTransactionStateInitial() when initial != null:
return initial();case _CreateTransactionStateLoading() when loading != null:
return loading();case _CreateTransactionStateSuccess() when success != null:
return success(_that.success);case _CreateTransactionStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String success)  success,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _CreateTransactionStateInitial():
return initial();case _CreateTransactionStateLoading():
return loading();case _CreateTransactionStateSuccess():
return success(_that.success);case _CreateTransactionStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String success)?  success,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _CreateTransactionStateInitial() when initial != null:
return initial();case _CreateTransactionStateLoading() when loading != null:
return loading();case _CreateTransactionStateSuccess() when success != null:
return success(_that.success);case _CreateTransactionStateError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _CreateTransactionStateInitial implements CreateTransactionState {
  const _CreateTransactionStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateTransactionState.initial()';
}


}




/// @nodoc


class _CreateTransactionStateLoading implements CreateTransactionState {
  const _CreateTransactionStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateTransactionState.loading()';
}


}




/// @nodoc


class _CreateTransactionStateSuccess implements CreateTransactionState {
  const _CreateTransactionStateSuccess(this.success);
  

 final  String success;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionStateSuccessCopyWith<_CreateTransactionStateSuccess> get copyWith => __$CreateTransactionStateSuccessCopyWithImpl<_CreateTransactionStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionStateSuccess&&(identical(other.success, success) || other.success == success));
}


@override
int get hashCode => Object.hash(runtimeType,success);

@override
String toString() {
  return 'CreateTransactionState.success(success: $success)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionStateSuccessCopyWith<$Res> implements $CreateTransactionStateCopyWith<$Res> {
  factory _$CreateTransactionStateSuccessCopyWith(_CreateTransactionStateSuccess value, $Res Function(_CreateTransactionStateSuccess) _then) = __$CreateTransactionStateSuccessCopyWithImpl;
@useResult
$Res call({
 String success
});




}
/// @nodoc
class __$CreateTransactionStateSuccessCopyWithImpl<$Res>
    implements _$CreateTransactionStateSuccessCopyWith<$Res> {
  __$CreateTransactionStateSuccessCopyWithImpl(this._self, this._then);

  final _CreateTransactionStateSuccess _self;
  final $Res Function(_CreateTransactionStateSuccess) _then;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = null,}) {
  return _then(_CreateTransactionStateSuccess(
null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _CreateTransactionStateError implements CreateTransactionState {
  const _CreateTransactionStateError(this.failure);
  

 final  Failure failure;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateTransactionStateErrorCopyWith<_CreateTransactionStateError> get copyWith => __$CreateTransactionStateErrorCopyWithImpl<_CreateTransactionStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateTransactionStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'CreateTransactionState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$CreateTransactionStateErrorCopyWith<$Res> implements $CreateTransactionStateCopyWith<$Res> {
  factory _$CreateTransactionStateErrorCopyWith(_CreateTransactionStateError value, $Res Function(_CreateTransactionStateError) _then) = __$CreateTransactionStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$CreateTransactionStateErrorCopyWithImpl<$Res>
    implements _$CreateTransactionStateErrorCopyWith<$Res> {
  __$CreateTransactionStateErrorCopyWithImpl(this._self, this._then);

  final _CreateTransactionStateError _self;
  final $Res Function(_CreateTransactionStateError) _then;

/// Create a copy of CreateTransactionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_CreateTransactionStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc
mixin _$TransactionExportState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionExportState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionExportState()';
}


}

/// @nodoc
class $TransactionExportStateCopyWith<$Res>  {
$TransactionExportStateCopyWith(TransactionExportState _, $Res Function(TransactionExportState) __);
}


/// Adds pattern-matching-related methods to [TransactionExportState].
extension TransactionExportStatePatterns on TransactionExportState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TransactionExportStateInitial value)?  initial,TResult Function( _TransactionExportStateLoading value)?  loading,TResult Function( _TransactionExportStateSuccess value)?  success,TResult Function( _TransactionExportStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionExportStateInitial() when initial != null:
return initial(_that);case _TransactionExportStateLoading() when loading != null:
return loading(_that);case _TransactionExportStateSuccess() when success != null:
return success(_that);case _TransactionExportStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TransactionExportStateInitial value)  initial,required TResult Function( _TransactionExportStateLoading value)  loading,required TResult Function( _TransactionExportStateSuccess value)  success,required TResult Function( _TransactionExportStateError value)  error,}){
final _that = this;
switch (_that) {
case _TransactionExportStateInitial():
return initial(_that);case _TransactionExportStateLoading():
return loading(_that);case _TransactionExportStateSuccess():
return success(_that);case _TransactionExportStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TransactionExportStateInitial value)?  initial,TResult? Function( _TransactionExportStateLoading value)?  loading,TResult? Function( _TransactionExportStateSuccess value)?  success,TResult? Function( _TransactionExportStateError value)?  error,}){
final _that = this;
switch (_that) {
case _TransactionExportStateInitial() when initial != null:
return initial(_that);case _TransactionExportStateLoading() when loading != null:
return loading(_that);case _TransactionExportStateSuccess() when success != null:
return success(_that);case _TransactionExportStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  success,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionExportStateInitial() when initial != null:
return initial();case _TransactionExportStateLoading() when loading != null:
return loading();case _TransactionExportStateSuccess() when success != null:
return success();case _TransactionExportStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  success,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case _TransactionExportStateInitial():
return initial();case _TransactionExportStateLoading():
return loading();case _TransactionExportStateSuccess():
return success();case _TransactionExportStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  success,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case _TransactionExportStateInitial() when initial != null:
return initial();case _TransactionExportStateLoading() when loading != null:
return loading();case _TransactionExportStateSuccess() when success != null:
return success();case _TransactionExportStateError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _TransactionExportStateInitial implements TransactionExportState {
  const _TransactionExportStateInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionExportStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionExportState.initial()';
}


}




/// @nodoc


class _TransactionExportStateLoading implements TransactionExportState {
  const _TransactionExportStateLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionExportStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionExportState.loading()';
}


}




/// @nodoc


class _TransactionExportStateSuccess implements TransactionExportState {
  const _TransactionExportStateSuccess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionExportStateSuccess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TransactionExportState.success()';
}


}




/// @nodoc


class _TransactionExportStateError implements TransactionExportState {
  const _TransactionExportStateError(this.failure);
  

 final  Failure failure;

/// Create a copy of TransactionExportState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionExportStateErrorCopyWith<_TransactionExportStateError> get copyWith => __$TransactionExportStateErrorCopyWithImpl<_TransactionExportStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionExportStateError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'TransactionExportState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$TransactionExportStateErrorCopyWith<$Res> implements $TransactionExportStateCopyWith<$Res> {
  factory _$TransactionExportStateErrorCopyWith(_TransactionExportStateError value, $Res Function(_TransactionExportStateError) _then) = __$TransactionExportStateErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$TransactionExportStateErrorCopyWithImpl<$Res>
    implements _$TransactionExportStateErrorCopyWith<$Res> {
  __$TransactionExportStateErrorCopyWithImpl(this._self, this._then);

  final _TransactionExportStateError _self;
  final $Res Function(_TransactionExportStateError) _then;

/// Create a copy of TransactionExportState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_TransactionExportStateError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
