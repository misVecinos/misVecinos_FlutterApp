import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/acesses/widgets/access_card.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class Acess extends ConsumerStatefulWidget {
  const Acess({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AcessState();
}

class _AcessState extends ConsumerState<Acess> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appbar = AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Accesos ', style: t.title),
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
        systemOverlayStyle: SystemUiOverlayStyle.dark);

    return Scaffold(
        appBar: appbar,

        //
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
              left: size.height * 0.025, top: 0, right: size.height * 0.025),
          children: [
            SizedBox(height: size.height * 0.02),
            Text(
                'Dale acceso para ingresar al vecindario a tus amigos, familia o trabajadores personales fuera del vecindario.',
                style: t.messagesBlack),
            SizedBox(height: size.height * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                AccesCardV(title: 'Personas'),
                Spacer(),
                AccesCardV(title: 'Trabajadores'),
              ],
            ),

            //
          ],
        ));
  }
}
