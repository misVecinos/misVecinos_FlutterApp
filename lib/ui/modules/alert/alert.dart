import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../../utils/widgets.dart';

class AlertPage extends ConsumerStatefulWidget {
  const AlertPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<AlertPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: const Color(0xffecc5ca),
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: size.height * 0.025,
                top: size.height * 0.05,
                right: size.height * 0.025),
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              // Text('UBICACION', style: t.buttonError),
              SizedBox(
                height: size.height * 0.22,
              ),
              RippleWave(
                color: c.error,
                child: Text(
                  'SOS',
                  style: TextStyle(
                      color: c.secondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              //
              SizedBox(
                height: size.height * 0.25,
              ),
              Text('La alarma SOS esta siendo emitida.', style: t.buttons),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                  'Tus contactos recibirán un mensaje \nde emergencia y tu ubicación actual.',
                  style: t.buttons),
              SizedBox(
                height: size.height * 0.05,
              ),

              Center(
                child: TextButton(
                  onPressed: () async {
                    launchUrl(Uri.parse('tel://911'));

                    //await PhoneCaller.callNumber("911");
                  },
                  child: Text(
                    'Llamar a emergencias',
                    style: t.messagesRed,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Buton(
                    background: const Color(0xffFFFFFF),
                    title: '¡Estoy a Salvo!',
                    style: t.messagesRed),
              ),
              //
            ],
          )),
    );
  }
}
