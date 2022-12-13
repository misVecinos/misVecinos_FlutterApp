// ignore_for_file: use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mis_vecinos_app/ui/modules/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../main/main_page.dart';
import 'controller.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    controller.stop();

    final animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutCubic);
    scaleAnimation = Tween<double>(begin: 2.5, end: 900).animate(animation);

    Future.delayed(const Duration(milliseconds: 4500)).whenComplete(() {
      //  ref.watch(color) == false
      ref.read(color.notifier).forward();
      controller.forward();
      return;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      final bool? session = prefs.getBool('isLogged');

      Future.delayed(const Duration(milliseconds: 5100)).whenComplete(() async {
        if (session != true) {
          await Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, animation, __) => FadeTransition(
                        opacity: animation,
                        child: const LoginPage(),
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
    controller.dispose();
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
              padding: EdgeInsets.only(top: size.height * 0.15),
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
              padding: EdgeInsets.only(
                  top: size.height * 0.39, left: size.width * 0.38),
              child: FadeIn(
                  delay: const Duration(milliseconds: 2000),
                  duration: const Duration(seconds: 4),
                  child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return Transform.scale(
                            scale: scaleAnimation.value,
                            child: Padding(
                                padding: EdgeInsets.all(size.height * 0.01),
                                child: SizedBox(
                                    child: FittedBox(
                                  fit: BoxFit.cover,
                                  child: Center(
                                    child: AnimatedSwitcher(
                                      switchInCurve: Curves.easeIn,
                                      switchOutCurve: Curves.easeOut,
                                      duration:
                                          const Duration(milliseconds: 2000),
                                      child: ref.watch(color) == false
                                          ? const Text('MisVecinos',
                                              style: TextStyle(
                                                  fontFamily: 'Visby CFH',
                                                  color: Colors.black
                                                  //fontSize: scaleAnimation.value,
                                                  ))
                                          : TweenAnimationBuilder<Color?>(
                                              tween: ColorTween(
                                                  begin: c.black,
                                                  end: c.surface),
                                              duration: const Duration(
                                                  milliseconds: 2000),
                                              builder: (context, value, _) {
                                                return Text('MisVecinos',
                                                    style: TextStyle(
                                                        fontFamily: 'Visby CFH',
                                                        color: value
                                                        //fontSize: scaleAnimation.value,
                                                        ));
                                              }),
                                    ),
                                  ),
                                ))));
                      })),
            )
          ],
        ),
//
      ]),
    );
  } //

  Widget checkSession() {
    //Checar sesison en shared preferences

    return const LoginPage();
  }
}
