// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mis_vecinos_app/core/modules/recycle/history.dart';
part 'state.freezed.dart';

@freezed
class RecycleState with _$RecycleState {
  const factory RecycleState({
    History? listHistory,
    @Default(States.loading) States state,
  }) = _RecycleState;
}

enum States { succes, error, loading }
