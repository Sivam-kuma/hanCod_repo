// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cleaning.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Cleaning {

 int get id; String get name; int get quantity; int get amount; double get rating;
/// Create a copy of Cleaning
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CleaningCopyWith<Cleaning> get copyWith => _$CleaningCopyWithImpl<Cleaning>(this as Cleaning, _$identity);

  /// Serializes this Cleaning to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Cleaning&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,quantity,amount,rating);

@override
String toString() {
  return 'Cleaning(id: $id, name: $name, quantity: $quantity, amount: $amount, rating: $rating)';
}


}

/// @nodoc
abstract mixin class $CleaningCopyWith<$Res>  {
  factory $CleaningCopyWith(Cleaning value, $Res Function(Cleaning) _then) = _$CleaningCopyWithImpl;
@useResult
$Res call({
 int id, String name, int quantity, int amount, double rating
});




}
/// @nodoc
class _$CleaningCopyWithImpl<$Res>
    implements $CleaningCopyWith<$Res> {
  _$CleaningCopyWithImpl(this._self, this._then);

  final Cleaning _self;
  final $Res Function(Cleaning) _then;

/// Create a copy of Cleaning
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? quantity = null,Object? amount = null,Object? rating = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [Cleaning].
extension CleaningPatterns on Cleaning {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Cleaning value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Cleaning() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Cleaning value)  $default,){
final _that = this;
switch (_that) {
case _Cleaning():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Cleaning value)?  $default,){
final _that = this;
switch (_that) {
case _Cleaning() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int quantity,  int amount,  double rating)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Cleaning() when $default != null:
return $default(_that.id,_that.name,_that.quantity,_that.amount,_that.rating);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int quantity,  int amount,  double rating)  $default,) {final _that = this;
switch (_that) {
case _Cleaning():
return $default(_that.id,_that.name,_that.quantity,_that.amount,_that.rating);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int quantity,  int amount,  double rating)?  $default,) {final _that = this;
switch (_that) {
case _Cleaning() when $default != null:
return $default(_that.id,_that.name,_that.quantity,_that.amount,_that.rating);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Cleaning implements Cleaning {
  const _Cleaning({required this.id, required this.name, required this.quantity, required this.amount, required this.rating});
  factory _Cleaning.fromJson(Map<String, dynamic> json) => _$CleaningFromJson(json);

@override final  int id;
@override final  String name;
@override final  int quantity;
@override final  int amount;
@override final  double rating;

/// Create a copy of Cleaning
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CleaningCopyWith<_Cleaning> get copyWith => __$CleaningCopyWithImpl<_Cleaning>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CleaningToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Cleaning&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.rating, rating) || other.rating == rating));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,quantity,amount,rating);

@override
String toString() {
  return 'Cleaning(id: $id, name: $name, quantity: $quantity, amount: $amount, rating: $rating)';
}


}

/// @nodoc
abstract mixin class _$CleaningCopyWith<$Res> implements $CleaningCopyWith<$Res> {
  factory _$CleaningCopyWith(_Cleaning value, $Res Function(_Cleaning) _then) = __$CleaningCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int quantity, int amount, double rating
});




}
/// @nodoc
class __$CleaningCopyWithImpl<$Res>
    implements _$CleaningCopyWith<$Res> {
  __$CleaningCopyWithImpl(this._self, this._then);

  final _Cleaning _self;
  final $Res Function(_Cleaning) _then;

/// Create a copy of Cleaning
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? quantity = null,Object? amount = null,Object? rating = null,}) {
  return _then(_Cleaning(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
