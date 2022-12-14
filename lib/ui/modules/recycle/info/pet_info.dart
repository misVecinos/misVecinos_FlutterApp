import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class PetInfo extends ConsumerStatefulWidget {
  const PetInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetInfoState();
}

class _PetInfoState extends ConsumerState<PetInfo> {
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
                  Image.asset('assets/images/plastics.png').image;
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
                    'assets/images/plastics.png',
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
                    child: Text('??C??MO IDENTIFICAR LOS TIPOS DE PL??STICOS?',
                        style: t.subtitle),
                  ),
                  Text(
                      'S??MBOLOS QUE NOS AYUDAN A DISTINGUIR LOS QUE MEJOR SE RECICLAN.',
                      style: t.messages),
                  //
                  Divider(
                    color: c.surface,
                  ),
                  //
                  Text(
                      'ESTIMADO VECINO, para reconocer cada uno de los pol??meros m??s utilizados en la elaboraci??n de los envases de pl??stico, ???Mis Vecinos??? te comparte esta informaci??n en relaci??n a la clasificaci??n que se asign?? a cada uno de ellos, y que suele aparecer grabada en la base del envase dentro de un tri??ngulo de Mo??bius ???.',
                      style: t.messagesBlack),

                  Divider(
                    color: c.surface,
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text('1. PET (polietilen tereftalato).',
                      style: t.messagesBlue),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Es el pol??mero m??s empleado para fabricar envases de pl??stico aptos para alimentos. Muy resistente y ligero, se conserva bien, tiene un alto nivel de transparencia y, lo m??s importante, es 100% reciclable. Eso s??, siempre y cuando lo separemos del resto de la basura y lo echemos al contenedor amarillo. Se usa b??sicamente en la fabricaci??n de envases y se recicla para todo tipo de productos: desde hilo para tejidos de alta resistencia hasta mobiliario urbano o nuevos envases, entre muchos otros.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text('2. PEAD (polietileno de alta densidad).',
                      style: t.messagesBlue),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'M??s resistente que el PET a la corrosi??n y a los qu??micos, es otro de los pl??sticos m??s frecuentes en los envases, pero en este caso los que no son transparentes: garrafas de agua mineral de gran formato (esas que son blanquecinas, no transparentes, tan t??picas para el envasado de leche en pa??ses anglosajones), la botella blanca de la leche o las botellas y garrafas de colores de detergentes y suavizantes. Tambi??n se emplea para fabricar bolsas de asas: las t??picas del s??per. Se recicla bien. Va al amarillo. Sirve para hacer otros envases (no alimentarios), bolsas de basura, tubos y mangueras, etc. Muchos de los contenedores amarillos, a donde debemos echarlo, est??n hechos con ??l.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text('3. PVC (polivinilo cloruro).', style: t.messagesBlue),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Muy resistente y duro, excelente como aislante y f??cil de moldear. Y muy barato, por lo que es uno de los pol??meros m??s utilizados en el mundo. Pero tambi??n de los m??s conflictivos, pues tanto en su fabricaci??n como durante su uso puede liberar sustancias t??xicas. Aunque parezca incre??ble, hace 20 a??os el agua se envasaba en este material: incluso se hac??an chupetes y mordedores con PVC blando, que liberaba ftalatos. Aunque cada vez se usa menos como material de envasado, se emplea para casi todo lo dem??s: desde ventanas hasta lonetas, calzado deportivo, mobiliario de oficina, electrodom??sticos, juguetes, coches, cables, tuber??as??? No se recicla f??cilmente.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text('4. PEBD (polietileno de baja densidad).',
                      style: t.messagesBlue),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Es algo as?? como la versi??n flexible del PEAD, es trasl??cido, pero no transparente como el PET. Se utiliza mucho para envasado, principalmente por sus excelentes propiedades de termosellado (que podr??amos definir como ???pegar por calor???): bolsas de supermercado, sobres, botellas flexibles, bolsas de suero, ampollas flexibles??? Tambi??n es el que se usa para las bolsas herm??ticas (tipo congelado) o las de basura de gran tama??o. Se recicla para hacer muebles, moquetas o suelos t??cnicos.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text('5. PP (polipropileno).', style: t.messagesBlue),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Otro de los pl??sticos m??s frecuentes. Ligero, resistente, flexible y el??stico (no confundir estos dos ??ltimos t??rminos: flexible, que se puede doblar, y el??stico, que recupera su forma original tras doblarse). Es con el que se elaboran las famosas pajitas de refresco o los bastones de o??do, que recomendamos no usar. Los envases de yogur y los de comida para llevar tambi??n son de este material, y las tarrinas de helado, as?? como los tapones de rosca, la cinta adhesiva o los cascos de pl??stico. Se recicla para hacer cuerdas de pl??stico, bolsas de basura, maceteros flexibles (los cl??sicos negros y marrones), material de limpieza como escobas y cepillos, etc.',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text('6. PS (poliestireno).', style: t.messagesBlue),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'R??gido y duro, pero muy ligero: es el pl??stico blanco con el que se hacen los vasos, platos y cubiertos de usar y tirar que hemos quedado en que dejaremos de usar. Una de sus variedades es el famoso poliestireno expandido o porexpan de los moldes protectores de las cajas de electrodom??sticos o las cajitas de las hamburguesas. Tambi??n se usa para moldear figuras. Se recicla b??sicamente para hacer m??s bolitas de porexpan o, combin??ndolo con otros materiales, para fabricar mobiliario urbano (bolardos, bancos para parques y jardines???).',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text('7. Otros pl??sticos y resinas sint??ticas.',
                      style: t.messagesBlue),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Con este n??mero, se identifica el resto de pol??meros m??s utilizados en la fabricaci??n de resinas y pl??sticos para diferentes usos, como los poliamidas (PA), con las que se elabora el nailon, el policarbonato (PC), con el que se hacen las cajas de los CD, las cubiertas de los invernaderos o las garrafas de agua reutilizables, el metacrilato (PMMA), muy usado en productos de decoraci??n y como sustituto del cristal (los estantes de las neveras y las urnas en que votamos son de este material), el etileno-vinil-alcohol (EVOH o EVAL), que es el que se usa para los alimentos envasados al vac??o y termosellados, y muchos otros pol??meros m??s.',
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
