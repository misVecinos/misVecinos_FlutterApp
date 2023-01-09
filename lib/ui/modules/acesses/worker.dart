import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'widgets/access_cardH.dart';

class Worker extends ConsumerStatefulWidget {
  const Worker({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AcessState();
}

class _AcessState extends ConsumerState<Worker> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Trabajadores ', style: t.title),
              Text('Llaves de acceso ', style: t.messages)
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.help, color: c.disabled)),
          ],
          backgroundColor: c.surface,
          elevation: 0,
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
              left: size.height * 0.025, top: 0, right: size.height * 0.025),
          children: [
            //

            SizedBox(height: size.height * 0.02),

            Text('Selecciona el tipo de acceso que deseas otorgar:',
                style: t.messagesBlack),

            SizedBox(height: size.height * 0.02),

            const AccesCardH(
                title: 'Temporal',
                subtitle: 'Genera un QR único para acceso temporal.',
                isPerson: false,
                isTemporal: true),
            SizedBox(height: size.height * 0.015),
            const AccesCardH(
                title: 'Permanente',
                subtitle: 'Brindar tarjeta NFC de fácil acceso.',
                isPerson: false,
                isTemporal: false),

            //
          ],
        ));
  }
}
