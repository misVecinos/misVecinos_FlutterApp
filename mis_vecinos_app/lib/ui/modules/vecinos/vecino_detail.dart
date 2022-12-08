import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/modules/vecinos/vecinos.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class VecinoDetail extends StatelessWidget {
  const VecinoDetail({Key? key, required this.vecino}) : super(key: key);
  final NegocioVecino vecino;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              SizedBox(
                height: size.height * 0.25,
                width: size.width,
                child: Image.asset(
                  vecino.imagenNegocio,
                  fit: BoxFit.cover,
                ),
                // child: const Placeholder(),
              ),
              Container(
                height: size.height * 0.25,
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.2,
                    0.5,
                    0.95,
                  ],
                  colors: [
                    c.secondary.withOpacity(0.2),
                    c.secondary.withOpacity(0.6),
                    c.secondary,
                  ],
                )),
              ),
              //
              Padding(
                padding: EdgeInsets.only(
                    left: size.height * 0.025, top: size.height * 0.165),
                child: CircleAvatar(
                  radius: size.height * 0.088,
                  backgroundImage: AssetImage(vecino.imagenEncargado),
                ),
              )
            ],
          ),
          //
          Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.025, top: size.height * 0.025),
            child: Text(
              '${vecino.nombre} ',
              style: t.subtitle,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.025, top: size.height * 0.007),
            child: Text(
              vecino.email,
              style: t.messages,
            ),
          ),

          SizedBox(
            height: size.height * 0.03,
          ),
          //
          Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.025, top: size.height * 0.007),
            child: Text(
              'Información del negocio',
              style: t.messagesBold,
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025,
                  top: size.height * 0.015,
                  bottom: size.height * 0.007),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/svg/name.svg',
                      color: c.disabled),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Encargado Principal:',
                        style: t.messages,
                      ),
                      Text(
                        vecino.encargadoPrincipal,
                        style: t.messages,
                      ),
                    ],
                  ),
                ],
              )),
          //
          Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025,
                  top: size.height * 0.01,
                  bottom: size.height * 0.007),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/svg/workers.svg',
                      color: c.disabled),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trabajadores:',
                        style: t.messages,
                      ),
                      Text(
                        vecino.totalTrabajadores.toString(),
                        style: t.messages,
                      ),
                    ],
                  ),
                ],
              )),
          //
          Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025,
                  top: size.height * 0.01,
                  bottom: size.height * 0.007),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/svg/time.svg',
                      color: c.disabled),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Horario:',
                        style: t.messages,
                      ),
                      Text(
                        '${vecino.horaEntrada.hour}AM - ${vecino.horaSalida.hour}PM',
                        style: t.messages,
                      ),
                    ],
                  ),
                ],
              )),
          //
          Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.025, top: size.height * 0.03),
            child: Text(
              'Contacto',
              style: t.messagesBold,
            ),
          ),
          //
          Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025,
                  top: size.height * 0.01,
                  bottom: size.height * 0.007),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/svg/location.svg',
                      color: c.error),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dirección:',
                        style: t.messages,
                      ),
                      SizedBox(
                        width: size.width * 0.8,
                        child: Text(
                          vecino.direccion,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: t.messages,
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          //
          Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.025,
                  top: size.height * 0.01,
                  bottom: size.height * 0.007),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/svg/whatsapp.svg',
                      color: c.OK),
                  SizedBox(
                    width: size.height * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teléfono:',
                        style: t.messages,
                      ),
                      Text(
                        vecino.telefono.toString(),
                        style: t.messages,
                      ),
                    ],
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
