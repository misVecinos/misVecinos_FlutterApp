import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/documents/documents.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/transparency.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogged', true);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: size.height * 0.25,
              width: size.width,
              child: Image.asset(
                'assets/images/1.jpeg',
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
            )
          ],
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
                  'assets/icons/svg/round-home.svg',
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
                    'assets/icons/svg/location.svg',
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

            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Transparency();
                }));
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
                  width: size.width * .85,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/money.png',
                        height: size.height * .1,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Cuentas Claras', style: t.subtitle),
                                  SvgPicture.asset(
                                      'assets/icons/svg/arrow-forward-ios.svg',
                                      color: c.black)
                                ],
                              ),
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
            ),

            GestureDetector(
              onTap: () {
                //Comprobar si es primera ver que ingresa va a info
                //Si no, va a recicle

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Recycle();
                }));
              },
              child: Padding(
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
                            Image.asset(
                              'assets/icons/recycle.png',
                              height: size.height * .1,
                              width: size.width * .25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Reciclaje', style: t.subtitle),
                                SvgPicture.asset(
                                    'assets/icons/svg/arrow-forward-ios.svg',
                                    color: c.black)
                              ],
                            ),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const Documents();
                        }));
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
                          height: size.height * .2,
                          width: size.width * .4125,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(top: size.height * 0.02),
                                child: Image.asset(
                                  'assets/icons/document.png',
                                  height: size.height * .1,
                                  width: size.width * .25,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Documentos', style: t.subtitle),
                                  SvgPicture.asset(
                                      'assets/icons/svg/arrow-forward-ios.svg',
                                      color: c.black)
                                ],
                              ),
                              Text('3 sin Leer', style: t.messages),
                            ],
                          ),
                          // child: const Placeholder(),
                        ),
                      ),
                    ),
                    //
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
