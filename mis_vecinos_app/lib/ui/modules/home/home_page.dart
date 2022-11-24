import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: size.height * 0.25,
          width: size.width,
          child: const Placeholder(),
        ),
        //
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
              left: size.height * 0.015, right: size.height * 0.015),
          children: [
            //
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.01, bottom: size.height * 0.007),
              child: Row(children: [
                SvgPicture.asset(
                  'assets/icons/round-home.svg',
                  color: c.primary,
                  height: size.height * 0.045,
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.015),
                  child: Text('Casa 8.', style: t.title),
                ),
              ]),
            ),

            //
            Padding(
              padding: EdgeInsets.only(
                bottom: size.height * 0.04,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/location.svg',
                    color: c.disabled,
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.015),
                    child: Text('La Joya, Toluca.', style: t.messages),
                  ),
                ],
              ),
            ),
            //

            Align(
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
                width: size.width * .85,
                child: Row(
                  children: [
                    Lottie.asset(
                      'assets/icons/lottie/data.json',
                      repeat: false,
                      height: size.height * .12,
                      width: size.width * .25,
                    ),
                    Center(
                      child: Container(
                        color: c.surface,
                        height: size.height * .13,
                        width: size.width * .56,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cuentas Claras', style: t.subtitle),
                            Text(
                                'Mira cómo se administra el dinero de tu comunidad, que ingresa y egresa.',
                                style: t.messages),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
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
                      height: size.height * .2,
                      width: size.width * .4125,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Lottie.asset(
                            'assets/icons/lottie/re.json',
                            repeat: false,
                            height: size.height * .1,
                            width: size.width * .25,
                          ),
                          Text('Reciclaje', style: t.subtitle),
                          Text('10 veces este mes.', style: t.messages),
                        ],
                      ),
                      // child: const Placeholder(),
                    ),
                  ),
                  //
                  SizedBox(
                    height: 2,
                    width: size.height * 0.015,
                  ),
                  //
                  Align(
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
                      height: size.height * .2,
                      width: size.width * .4125,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: size.height * 0.02),
                            child: Lottie.asset(
                              'assets/icons/lottie/doc3.json',
                              repeat: false,
                              height: size.height * .1,
                              width: size.width * .25,
                            ),
                          ),
                          Text('Documentos', style: t.subtitle),
                          Text('3 sin Leer', style: t.messages),
                        ],
                      ),
                      // child: const Placeholder(),
                    ),
                  ),
                  //
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
