// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/news/news_page.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_info.dart';
import 'package:page_route_animator/page_route_animator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../recycle/recycle.dart';
import '../transparency/transparency.dart';
import 'composta.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<HomePage> {
  bool? recycle;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogged', true);
      recycle = prefs.getBool('isRecycing');
    });
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      children: [
        Stack(
          children: [
            SizedBox(
              height: size.height * 0.25,
              width: size.width,
              child: Image.asset(
                'assets/images/laJoya.jpg',
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
                  0.3,
                  0.6,
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
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
              left: size.height * 0.015, right: size.height * 0.015),
          children: [
            //
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: size.height * 0.007),
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
                bottom: size.height * 0.015,
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
                // Navigator.push(
                //     context,
                //     PageRouteBuilder(
                //         pageBuilder: (_, animation, __) => FadeTransition(
                //               opacity: animation,
                //               child: const Transparency(),
                //             )));

                Navigator.push(
                    context,
                    PageRouteAnimator(
                      child: const Transparency(),
                      routeAnimation: RouteAnimation.rightToLeft,
                      curve: Curves.fastOutSlowIn,
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
                                  Text('Transparencia', style: t.subtitle),
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
              onTap: () async {
                //Comprobar si es primera ver que ingresa va a info
                //Si no, va a recicle

                if (recycle == true) {
                  // Navigator.push(
                  //     context,
                  //     PageRouteBuilder(
                  //         pageBuilder: (_, animation, __) => FadeTransition(
                  //               opacity: animation,
                  //               child: const RecycleInfo(),
                  //             )));

                  await Navigator.push(
                      context,
                      PageRouteAnimator(
                        child: const Recycle(),
                        routeAnimation: RouteAnimation.rightToLeftWithFade,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 400),
                        reverseDuration: const Duration(milliseconds: 400),
                      ));
                } else {
                  Navigator.push(
                      context,
                      PageRouteAnimator(
                        child: const RecycleInfo(),
                        routeAnimation: RouteAnimation.rightToLeftWithFade,
                        curve: Curves.fastOutSlowIn,
                        duration: const Duration(milliseconds: 400),
                        reverseDuration: const Duration(milliseconds: 400),
                      ));
                }
                //
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
                        // Navigator.push(
                        //     context,
                        //     PageRouteBuilder(
                        //         pageBuilder: (_, animation, __) =>
                        //             FadeTransition(
                        //               opacity: animation,
                        //               child: const Documents(),
                        //             )));

                        Navigator.push(
                            context,
                            PageRouteAnimator(
                              child: const NewsPage(),
                              routeAnimation: RouteAnimation.rightToLeft,
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 400),
                              reverseDuration:
                                  const Duration(milliseconds: 400),
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
                                  Text('Noticias', style: t.subtitle),
                                  SvgPicture.asset(
                                      'assets/icons/svg/arrow-forward-ios.svg',
                                      color: c.black)
                                ],
                              ),
                              Text('1 sin Leer', style: t.messages),
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
            ),
            //
            GestureDetector(
              onTap: () {
                showCompostaMenu(
                    context,
                    size,
                    name,
                    phone,
                    email,
                    'Ingresa tu nombre completo: ',
                    'Ingresa tu teléfono: ',
                    'Ingresa tu correo electrónico: ');
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.015, bottom: size.height * 0.06),
                child: Align(
                  child: Container(
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/images/composta.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                            color: c.disabled.withOpacity(0.4),
                            blurRadius: 20.0,
                            offset: const Offset(1, 1))
                      ],
                      color: const Color(0xffFDFDFD),
                    ),
                    height: size.height * .09,
                    width: size.width * .5,
                  ),
                ),
              ),
            ),
            //
          ],
        ),
      ],
    );
  }
}
