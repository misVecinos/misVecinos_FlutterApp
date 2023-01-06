import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class PetRecycle extends ConsumerStatefulWidget {
  const PetRecycle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetInfoState();
}

class _PetInfoState extends ConsumerState<PetRecycle> {
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              final imageProvider =
                  Image.asset('assets/images/recolector.png').image;
              showImageViewer(context, imageProvider,
                  backgroundColor: c.black.withOpacity(0.6),
                  swipeDismissible: true);
            },
            child: Stack(
              children: [
                SizedBox(
                  height: size.height * 0.25,
                  width: size.width,
                  child: Image.asset(
                    'assets/images/recolector.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: size.height * 0.25,
                  width: size.width,
                  color: c.primary.withOpacity(0.3),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
            width: size.width,
            //color: c.primary.withOpacity(0.3),
          ),
          Expanded(
            child: Container(
              //height: size.height,
              width: size.width,
              color: c.secondary,

              child: ListView(
                padding: EdgeInsets.only(
                    left: size.height * 0.025,
                    top: 0,
                    right: size.height * 0.025),
                children: [
                  Center(
                    child: Text('¿Cómo hacer reciclaje de PET?',
                        style: t.subtitle),
                  ),
                  //
                  Divider(
                    color: c.surface,
                  ),
                  //
                  Text(
                      '¡MUY BIEN VECINO!, ya identificaste y separaste correctamente el PET y lo depositaste en el contendor de tu fraccionamiento. ¿Quieres saber cuáles son los siguientes pasos en el proceso de reciclaje?',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'La app de “MIS Vecinos” asignará a un operario el vaciado del contendor, este operario se identificará mediante una tarjeta NFC en tu fraccionamiento.',
                      style: t.messagesBlack),

                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'El operario en la app de “MIS Vecinos” iniciara el vaciado del contendor y reiniciará éste nuevamente a 0, para que se pueda volver a llenar.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Text(
                      'Una vez realizado el vaciado, el operario pesará los residuos de PET y aluminio y entregará un recibo con el peso y el importe correspondiente.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
