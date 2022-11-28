// import 'package:dio/dio.dart';
// import 'package:retrofit/retrofit.dart';
// import 'news.dart';

// part 'repository.g.dart';

//Uso del paquete Retrofit para la conexión con un servicio temporal que emula la api real
//@RestApi(baseUrl: 'https://6347ea26db76843976b5a796.mockapi.io/')

abstract class NewsRest {
  //factory NewsRest(Dio dio, {String baseUrl}) = _NewsRest;

  //@GET("/Noticias")
  //Future<List<News>> getNews();
}

class NewsRepository {
  final NewsRest rest;
  NewsRepository(this.rest);

  // Future<Response<List<News>>> getNews() {
  // Enlazar con la API y traer las noticias
  // Future<List<NegocioVecino>> getNews() async {
  //   //final response = await rest.getNews();

  //   //return response;
  // }
}
