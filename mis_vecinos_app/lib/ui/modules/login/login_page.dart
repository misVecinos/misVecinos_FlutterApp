import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/login/controller.dart';
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
                                'Inicia Sesión',
                                style: t.title,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    bottom: size.height * 0.01),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isEmpty) {
                                      ref.read(user.notifier).defaul();
                                      ref.read(userAuth.notifier).denied();
                                    }
                                    if (value != 'casa8') {
                                      ref.read(user.notifier).denied();
                                      ref.read(userAuth.notifier).denied();
                                    } else {
                                      ref.read(user.notifier).ok();
                                      ref.read(userAuth.notifier).ok();
                                    }
                                  },
                                  controller: email,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'Nombre de usuario',
                                    labelStyle:
                                        TextStyle(color: ref.watch(user)),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/feather/mail.svg',
                                        color: ref.watch(user),
                                      ),
                                    ),
                                    constraints: BoxConstraints(
                                        maxHeight: size.height * 0.07,
                                        maxWidth: size.width * 0.9),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: ref.watch(user),
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: ref.watch(user)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    hintText: 'Ingresa tu Nombre de usuario',
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
                                    onChanged: (value) {
                                      if (value.isEmpty) {
                                        ref.read(pass.notifier).defaul();
                                        ref.read(passAuth.notifier).denied();
                                      }
                                      if (value != 'Abcde123') {
                                        ref.read(pass.notifier).denied();
                                        ref.read(passAuth.notifier).denied();
                                      } else {
                                        ref.read(pass.notifier).ok();
                                        ref.read(passAuth.notifier).ok();
                                      }
                                    },
                                    controller: password,
                                    keyboardType: TextInputType.visiblePassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Contraseña',
                                      labelStyle:
                                          TextStyle(color: ref.watch(pass)),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset(
                                            'assets/icons/feather/lock.svg',
                                            color: ref.watch(pass)),
                                      ),
                                      suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/icons/feather/eye.svg',
                                          color: c.disabled,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ref.watch(pass)),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: ref.watch(pass)),
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
                        // Center(
                        //   child: TextButton(
                        //     onPressed: () {
                        //       Navigator.push(context,
                        //           MaterialPageRoute(builder: (context) {
                        //         return const ForgotPasswordScreen();
                        //       }));
                        //     },
                        //     child: Text(
                        //       '¿Olvidaste la contraseña?',
                        //       style: t.link,
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: size.height * 0.05,
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

    if ((ref.watch(userAuth) == true && ref.watch(passAuth) == true)) {
      ref.read(user.notifier).defaul();
      ref.read(pass.notifier).defaul();
      email.clear();
      password.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        elevation: 0,
        dismissDirection: DismissDirection.startToEnd,
        backgroundColor: c.secondary,
        content: Text('Bienvenid@ de nuevo!', style: t.buttonBlue),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(
          bottom: size.height * 0.04,
          right: size.height * 0.025,
          left: size.height * 0.025,
        ),
      ));

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const MainPage();
      }));
    } else {
      showMyDialog();
    }
  }

  showMyDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Casi...', style: t.subtitle),
            content: Text(
              'Completa correctamente tus credenciales para iniciar sesión.',
              style: t.messages,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: t.messagesBlue,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancelar',
                  style: t.messages,
                ),
              ),
            ],
          );
        });
  }
}
