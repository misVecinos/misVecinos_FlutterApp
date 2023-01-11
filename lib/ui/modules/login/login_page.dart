import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/login/controller.dart';
import 'package:mis_vecinos_app/ui/modules/login/form.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../main/main_page.dart';
import '../privacity/privacity.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double inset = 300;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800)).whenComplete(() {
      setState(() {
        inset = 0;
      });
    });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Stack(
              //padding: const EdgeInsets.only(top: 0),
              children: [
                //LoginImage(size: size),

                SizedBox(
                    height: size.height,
                    width: size.width,
                    child: ImageSlideshow(
                        autoPlayInterval: 7000,
                        isLoop: true,
                        children: [
                          Image.asset(
                            'assets/images/5.jpeg',
                            height: size.height * 0.5,
                            width: size.width,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/4.jpeg',
                            height: size.height * 0.5,
                            width: size.width,
                            fit: BoxFit.cover,
                          ),
                          Image.asset(
                            'assets/images/1.jpeg',
                            height: size.height * 0.5,
                            width: size.width,
                            fit: BoxFit.cover,
                          ),
                        ])),

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

                AnimatedPadding(
                  padding: EdgeInsets.only(top: inset),
                  duration: const Duration(milliseconds: 1700),
                  curve: Curves.ease,
                  child: Stack(
                    children: [
                      const FormLogin(),
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.51),
                        child: Column(
                          children: [
                            Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    //top: size.height * 0.01,
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
                                            ref
                                                .read(userAuth.notifier)
                                                .denied();
                                          }
                                          if (value != 'casa8') {
                                            ref.read(user.notifier).denied();
                                            ref
                                                .read(userAuth.notifier)
                                                .denied();
                                          } else {
                                            ref.read(user.notifier).ok();
                                            ref.read(userAuth.notifier).ok();
                                          }
                                        },
                                        controller: email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 12,
                                              bottom:
                                                  0, // HERE THE IMPORTANT PART
                                              top: size.height * 0.07 / 2),
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
                                              borderSide: BorderSide(
                                                  color: ref.watch(user)),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          hintText:
                                              'Ingresa tu Nombre de usuario',
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
                                              ref
                                                  .read(passAuth.notifier)
                                                  .denied();
                                            }
                                            if (value != 'Abcde123') {
                                              ref.read(pass.notifier).denied();
                                              ref
                                                  .read(passAuth.notifier)
                                                  .denied();
                                            } else {
                                              ref.read(pass.notifier).ok();
                                              ref.read(passAuth.notifier).ok();
                                            }
                                          },
                                          controller: password,
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText:
                                              ref.watch(obscurePassword),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(
                                                left: 12,
                                                bottom:
                                                    0, // HERE THE IMPORTANT PART
                                                top: size.height * 0.07 / 2),
                                            labelText: 'Contraseña',
                                            labelStyle: TextStyle(
                                                color: ref.watch(pass)),
                                            prefixIcon: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: SvgPicture.asset(
                                                  'assets/icons/feather/lock.svg',
                                                  color: ref.watch(pass)),
                                            ),
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                ref
                                                    .read(obscurePassword
                                                        .notifier)
                                                    .refreshState();
                                              },
                                              icon: SvgPicture.asset(
                                                'assets/icons/feather/eye.svg',
                                                color: ref.watch(
                                                            obscurePassword) ==
                                                        false
                                                    ? c.primary
                                                    : c.disabled,
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
                            ),
                            AnimatedSwitcher(
                                duration: const Duration(
                                  milliseconds: 600, //
                                ),
                                child: ref.watch(loading) == true
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                            top: size.height * 0.02),
                                        child:
                                            const CircularProgressIndicator(),
                                      )
                                    : _buton(size)),
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
                              height: size.height * 0.02,
                            ),
                            GestureDetector(
                              onTap: () async {
                                final url =
                                    Uri.parse('https://www.contendi.com.mx/');
                                // await launchUrl(url);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'No se pudo lanzar $url';
                                }
                              },
                              child: Align(
                                child: Image.asset(
                                  'assets/images/contendi.png',
                                  height: size.height * 0.072,
                                  width: size.width * 0.4,
                                  fit: BoxFit.cover,
                                ),
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
                                  'Lee Nuestro Aviso de Privacidad',
                                  style: t.terms,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                //
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buton(Size size) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.02),
      child: Align(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: size.height * 0.058,
            width: size.width * 0.7,
            child: ElevatedButton(
                onPressed: () {
                  validateForm();
                },
                child: Text(
                  'Ingresar',
                  style: t.buttons,
                )),
          ),
        ),
      ),
    );
  }

  validateForm() {
    if ((ref.watch(userAuth) == true && ref.watch(passAuth) == true)) {
      ref.read(loading.notifier).ok();
      Future.delayed(const Duration(milliseconds: 1200)).whenComplete(() async {
        //
        ref.read(loading.notifier).denied();
        //ref.read(obscurePassword.notifier).denied();

        ref.read(user.notifier).defaul();
        ref.read(pass.notifier).defaul();

        email.clear();
        password.clear();

        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const MainPage();
        }));
      });

      //
    } else {
      showMyDialog();
    }
  }

  showMyDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
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
                style: TextButton.styleFrom(foregroundColor: c.disabled),
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
