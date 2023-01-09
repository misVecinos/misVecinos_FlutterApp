import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../privacity/privacity.dart';

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
        appBar: AppBar(
          actions: [
            Icon(Icons.abc, color: c.surface),
          ],
          backgroundColor: c.surface,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: [
            Stack(
              children: [
                SizedBox(
                  height: size.height * 0.5,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/laJoya.jpg',
                    fit: BoxFit.cover,
                  ),
                  // child: const Placeholder(),
                ),
                Container(
                  height: size.height * 0.5,
                  width: size.width,
                  color: c.primary.withOpacity(0.5),
                ),
                Container(
                  height: size.height * 0.5,
                  width: size.width,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      0.3,
                      0.7,
                      0.95,
                    ],
                    colors: [
                      c.secondary.withOpacity(0.2),
                      c.secondary.withOpacity(0.6),
                      c.secondary,
                    ],
                  )),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.36),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                ),
                //
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.405),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/svg/location.svg',
                        color: c.error,
                        height: size.height * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: size.width * 0.015),
                        child: Text('La Joya, Toluca.', style: t.messagesBlack),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      left: size.width / 3, top: size.height * 0.16),
                  child: CircleAvatar(
                    radius: size.height * 0.09,
                    backgroundImage:
                        const AssetImage('assets/images/laJoya.jpg'),
                  ),
                )
              ],
            ),
            // //

            SizedBox(
              height: size.height * 0.01,
            ),

            Padding(
              padding: EdgeInsets.only(
                  left: size.height * 0.02, right: size.height * 0.02),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Descripción', style: t.messagesBold)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                          'Colonia centrica al sur de Toluca, exelente ubicacion, zonas verdes a sus alrededores, zona comercial, seguridad. ',
                          style: t.messages)),
                ],
              ),
            ),

            //
            SizedBox(
              height: size.height * 0.04,
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
                    closeSesion();
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
            ),
            //
            SizedBox(
              height: size.height * 0.15,
            ),
            //
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const TermsScreen();
                  }));
                },
                child: Text(
                  'Lee Nuestro Aviso de Privacidad',
                  style: t.terms,
                ),
              ),
            ),
            //

            //

            Center(
              child: Text(
                'Versión: 0.0.1.1',
                style: t.messages,
              ),
            ),
            //
            //
            //
          ],
        ));
  }

  closeSesion() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
            title: Text('¿Nos Dejas?', style: t.subtitle),
            content: Text(
              'Estas apunto de cerrar tu sesión. ¿Estas Seguro?',
              style: t.messages,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) async {
                    final navigator = Navigator.of(context);
                    final prefs = await SharedPreferences.getInstance();
                    // await prefs.setBool('isLogged', false);
                    // await prefs.setBool('isRecycing', false);
                    await prefs.remove('isLogged');
                    await prefs.remove('isRecycing');
                    await prefs.remove('firstTimeRecycle');

                    navigator
                        .pushReplacement(MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  });
                },
                style: TextButton.styleFrom(foregroundColor: c.error),
                child: Text(
                  'Cerrar Sesión',
                  style: t.messagesRed,
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
