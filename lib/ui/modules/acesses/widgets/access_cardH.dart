import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_route_animator/page_route_animator.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import '../../home/widgets/utils.dart';
import '../acces_form.dart';

class AccesCardH extends StatelessWidget {
  const AccesCardH(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isPerson,
      required this.isTemporal});
  final String title;
  final String subtitle;
  final bool isPerson;
  final bool isTemporal;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (isPerson == true && isTemporal == true ||
                isPerson == false && isTemporal == true) {
              Navigator.push(
                  context,
                  PageRouteAnimator(
                    child: const AccesForm(),
                    routeAnimation: RouteAnimation.rightToLeft,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 400),
                    reverseDuration: const Duration(milliseconds: 400),
                  ));
            } else {
              //
            }
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
              height: size.height * .17,
              width: size.width * .92,
              child: Row(
                children: [
                  Image.asset(
                    title == 'Temporal'
                        ? 'assets/icons/qr.png'
                        : 'assets/icons/card.png',
                    height: title == 'Temporal'
                        ? size.height * .1
                        : size.height * .08,
                    width: size.width * .25,
                  ),
                  Center(
                    child: Container(
                      color: c.surface,
                      height: size.height * .15,
                      width: size.width * .56,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(title, style: t.subtitle),
                              SvgPicture.asset(
                                  'assets/icons/svg/arrow-forward-ios.svg',
                                  height: size.height * 0.025,
                                  color: c.black)
                            ],
                          ),
                          Text(subtitle,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: t.messages),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (title == 'Temporal') {
                                msjPopup(
                                    context,
                                    'Acceso temporal',
                                    isPerson == true
                                        ? 'Este acceso te permite invitar a una persona o familiar por tiempo definido, es decir, con fecha de entrada y fecha de salida.'
                                        : 'Este acceso te permite invitar a un trabajador externo por tiempo definido, es decir, con fecha de entrada y fecha de salida.');
                              } else {
                                msjPopup(
                                    context,
                                    'Acceso permanente',
                                    isPerson == true
                                        ? 'Este acceso te permite invitar a una persona o familiar por tiempo indefinido, es decir, con fecha de entrada pero sin fecha de salida.'
                                        : 'Este acceso te permite invitar a un trabajador externo por tiempo indefinido, es decir, con fecha de entrada pero sin fecha de salida.');
                              }
                            },
                            child:
                                Text('Más info.', style: t.messagesBlueLight),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
