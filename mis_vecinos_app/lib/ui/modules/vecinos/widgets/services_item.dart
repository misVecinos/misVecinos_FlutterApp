import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/modules/vecinos/vecinos.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class ServiceCards extends StatelessWidget {
  const ServiceCards({Key? key, required this.vecino}) : super(key: key);
  final NegocioVecino vecino;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Ink(
      height: size.height * .125,
      width: size.width * .9,
      color: c.surface,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              height: size.height * .14,
              width: size.width * .28,
              child: Image.asset(vecino.imagenNegocio, fit: BoxFit.cover),
            ),
          ),
          //
          Container(
            color: c.surface,
            height: size.height * .135,
            width: size.width * .03,
          ),
          //
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: size.width * .02),
                child: Container(
                  color: c.surface,
                  //height: size.height * .055,
                  width: size.width * .5,
                  child: Text(vecino.nombre,
                      style: t.messagesBold,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ),
              ),
              //
              // Padding(
              //   padding: EdgeInsets.only(
              //       left: size.width * .02, top: size.width * .015),
              //   child: SizedBox(
              //     width: size.width * .5,
              //     child: Text(vecino.email,
              //         style: t.messages,
              //         maxLines: 1,
              //         overflow: TextOverflow.ellipsis),
              //   ),
              // ),
              //
              Padding(
                padding: EdgeInsets.only(
                    left: size.width * .02, top: size.width * .015),
                child: SizedBox(
                  width: size.width * .5,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/svg/time.svg',
                          color: c.disabled),
                      SizedBox(
                        width: size.height * 0.01,
                      ),
                      Text(
                        '${vecino.horaEntrada.hour}:00am - ${vecino.horaSalida.hour}:00pm',
                        style: t.messagesBlack,
                      ),
                    ],
                  ),
                ),
              ),

              //
              const Spacer(),
              //
            ],
          ),
          const Spacer(),
          //
          SizedBox(
            height: size.height * .06,
            width: size.width * .05,
            child: SvgPicture.asset('assets/icons/svg/arrow-forward-ios.svg'),
          ),
        ],
      ),
    );
  }
}
