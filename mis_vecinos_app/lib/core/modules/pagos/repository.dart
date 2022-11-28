// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'news.dart';

// part 'repository.g.dart';

//Uso del paquete Retrofit para la conexión con un servicio temporal que emula la api real
//@RestApi(baseUrl: 'https://6347ea26db76843976b5a796.mockapi.io/')

import 'pago_atraso.dart';
import 'pago_ok.dart';

abstract class PagosRest {
  //factory NewsRest(Dio dio, {String baseUrl}) = _NewsRest;

  //@GET("/Noticias")
  //Future<List<News>> getNews();
}

class PagosRepository {
  final PagosRest rest;
  PagosRepository(this.rest);

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
            nombreCasa: 'Casa $index', id: index, tiempoAtraso: '6 meses.'));

    return atraso;
  }
}
