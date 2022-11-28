import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: size.height * 0.25,
              width: size.width,
              child: Image.asset(
                'assets/images/1.jpeg',
                fit: BoxFit.cover,
              ),
              // child: const Placeholder(),
            ),
            Container(
              height: size.height * 0.25,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.2,
                  0.5,
                  0.95,
                ],
                colors: [
                  c.secondary.withOpacity(0.2),
                  c.secondary.withOpacity(0.6),
                  c.secondary,
                ],
              )),
            )
          ],
        ),
        //
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            'assets/icons/svg/round-home.svg',
            color: c.primary,
            height: size.height * 0.045,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.015),
            child: Text('Casa 8.', style: t.title),
          ),
        ]),
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/svg/location.svg',
              color: c.disabled,
              height: size.height * 0.03,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.015),
              child: Text('La Joya, Toluca.', style: t.messages),
            ),
          ],
        ),
        //
        SizedBox(
          height: size.height * 0.05,
        ),
        //
        Padding(
          padding: EdgeInsets.only(left: size.height * 0.015),
          child: Align(
            alignment: Alignment.centerLeft,
            child: InkWell(
              splashColor: c.error.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('¿Nos Dejas?', style: t.subtitle),
                        content: Text(
                          'Estas apunto de cerrar tu sesión. ¿Estas Seguro?',
                          style: t.messages,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              WidgetsBinding.instance
                                  .addPostFrameCallback((_) async {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setBool('isLogged', false);
                              });
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (context) {
                                return const LoginPage();
                              }));
                            },
                            child: Text(
                              'Cerrar Sesión',
                              style: t.messagesRed,
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
              },
              child: Ink(
                width: size.width * 0.4,
                child: Padding(
                  padding: EdgeInsets.all(size.height * 0.008),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Cerrar Sesión', style: t.messagesRed),
                        SvgPicture.asset('assets/icons/svg/exit.svg',
                            height: size.height * 0.03, color: c.error)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
        //
      ],
    ));
  }
}
