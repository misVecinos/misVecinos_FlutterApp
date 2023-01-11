// ignore_for_file: use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/acesses/access.dart';
import 'package:mis_vecinos_app/ui/modules/home/widgets/back_image.dart';
import 'package:mis_vecinos_app/ui/modules/news/news_page.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_info.dart';
import 'package:mis_vecinos_app/ui/modules/sponsors/controller.dart';
import 'package:page_route_animator/page_route_animator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../recycle/recycle.dart';
import '../sponsors/sponsor_widget.dart';
import '../transparency/transparency.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<HomePage> {
  bool? recycle;

  session() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLogged', true);
      //
    });
  }

  checkRecycle() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        recycle = prefs.getBool('isRecycing');
      });
      setState(() {});
      //
    });
  }

  @override
  void initState() {
    super.initState();
    session();
    checkRecycle();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawerEnableOpenDragGesture: false,
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

              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    PageRouteAnimator(
                      child: const Acess(),
                      routeAnimation: RouteAnimation.rightToLeft,
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 400),
                      reverseDuration: const Duration(milliseconds: 400),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.84,
                    top: size.height * 0.172,
                  ),
                  child: Material(
                    shape: const CircleBorder(side: BorderSide.none),
                    elevation: 4,
                    child: CircleAvatar(
                      backgroundColor: const Color(0xffFDFDFD),
                      radius: size.height * 0.035,
                      child: Icon(
                        Icons.add,
                        color: c.primary,
                      ),
                    ),
                  ),
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
              AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  switchInCurve: Curves.fastLinearToSlowEaseIn,
                  switchOutCurve: Curves.ease,
                  child: ref.watch(sponsors).isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                            bottom: size.height * 0.0156,
                          ),
                          child: SizedBox(
                              width: size.width,
                              height: size.height * 0.14,
                              child: CarouselSlider.builder(
                                  options: CarouselOptions(
                                    autoPlay: true,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 1,
                                  ),
                                  itemCount: ref.watch(sponsors).length,
                                  itemBuilder: (BuildContext context,
                                          int itemIndex, int pageViewIndex) =>
                                      SponsorWidget(
                                          asset: ref
                                              .watch(sponsors)[itemIndex]
                                              .imagen,
                                          title: ref
                                              .watch(sponsors)[itemIndex]
                                              .titulo,
                                          content: ref
                                              .watch(sponsors)[itemIndex]
                                              .contenido,
                                          index: itemIndex,
                                          color: Colors.primaries.reversed
                                              .toList()[itemIndex]
                                              .withOpacity(0.25)))
                              //
                              ),
                        )
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
                  //     MaterialPageRoute(builder: (context) {
                  //   return const Transparency();
                  // }));
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
                                    'Mira la administración del dinero de tu comunidad, qué ingresa y egresa.',
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
                onTap: () {
                  //Comprobar si es primera ver que ingresa va a info
                  //Si no, va a recicle
                  checkRecycle();
                  //WidgetsBinding.instance.addPostFrameCallback((_) {
                  //
                  if (recycle != true) {
                    Navigator.push(
                        context,
                        PageRouteAnimator(
                          child: const RecycleInfo(),
                          routeAnimation: RouteAnimation.rightToLeftWithFade,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 400),
                          reverseDuration: const Duration(milliseconds: 400),
                        ));
                  } else {
                    Navigator.push(
                        context,
                        PageRouteAnimator(
                          child: const Recycle(),
                          routeAnimation: RouteAnimation.rightToLeftWithFade,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(milliseconds: 400),
                          reverseDuration: const Duration(milliseconds: 400),
                        ));
                  }
                  // });
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
                                child: Text('Ayuda al planeta.',
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
                                      left: size.width * 0.02,
                                      right: size.width * 0.02),
                                  child: Text('Infórmate.',
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
