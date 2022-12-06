import 'news.dart';

class NewsService {
  final List<New> newsList = [
    New(
        imagen: 'assets/images/chapa.jpg',
        titulo: 'Nueva Chapa',
        noticia:
            'Buena tarde vecinos, Solo para comentarles que se estará instalando Ia nueva chapa en un rato más, Se estará también entregando una copia por casa esta misma tarde para que por favor nos hagan favor de pasar por su copia. Quien necesite copia adicionales, tendrán un coto de 20 pesos y podrán pasar a dejar su dinero con Cesar a partir de hoy y hasta el Miércoles por la tarde.',
        fechaCreacion: DateTime(2022, 2, 15),
        id: 0),
    New(
        imagen: 'assets/images/padre.jpg',
        titulo: 'Feliz Dia del Padre!!!',
        noticia:
            'Muchas felicidades a todos los papás que pasen un bonito dia.',
        fechaCreacion: DateTime(2022, 06, 19),
        id: 1),
    New(
        imagen: 'assets/images/predial.jpg',
        titulo: 'Pago del predial',
        noticia:
            'Buenos día vecinos, les dejo toda la información, échale un ojo.',
        fechaCreacion: DateTime(2022, 08, 13),
        id: 1),
  ];

  List<New> getNews() {
    return newsList;
  }
}
