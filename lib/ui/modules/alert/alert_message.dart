import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:mis_vecinos_app/ui/modules/alert/alert.dart';
import 'package:mis_vecinos_app/ui/utils/widgets.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class AlertMessage extends ConsumerStatefulWidget {
  const AlertMessage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<AlertMessage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      color: c.error.withOpacity(0.25),
      height: size.height,
      width: size.width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: size.height * 0.025,
            top: size.height * 0.05,
            right: size.height * 0.025),
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Text('Cuidado!', style: t.title),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('El botón de alarma es de emergencia.', style: t.buttons),
          SizedBox(
            height: size.height * 0.01,
          ),
          Text('Nos encargamos de que no lo \npresiones por accidente.',
              style: t.buttons),
          SizedBox(
            height: size.height * 0.25,
          ),
          Center(
              child: Text('¿Deseas confirmar activar la alarma?',
                  style: t.buttons)),
          SizedBox(
            height: size.height * 0.01,
          ),
          Center(
            child: TimerCountdown(
              secondsDescription: '',
              timeTextStyle: t.buttonsBig,
              format: CountDownTimerFormat.secondsOnly,
              endTime: DateTime.now().add(const Duration(seconds: 8)),
              onEnd: () async {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const AlertPage();
              }));
            },
            child: Buton(
                background: c.error, title: 'Activar Alarma', style: t.buttons),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancelar',
                style: t.messagesBold,
              ),
            ),
          ),
          //
        ],
      ),
    ));
  }
}
