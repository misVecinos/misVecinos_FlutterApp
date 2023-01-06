import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class PetSeparate extends ConsumerStatefulWidget {
  const PetSeparate({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetInfoState();
}

class _PetInfoState extends ConsumerState<PetSeparate> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        //title: Text('Tipos de Pet', style: t.subtitle),
        centerTitle: true,
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
                  Image.asset('assets/images/containerPet.png').image;
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
                    'assets/images/containerPet.png',
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
                    child: Text(
                        '¿Cómo separar los plásticos para su reciclado?',
                        style: t.subtitle),
                  ),
                  //
                  Divider(
                    color: c.surface,
                  ),
                  //
                  Text(
                      'Una vez que conocemos los tipos de plásticos, el siguiente paso es la clasificación, parte fundamental del reciclaje debido a que la mayoría de estos no son compatibles entre sí.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Es importante que identifiques los envases de PET (1) ya que de momento son los únicos plásticos que serán depositados en el contenedor de reciclaje de tu fraccionamiento.',
                      style: t.messagesBlack),

                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Los plásticos mezclados generalmente tienen un valor más bajo y producen productos con propiedades pobres y variables. Incluso el 1% de un polímero incompatible puede ser suficiente para degradar las propiedades de un lote completo de reciclado. ',
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
