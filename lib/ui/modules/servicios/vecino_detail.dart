import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

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
      appBar: AppBar(
        actions: [
          Icon(
            Icons.abc,
            color: c.surface,
          ),
        ],
        backgroundColor: c.surface,
        elevation: 0,
        centerTitle: false,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.25,
            width: size.width,
            child: Image.asset(
              vecino.imagenNegocio,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.235),
            child: Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Container(
                  //height: size.height,
                  width: size.width,
                  color: c.secondary,

                  child: ListView(
                    padding: const EdgeInsets.only(top: 0),
                    children: [
                      //
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.height * 0.025, top: size.height * 0.03),
                        child: Text(
                          '${vecino.nombre} ',
                          style: t.subtitle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.height * 0.025,
                            top: size.height * 0.007),
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
                            left: size.height * 0.025,
                            top: size.height * 0.007),
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
                              CircleAvatar(
                                radius: size.height * 0.035,
                                backgroundImage:
                                    AssetImage(vecino.imagenEncargado),
                              ),
                              SizedBox(
                                width: size.height * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Encargado Principal:',
                                    style: t.messagesBlack,
                                  ),
                                  Text(
                                    vecino.encargadoPrincipal,
                                    style: t.messagesBlack,
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
                                    style: t.messagesBlack,
                                  ),
                                  Text(
                                    vecino.totalTrabajadores.toString(),
                                    style: t.messagesBlack,
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
                                    style: t.messagesBlack,
                                  ),
                                  Text(
                                    '${vecino.horaEntrada.hour}AM - ${vecino.horaSalida.hour}PM',
                                    style: t.messagesBlack,
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
                                    style: t.messagesBlack,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.7,
                                    child: Text(
                                      vecino.direccion,
                                      maxLines: 6,
                                      overflow: TextOverflow.ellipsis,
                                      style: t.messagesBlack,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () => UrlLauncher.launchUrl(Uri.parse(
                                    'https://goo.gl/maps/VsuqjWvXTafBPENy7')),
                                icon: const Icon(Icons.ios_share),
                              )
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
                                    style: t.messagesBlack,
                                  ),
                                  Text(
                                    vecino.telefono.toString(),
                                    style: t.messagesBlack,
                                  ),
                                ],
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
