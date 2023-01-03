import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_details.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class Character extends ConsumerWidget {
  const Character({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        //title: Text('Registro guardado', style: t.subtitle),
        actions: [
          Icon(
            Icons.abc,
            color: c.surface,
          ),
        ],
        backgroundColor: c.surface,
        elevation: 0,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(
                left: size.height * 0.025, top: 0, right: size.height * 0.025),
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Registro guardado', style: t.title),
              Text(
                'Se guardo tu registro exitosamente 👍. ',
                style: t.messagesBlack,
              ),

              Text(
                '¡Sigue ayudando al planeta!',
                style: t.messagesBlack,
              ),

              // LottieBuilder.asset(
              //   repeat: true,
              //   'assets/icons/lottie/character.json',
              //   height: size.height * 0.38,
              // ),
              Center(
                child: Image.asset(
                  height: size.height * 0.38,
                  'assets/icons/character.gif',
                ),
              ),
              LottieBuilder.asset(
                repeat: false,
                'assets/icons/lottie/chek.json',
                height: size.height * 0.1,
              ),
              //
            ],
          ),
          LottieBuilder.asset(
            repeat: false,
            'assets/icons/lottie/confeti.json',
            height: size.height,
            width: size.width,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.4,
            ),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const RecycleDetails())));
                },
                child: Text(
                  'Aceptar',
                  style: t.messagesBlue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
