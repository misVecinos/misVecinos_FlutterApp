// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../login/widgets/splash_image.dart';
import '../main/main_page.dart';
import 'controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      final bool? session = prefs.getBool('isLogged');

      Future.delayed(const Duration(milliseconds: 3800)).whenComplete(() async {
        if (session != true) {
          await Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, animation, __) => FadeTransition(
                        opacity: animation,
                        child: const SplashImage(),
                        // child: const LoginPage(),
                      )));
        } else {
          await Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, animation, __) => FadeTransition(
                        opacity: animation,
                        child: const MainPage(),
                      )));
        }
        //
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(children: [
        Stack(
          children: [
            //     SizedBox(
            //   height: size.height * .35,
            // ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.2),
              child: Center(
                child: Container(
                  color: c.surface,
                  height: size.height * .7,
                  width: size.width * .9,
                  child: Lottie.asset(
                    'assets/icons/lottie/home2.json',
                    repeat: false,
                  ),
                ),
              ),
            ),
            //
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.39),
              child: FadeIn(
                  delay: const Duration(milliseconds: 2000),
                  duration: const Duration(seconds: 4),
                  child: Padding(
                      padding: EdgeInsets.all(size.height * 0.047),
                      child: Center(
                        child: SizedBox(
                            child: FittedBox(
                          fit: BoxFit.cover,
                          child: AnimatedSwitcher(
                            switchInCurve: Curves.easeIn,
                            switchOutCurve: Curves.easeOut,
                            duration: const Duration(milliseconds: 2000),
                            child: ref.watch(color) == false
                                ? Text('Mis Vecinos', style: t.titleApp)
                                : TweenAnimationBuilder<Color?>(
                                    tween: ColorTween(
                                        begin: c.black, end: c.surface),
                                    duration:
                                        const Duration(milliseconds: 2000),
                                    builder: (context, value, _) {
                                      return Text('Mis Vecinos',
                                          style: t.titleApp);
                                    }),
                          ),
                        )),
                      ))),
            )
          ],
        ),
//
      ]),
    );
  } //

}
