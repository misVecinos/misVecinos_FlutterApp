import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mis_vecinos_app/core/modules/vecinos/vecinos.dart';
part 'state.freezed.dart';

@freezed
class VecinoState with _$VecinoState {
  const factory VecinoState({
    List<NegocioVecino>? negocios,
    @Default(States.loading) States state,
  }) = _VecinoState;
}

enum States { succes, error, loading }
