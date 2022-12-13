import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mis_vecinos_app/core/modules/pagos/pago_ok.dart';
import '../../../core/modules/pagos/pago_atraso.dart';
part 'state.freezed.dart';

@freezed
class PagosState with _$PagosState {
  const factory PagosState({
    List<ViviendaAtraso>? atrasadas,
    List<ViviendaAtraso>? atrasadasMas2Meses,
    List<ViviendaOk>? alCorriente,
    @Default(States.loading) States state,
  }) = _PagosState;
}

enum States { succes, error, loading }
