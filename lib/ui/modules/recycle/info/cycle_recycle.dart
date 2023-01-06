import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class CycleRecycle extends ConsumerStatefulWidget {
  const CycleRecycle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetInfoState();
}

class _PetInfoState extends ConsumerState<CycleRecycle> {
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
              final imageProvider = Image.asset('assets/images/r1.png').image;
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
                    'assets/images/r1.png',
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
                    child: Text('¿Sábes cúal es el ciclo del reciclaje?',
                        style: t.subtitle),
                  ),
                  //
                  Divider(
                    color: c.surface,
                  ),
                  //
                  Text(
                      'El PET es un tipo plástico transparente, ligero, fuerte, seguro, irrompible y reciclable. Los productos de PET pueden ser fabricados mediante soplado para la obtención de botellas o envases de cuello estrecho o mediante termoformado para otro tipo de envases y recipientes. ',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'El PET es un plástico ligero, por lo tanto, los productos envasados en este material reciclable son más eficientes durante su transporte y distribución ya que permiten embalajes secundarios más ligeros que reducen el consumo de combustibles fósiles y en consecuencia las emisiones de CO2 a la atmósfera.',
                      style: t.messagesBlack),

                  GestureDetector(
                    onTap: () {
                      final imageProvider =
                          Image.asset('assets/images/r2.png').image;
                      showImageViewer(context, imageProvider,
                          backgroundColor: c.black.withOpacity(0.6),
                          swipeDismissible: true);
                    },
                    child: SizedBox(
                      height: size.height * 0.2,
                      width: size.width,
                      child: Image.asset(
                        'assets/images/r2.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  Text(
                      'El PET es el plástico más reciclado del mundo. El PET puede ser reciclado múltiples veces, pero para uso alimentario solo se permite un 1er nivel de reciclaje, pasado este nivel se utiliza para una amplia variedad de productos finales como: fibra, fibra de relleno textil, correas, y botellas y envases para usos no alimentarios como detergentes y otros envases.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Text('CICLO DEL RECICLAJE DEL PET', style: t.subtitle),

                  Divider(
                    color: c.surface,
                  ),
                  GestureDetector(
                    onTap: () {
                      final imageProvider =
                          Image.asset('assets/images/r3.png').image;
                      showImageViewer(context, imageProvider,
                          backgroundColor: c.black.withOpacity(0.6),
                          swipeDismissible: true);
                    },
                    child: SizedBox(
                      height: size.height * 0.25,
                      width: size.width,
                      child: Image.asset(
                        'assets/images/r3.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Con el proyecto “Mis Vecinos”, tu fraccionamiento se convierte en un eslabón del ciclo del reciclaje ya que identificamos, separamos y enviamos al centro de reciclaje los residuos que se generan el tu fraccionamiento.',
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
