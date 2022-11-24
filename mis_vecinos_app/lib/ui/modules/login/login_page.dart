import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/forgot_password/forgot_password.dart';
import 'package:mis_vecinos_app/ui/modules/terms/terms.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../main/main_page.dart';
import 'image.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          children: [
            Stack(
              children: [
                //Imagenes con Figura de triangulo
                LoginImage(size: size),

                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.435),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.01,
                              left: size.width * 0.06,
                              right: size.width * 0.06),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Iniciar Sesión',
                                style: t.title,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    bottom: size.height * 0.01),
                                child: TextField(
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/feather/mail.svg',
                                        color: c.disabled,
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                        maxHeight: size.height * 0.07,
                                        maxWidth: size.width * 0.9),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: c.primary),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: c.disabled),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Ingresa tu correo electronico',
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    bottom: size.height * 0.01),
                                child: SizedBox(
                                  height: size.height * 0.07,
                                  width: size.width * 0.9,
                                  child: TextField(
                                    controller: password,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Contraseña',
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset(
                                          'assets/icons/feather/lock.svg',
                                          color: c.disabled,
                                        ),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/feather/eye.svg',
                                          color: c.disabled,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: c.primary),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: c.disabled),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      hintText: 'Ingresa tu contraseña',
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.02),
                          child: Align(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                height: size.height * 0.065,
                                width: size.width * 0.7,
                                child: ElevatedButton(
                                    onPressed: () {
                                      validateForm();
                                    },
                                    child: Text(
                                      'Entra',
                                      style: t.buttons,
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const ForgotPasswordScreen();
                              }));
                            },
                            child: Text(
                              '¿Olvidaste la contraseña?',
                              style: t.link,
                            ),
                          ),
                        ),
                        Align(
                          child: Image.asset(
                            'assets/images/contendi.png',
                            height: size.height * 0.06,
                            width: size.width * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const TermsScreen();
                              }));
                            },
                            child: Text(
                              'Lee nuestros Términos y Condiciones',
                              style: t.terms,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            //
          ],
        ),
      ),
    );
  }

  validateForm() {
    final size = MediaQuery.of(context).size;

    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      email.clear();
      password.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        elevation: 0,
        dismissDirection: DismissDirection.startToEnd,
        backgroundColor: c.primary.withOpacity(0.85),
        content: Text('Bienvenid@ de nuevo!', style: t.buttons),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(
          bottom: size.height * 0.04,
          right: size.height * 0.025,
          left: size.height * 0.025,
        ),
      ));

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MainPage();
      }));
    }
  }
}
