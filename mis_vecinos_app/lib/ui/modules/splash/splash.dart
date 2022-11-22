import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/login/login_page.dart';

import '../../utils/text_styles.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4)).whenComplete(() {
      //Validar si ya inicio sesion primero
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const LoginPage();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: AnimatedTextKit(
                  pause: const Duration(milliseconds: 4000),
                  totalRepeatCount: 1,
                  repeatForever: false,
                  animatedTexts: [
                    FadeAnimatedText(
                      'MisVecinos',
                      textStyle: t.titleApp,
                    ),
                  ]),
            ),
          ),
          const Center(
              child: Padding(
            padding: EdgeInsets.all(15.0),
            child: CircularProgressIndicator(),
          ))

          //
        ],
      ),
    );
  }
}
