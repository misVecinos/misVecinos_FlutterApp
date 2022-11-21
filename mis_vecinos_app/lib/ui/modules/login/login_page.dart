import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'image.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: c.onSecondary,
      body: ListView(
        children: [
          //Imagenes con Figura de triangulo
          LoginImage(size: size),
          //
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, right: size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Iniciar Sesión',
                  style: t.title,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.01, bottom: size.height * 0.01),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: c.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: c.disabled),
                      ),
                      hintText: 'Ingresa tu correo electronico',
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.01, bottom: size.height * 0.01),
                  child: TextField(
                    controller: password,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: c.primary),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: c.disabled),
                      ),
                      hintText: 'Ingresa tu contraseña',
                    ),
                  ),
                )
              ],
            ),
          ),

          Align(
            child: SizedBox(
              height: size.height * 0.065,
              width: size.width * 0.6,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Entra',
                    style: t.buttons,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
