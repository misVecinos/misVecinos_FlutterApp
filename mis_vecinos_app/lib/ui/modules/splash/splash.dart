import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/login/login_page.dart';

import '../../utils/colors.dart';
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
        vsync: this, duration: const Duration(milliseconds: 4500));
    controller.stop();

    final animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    scaleAnimation = Tween<double>(begin: 0.4, end: 650).animate(animation);

    Future.delayed(const Duration(milliseconds: 3000)).whenComplete(() {
      //  ref.watch(color) == false
      ref.read(color.notifier).forward();
      controller.forward();
      return;
    });

    Future.delayed(const Duration(milliseconds: 4500)).whenComplete(() {
      //Validar si ya inicio sesion primero
      //Si ya inicio sesion, va a home
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
      //Si no, va a login
      //
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
        SizedBox(
          height: size.height * .3,
        ),
        FadeIn(
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
                          duration: const Duration(milliseconds: 2000),
                          child: ref.watch(color) == false
                              ? const Text('MisVecinos',
                                  style: TextStyle(
                                      fontFamily: 'Visby CFH',
                                      color: Colors.black
                                      //fontSize: scaleAnimation.value,
                                      ))
                              : TweenAnimationBuilder<Color?>(
                                  tween: ColorTween(
                                      begin: c.black, end: c.surface),
                                  duration: const Duration(milliseconds: 2000),
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
                    ),
                  ),
                ),
              );
            },
          ),
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
