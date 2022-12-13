// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/home/widgets/back_image.dart';
import 'package:mis_vecinos_app/ui/modules/news/news_page.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_info.dart';
import 'package:mis_vecinos_app/ui/modules/sponsors/controller.dart';
import 'package:mis_vecinos_app/ui/modules/sponsors/sponsor_widget.dart';
import 'package:page_route_animator/page_route_animator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../recycle/recycle.dart';
import '../transparency/transparency.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<HomePage> {
  bool? recycle;

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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const BackgroundImage(),
              //

              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.17,
                    bottom: size.height * 0.007,
                    left: size.height * 0.015),
                child: Row(children: [
                  SvgPicture.asset(
                    'assets/icons/svg/round-home.svg',
                    color: c.primary,
                    height: size.height * 0.045,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.015,
                    ),
                    child: Text('Casa 8.', style: t.title),
                  ),
                ]),
              ),

              //
              Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.215,
                  left: size.height * 0.015,
                  bottom: size.height * 0.01,
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
                      child: Text('La Joya, Toluca.',
                          style: t.messages,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
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

              //

              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  switchInCurve: Curves.fastLinearToSlowEaseIn,
                  switchOutCurve: Curves.ease,
                  child: ref.watch(sponsor) == true
                      ? const SponsorWidget()
                      : Container()),

              GestureDetector(
                onTap: () {
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
                    height: size.height * .15,
                    width: size.width * .92,
                    // height: size.height * .17,
                    // width: size.width * .85,
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
                                        height: size.height * 0.025,
                                        color: c.black)
                                  ],
                                ),
                                Text(
                                    'Mira cómo se administra el dinero de tu comunidad, qué ingresa y egresa.',
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
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
                  padding: EdgeInsets.only(top: size.height * 0.015),
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
                          height: size.height * .18,
                          // width: size.width * .4125,
                          width: size.width * .4475,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/recycle.png',
                                height: size.height * .09,
                                width: size.width * .25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Reciclaje', style: t.subtitle),
                                  SvgPicture.asset(
                                      'assets/icons/svg/arrow-forward-ios.svg',
                                      height: size.height * 0.025,
                                      color: c.black)
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.05,
                                    right: size.width * 0.05),
                                child: Text('2 veces este mes.',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: t.messages),
                              ),
                            ],
                          ),
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
                            height: size.height * .18,
                            width: size.width * .44475,
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.01),
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
                                        height: size.height * 0.025,
                                        color: c.black)
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.05,
                                      right: size.width * 0.05),
                                  child: Text('1 sin leer.',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: t.messages),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //
                    ],
                  ),
                ),
              ),
              //
              SizedBox(
                height: size.height * 0.1,
                width: size.width,
              ),

              //
            ],
          ),
        ],
      ),
    );
  }
}
