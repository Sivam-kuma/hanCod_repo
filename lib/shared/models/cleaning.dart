

import 'package:freezed_annotation/freezed_annotation.dart';

part 'cleaning.freezed.dart';
part 'cleaning.g.dart';

@freezed
abstract class Cleaning with _$Cleaning {
  const factory Cleaning({
    required int id,
    required String name,
    required int quantity,
    required int amount,
    required double rating,
  }) = _Cleaning;

  factory Cleaning.fromJson(Map<String, dynamic> json) =>
      _$CleaningFromJson(json);
}

