import 'vecinos.dart';

class VecinoService {
  List<NegocioVecino> negocios = [
    NegocioVecino(
        imagenNegocio: 'assets/images/servicios/beto2.jpg',
        imagenEncargado: 'assets/images/servicios/beto.jpg',
        id: 0,
        nombre: 'Vidrieria BETO',
        email: 'vidrieriabeto@gmail.com',
        encargadoPrincipal: 'Beto',
        totalTrabajadores: 4,
        horaEntrada: DateTime(2022, 12, 2, 9, 0),
        horaSalida: DateTime(2022, 12, 2, 6, 0),
        direccion:
            'Av Miguel Hidalgo y Costilla, Heroica Tenango de Arista, 52300 Méx, México.',
        telefono: 7227644710),
    NegocioVecino(
        imagenNegocio: 'assets/images/servicios/pintores.jpg',
        imagenEncargado: 'assets/images/servicios/pintores.jpg',
        id: 1,
        nombre: 'Pintores',
        email: 'Marcosalvares@gmail.com',
        encargadoPrincipal: 'Marco Salvares',
        totalTrabajadores: 6,
        horaEntrada: DateTime(2022, 12, 2, 9, 0),
        horaSalida: DateTime(2022, 12, 2, 6, 0),
        direccion:
            'Av Miguel Hidalgo y Costilla, Heroica Tenango de Arista, 52300 Méx, México.',
        telefono: 7228257545),
    NegocioVecino(
        imagenNegocio: 'assets/images/servicios/b1.jpg',
        imagenEncargado: 'assets/images/servicios/p1.jpg',
        id: 2,
        nombre: 'Cerrajeria Del Valle',
        email: 'cerajeriadelvalle@gmail.com',
        encargadoPrincipal: 'Don Del Valle',
        totalTrabajadores: 5,
        horaEntrada: DateTime(2022, 12, 2, 9, 0),
        horaSalida: DateTime(2022, 12, 2, 6, 0),
        direccion:
            'Av Miguel Hidalgo y Costilla, Heroica Tenango de Arista, 52300 Méx, México.',
        telefono: 7223449378),
    NegocioVecino(
        imagenNegocio: 'assets/images/servicios/vidrio2.jpg',
        imagenEncargado: 'assets/images/servicios/vidrio.jpg',
        id: 3,
        nombre: 'Vidrio y Aluminio "Guevara"',
        email: 'guevara01@gmail.com',
        encargadoPrincipal: 'Don Guevara',
        totalTrabajadores: 5,
        horaEntrada: DateTime(2022, 12, 2, 9, 0),
        horaSalida: DateTime(2022, 12, 2, 6, 0),
        direccion:
            'Av Miguel Hidalgo y Costilla, Heroica Tenango de Arista, 52300 Méx, México.',
        telefono: 7227658268),
    NegocioVecino(
        imagenNegocio: 'assets/images/servicios/herreria2.jpg',
        imagenEncargado: 'assets/images/servicios/herreria.jpg',
        id: 4,
        nombre: 'Herrería y Mantenimiento "Bet\'os"',
        email: 'herreria.betos2022@gmail.com',
        encargadoPrincipal: 'Don Betos',
        totalTrabajadores: 3,
        horaEntrada: DateTime(2022, 12, 2, 9, 0),
        horaSalida: DateTime(2022, 12, 2, 6, 0),
        direccion:
            'Av Miguel Hidalgo y Costilla, Heroica Tenango de Arista, 52300 Méx, México.',
        telefono: 7225949769),
    NegocioVecino(
        imagenNegocio: 'assets/images/servicios/materiales2.jpg',
        imagenEncargado: 'assets/images/servicios/materiales.jpg',
        id: 5,
        nombre: 'Materiales Santa Monica"',
        email: 'Santamonica2022@gmail.com',
        encargadoPrincipal: '',
        totalTrabajadores: 4,
        horaEntrada: DateTime(2022, 12, 2, 9, 0),
        horaSalida: DateTime(2022, 12, 2, 6, 0),
        direccion:
            'Av Miguel Hidalgo y Costilla, Heroica Tenango de Arista, 52300 Méx, México.',
        telefono: 7224213458),
  ];

  List<NegocioVecino> getNegocios() {
    return negocios;
  }
}
