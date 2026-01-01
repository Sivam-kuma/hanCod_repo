

// import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hancod/shared/models/cleaning.dart';
// import '../../models/cleaning.dart';

part 'cleaning_state.freezed.dart';

enum CleaningStatus { initial, loading, success, error }

@freezed
abstract class CleaningState with _$CleaningState {
  const factory CleaningState({
    @Default(CleaningStatus.initial) CleaningStatus status,
    @Default([]) List<Cleaning> services,
    String? message,
  }) = _CleaningState;
}

