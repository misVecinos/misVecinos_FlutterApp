import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/acesses/worker.dart';
import 'package:mis_vecinos_app/ui/modules/home/widgets/utils.dart';
import 'package:page_route_animator/page_route_animator.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import '../person.dart';

class AccesCardV extends StatelessWidget {
  const AccesCardV({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageRouteAnimator(
                  child: title == 'Personas' ? const Person() : const Worker(),
                  routeAnimation: RouteAnimation.rightToLeft,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 400),
                  reverseDuration: const Duration(milliseconds: 400),
                ));
          },
          child: Align(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                      color: c.disabled.withOpacity(0.4),
                      blurRadius: 20.0,
                      offset: const Offset(1, 1))
                ],
                color: const Color(0xffFDFDFD),
              ),
              height: size.height * .32,
              width: size.width * .435,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.01),
                    child: Image.asset(
                        title == 'Personas'
                            ? 'assets/icons/avatar.png'
                            : 'assets/icons/housekeeper.png',
                        height: size.height * .11,
                        width: size.width * .25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: t.subtitle),
                      SvgPicture.asset('assets/icons/svg/arrow-forward-ios.svg',
                          height: size.height * 0.025, color: c.black)
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.05, right: size.width * 0.05),
                    child: Text(
                        title == 'Personas'
                            ? 'Acceso para un amigo o familiar.'
                            : 'Acceso para trabajadores externos al vecindario.',
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: t.messages),
                  ),
                ],
              ),
            ),
          ),
        ),
        //
        Padding(
          padding:
              EdgeInsets.only(left: size.width / 8, top: size.height * 0.27),
          child: Center(
            child: GestureDetector(
              onTap: () {
                title == 'Personas'
                    ? msjPopup(context, 'Acceso a personas',
                        'Desde éste apartado puedes concederle acceso a tus amigos o familiares para ingresar a tu vecindario.')
                    : msjPopup(context, 'Acceso a trabajadores',
                        'Desde éste apartado puedes concederle acceso a trabajadores externos para ingresar a tu vecindario.');
              },
              child: Text('Más info.', style: t.messagesBlueLight),
            ),
          ),
        )
      ],
    );
  }
}
