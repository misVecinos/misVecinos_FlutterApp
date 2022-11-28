import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/core/modules/vecinos/vecinos.dart';
import 'package:mis_vecinos_app/ui/modules/vecinos/vecino_detail.dart';

import '../../utils/text_styles.dart';
import 'services_item.dart';

class VecinosPage extends ConsumerStatefulWidget {
  const VecinosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<VecinosPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    List<NegocioVecino> negocios = [
      NegocioVecino(
          imagenNegocio: 'assets/images/5.jpeg',
          imagenEncargado: 'assets/images/2.jpeg',
          id: 0,
          nombre: 'Cerrajeria DelValle',
          email: 'emailOnline.ccom',
          encargadoPrincipal: 'Don Chuy Morales',
          totalTrabajadores: 5,
          horaEntrada: 8.00,
          horaSalida: 9.00,
          direccion: '52306, Tenango de Arista, Edomex, México.',
          telefono: 4921234567),
      NegocioVecino(
          imagenNegocio: 'assets/images/4.jpeg',
          imagenEncargado: 'assets/images/2.jpeg',
          id: 0,
          nombre: 'Vidrieria Pepe',
          email: 'emailOnline.ccom',
          encargadoPrincipal: 'Don Chuy Morales',
          totalTrabajadores: 5,
          horaEntrada: 8.00,
          horaSalida: 9.00,
          direccion: '52306, Tenango de Arista, Edomex, México.',
          telefono: 4921234567),
      NegocioVecino(
          imagenNegocio: 'assets/images/3.jpeg',
          imagenEncargado: 'assets/images/2.jpeg',
          id: 0,
          nombre: 'Lavanderia Garcia',
          email: 'emailOnline.ccom',
          encargadoPrincipal: 'Don Chuy Morales',
          totalTrabajadores: 5,
          horaEntrada: 8.00,
          horaSalida: 9.00,
          direccion: '52306, Tenango de Arista, Edomex, México.',
          telefono: 4921234567),
      NegocioVecino(
          imagenNegocio: 'assets/images/1.jpeg',
          imagenEncargado: 'assets/images/2.jpeg',
          id: 0,
          nombre: 'Recauderia Felix',
          email: 'emailOnline.ccom',
          encargadoPrincipal: 'Don Chuy Morales',
          totalTrabajadores: 5,
          horaEntrada: 8.00,
          horaSalida: 9.00,
          direccion: '52306, Tenango de Arista, Edomex, México.',
          telefono: 4921234567),
    ];

    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
          left: size.height * 0.025,
          top: size.height * 0.025,
          right: size.height * 0.025),
      children: [
        Text('Servicios', style: t.title),
        Text('Servicios que ofrecen tus vecinos:', style: t.messages),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: negocios.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return VecinoDetail(
                        vecino: negocios[index],
                      );
                    }));
                  },
                  child: ServiceCards(
                    image: negocios[index].imagenNegocio,
                    email: negocios[index].email,
                    title: negocios[index].nombre,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
