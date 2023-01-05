import 'package:flutter/material.dart';
import 'package:mis_vecinos_app/ui/modules/login/login_page.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import 'custom_text.dart';

class SplashImage extends StatefulWidget {
  const SplashImage({super.key});

  @override
  State<SplashImage> createState() => _SplashImageState();
}

class _SplashImageState extends State<SplashImage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .whenComplete(() => Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                pageBuilder: (_, animation, __) => FadeTransition(
                      opacity: animation,
                      child: const LoginPage(),
                    ))));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Image.asset(
            'assets/images/5.jpeg',
            height: size.height * 0.5,
            width: size.width,
            fit: BoxFit.cover,
          ),
        ),

        //
        Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.1,
                0.2,
                0.8,
              ],
              colors: [
                c.primary.withOpacity(0.1),
                c.primary.withOpacity(0.2),
                c.primary.withOpacity(0.6),
              ],
            ))),

        Center(
          child: Transform.scale(
            child: CustomPaint(
              painter: ImageInText(
                  text: 'Mis Vecinos',
                  textDirection: TextDirection.rtl,
                  boxRadius: 8,
                  boxBackgroundColor: c.secondary,
                  textStyle: t.titleApp),
            ),
          ),
        ),
        //
      ],
    );
  }
}
