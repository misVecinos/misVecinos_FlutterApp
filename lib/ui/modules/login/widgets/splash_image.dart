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

class _SplashImageState extends State<SplashImage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2200));
    controller.stop();

    final animation =
        CurvedAnimation(parent: controller, curve: Curves.easeInSine);
    scaleAnimation = Tween<double>(begin: 1, end: 700).animate(animation);

    Future.delayed(const Duration(milliseconds: 1000)).whenComplete(() {
      //  ref.watch(color) == false
      controller.forward();
      return;
    });

    Future.delayed(const Duration(milliseconds: 3100))
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

        AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Center(
              child: Transform.scale(
                scale: scaleAnimation.value,
                child: CustomPaint(
                  painter: ImageInText(
                      text: 'Mis Vecinos',
                      textDirection: TextDirection.rtl,
                      boxRadius: 8,
                      boxBackgroundColor: c.secondary,
                      textStyle: t.titleApp),
                ),
              ),
            );
          },
        )

        //
      ],
    );
  }
}
