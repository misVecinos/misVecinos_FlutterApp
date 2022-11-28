import 'pago_atraso.dart';
import 'pago_ok.dart';

class PagosRepository {
  // Enlazar con la API y traer las noticias
  List<ViviendaOk> getPagosOk() {
    final alcorriente = List.generate(
        20, (index) => ViviendaOk(nombreCasa: 'Casa $index', id: index));

    return alcorriente;
  }

  List<ViviendaAtraso> getPagosAdeudos() {
    final atraso = List.generate(
        6,
        (index) => ViviendaAtraso(
            nombreCasa: 'Casa $index', id: index, mesesAtraso: 3));

    atraso.add(ViviendaAtraso(nombreCasa: 'Casa 26', mesesAtraso: 1, id: 26));

    return atraso;
  }
}
