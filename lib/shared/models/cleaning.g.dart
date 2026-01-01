// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cleaning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Cleaning _$CleaningFromJson(Map<String, dynamic> json) => _Cleaning(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  quantity: (json['quantity'] as num).toInt(),
  amount: (json['amount'] as num).toInt(),
  rating: (json['rating'] as num).toDouble(),
);

Map<String, dynamic> _$CleaningToJson(_Cleaning instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'quantity': instance.quantity,
  'amount': instance.amount,
  'rating': instance.rating,
};
