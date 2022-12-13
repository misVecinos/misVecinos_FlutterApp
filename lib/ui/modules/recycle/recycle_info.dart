import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'recycle.dart';

class RecycleInfo extends ConsumerStatefulWidget {
  const RecycleInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<RecycleInfo> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isRecycing', true);
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
        body: Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
          child: Image.asset(
            'assets/images/recycle.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.4,
              0.7,
              0.98,
            ],
            colors: [
              c.secondary.withOpacity(0.2),
              c.secondary.withOpacity(0.6),
              c.secondary,
            ],
          )),
        ),
        FadeInRight(
          duration: const Duration(seconds: 2),
          child: Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.15,
                left: size.height * 0.03,
                right: size.height * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: Text(
                    'Ayuda al medio \n ambiente',
                    style: t.titleLight,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.03),
                  child: Text(
                    '¿Sabías que en cada hogar se generan más de 9 kilogramos de basura por semana? ',
                    style: t.messagesLight,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.05),
                  child: Text(
                    '¿Sabías que un hogar promedio puede desechar más de 1,500 envases de PET y latas de aluminio al año? ',
                    style: t.messagesLight,
                  ),
                ),
              ],
            ),
          ),
        ),
        FadeIn(
          duration: const Duration(seconds: 3),
          child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.6),
            child: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const Recycle();
                }));
              },
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: c.secondary,
                    height: size.height * 0.065,
                    width: size.width * 0.85,
                    child: Center(
                      child: Text(
                        'Empezar a  reciclar',
                        style: t.buttonBlue2,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
