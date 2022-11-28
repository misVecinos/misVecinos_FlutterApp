import 'package:mis_vecinos_app/core/modules/pagos/pago_ok.dart';

import 'repository.dart';

class PagosService {
  final PagosRepository repository;

  PagosService(this.repository);

  // Future<Response<List<News>>> getNews() => repository.getNews();
  List<ViviendaOk> getViviendasOk() => repository.getPagosOk();
}
