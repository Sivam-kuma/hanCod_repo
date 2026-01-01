// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cleaning_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CleaningState {

 CleaningStatus get status; List<Cleaning> get services; String? get message;
/// Create a copy of CleaningState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CleaningStateCopyWith<CleaningState> get copyWith => _$CleaningStateCopyWithImpl<CleaningState>(this as CleaningState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CleaningState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(services),message);

@override
String toString() {
  return 'CleaningState(status: $status, services: $services, message: $message)';
}


}

/// @nodoc
abstract mixin class $CleaningStateCopyWith<$Res>  {
  factory $CleaningStateCopyWith(CleaningState value, $Res Function(CleaningState) _then) = _$CleaningStateCopyWithImpl;
@useResult
$Res call({
 CleaningStatus status, List<Cleaning> services, String? message
});




}
/// @nodoc
class _$CleaningStateCopyWithImpl<$Res>
    implements $CleaningStateCopyWith<$Res> {
  _$CleaningStateCopyWithImpl(this._self, this._then);

  final CleaningState _self;
  final $Res Function(CleaningState) _then;

/// Create a copy of CleaningState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? services = null,Object? message = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CleaningStatus,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<Cleaning>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CleaningState].
extension CleaningStatePatterns on CleaningState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CleaningState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CleaningState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CleaningState value)  $default,){
final _that = this;
switch (_that) {
case _CleaningState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CleaningState value)?  $default,){
final _that = this;
switch (_that) {
case _CleaningState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CleaningStatus status,  List<Cleaning> services,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CleaningState() when $default != null:
return $default(_that.status,_that.services,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CleaningStatus status,  List<Cleaning> services,  String? message)  $default,) {final _that = this;
switch (_that) {
case _CleaningState():
return $default(_that.status,_that.services,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CleaningStatus status,  List<Cleaning> services,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _CleaningState() when $default != null:
return $default(_that.status,_that.services,_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _CleaningState implements CleaningState {
  const _CleaningState({this.status = CleaningStatus.initial, final  List<Cleaning> services = const [], this.message}): _services = services;
  

@override@JsonKey() final  CleaningStatus status;
 final  List<Cleaning> _services;
@override@JsonKey() List<Cleaning> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override final  String? message;

/// Create a copy of CleaningState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CleaningStateCopyWith<_CleaningState> get copyWith => __$CleaningStateCopyWithImpl<_CleaningState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CleaningState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_services),message);

@override
String toString() {
  return 'CleaningState(status: $status, services: $services, message: $message)';
}


}

/// @nodoc
abstract mixin class _$CleaningStateCopyWith<$Res> implements $CleaningStateCopyWith<$Res> {
  factory _$CleaningStateCopyWith(_CleaningState value, $Res Function(_CleaningState) _then) = __$CleaningStateCopyWithImpl;
@override @useResult
$Res call({
 CleaningStatus status, List<Cleaning> services, String? message
});




}
/// @nodoc
class __$CleaningStateCopyWithImpl<$Res>
    implements _$CleaningStateCopyWith<$Res> {
  __$CleaningStateCopyWithImpl(this._self, this._then);

  final _CleaningState _self;
  final $Res Function(_CleaningState) _then;

/// Create a copy of CleaningState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? services = null,Object? message = freezed,}) {
  return _then(_CleaningState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CleaningStatus,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<Cleaning>,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
