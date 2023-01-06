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
                    child: Text('¿CÓMO IDENTIFICAR LOS TIPOS DE PLÁSTICOS?',
                        style: t.subtitle),
                  ),
                  Text(
                      'SÍMBOLOS QUE NOS AYUDAN A DISTINGUIR LOS QUE MEJOR SE RECICLAN.',
                      style: t.messages),
                  //
                  Divider(
                    color: c.surface,
                  ),
                  //
                  Text(
                      'ESTIMADO VECINO, para reconocer cada uno de los polímeros más utilizados en la elaboración de los envases de plástico, “Mis Vecinos” te comparte esta información en relación a la clasificación que se asignó a cada uno de ellos, y que suele aparecer grabada en la base del envase dentro de un triángulo de Moëbius ♻.',
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
                      'Es el polímero más empleado para fabricar envases de plástico aptos para alimentos. Muy resistente y ligero, se conserva bien, tiene un alto nivel de transparencia y, lo más importante, es 100% reciclable. Eso sí, siempre y cuando lo separemos del resto de la basura y lo echemos al contenedor amarillo. Se usa básicamente en la fabricación de envases y se recicla para todo tipo de productos: desde hilo para tejidos de alta resistencia hasta mobiliario urbano o nuevos envases, entre muchos otros.',
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
                      'Más resistente que el PET a la corrosión y a los químicos, es otro de los plásticos más frecuentes en los envases, pero en este caso los que no son transparentes: garrafas de agua mineral de gran formato (esas que son blanquecinas, no transparentes, tan típicas para el envasado de leche en países anglosajones), la botella blanca de la leche o las botellas y garrafas de colores de detergentes y suavizantes. También se emplea para fabricar bolsas de asas: las típicas del súper. Se recicla bien. Va al amarillo. Sirve para hacer otros envases (no alimentarios), bolsas de basura, tubos y mangueras, etc. Muchos de los contenedores amarillos, a donde debemos echarlo, están hechos con él.',
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
                      'Muy resistente y duro, excelente como aislante y fácil de moldear. Y muy barato, por lo que es uno de los polímeros más utilizados en el mundo. Pero también de los más conflictivos, pues tanto en su fabricación como durante su uso puede liberar sustancias tóxicas. Aunque parezca increíble, hace 20 años el agua se envasaba en este material: incluso se hacían chupetes y mordedores con PVC blando, que liberaba ftalatos. Aunque cada vez se usa menos como material de envasado, se emplea para casi todo lo demás: desde ventanas hasta lonetas, calzado deportivo, mobiliario de oficina, electrodomésticos, juguetes, coches, cables, tuberías… No se recicla fácilmente.',
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
                      'Es algo así como la versión flexible del PEAD, es traslúcido, pero no transparente como el PET. Se utiliza mucho para envasado, principalmente por sus excelentes propiedades de termosellado (que podríamos definir como ‘pegar por calor’): bolsas de supermercado, sobres, botellas flexibles, bolsas de suero, ampollas flexibles… También es el que se usa para las bolsas herméticas (tipo congelado) o las de basura de gran tamaño. Se recicla para hacer muebles, moquetas o suelos técnicos.',
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
                      'Otro de los plásticos más frecuentes. Ligero, resistente, flexible y elástico (no confundir estos dos últimos términos: flexible, que se puede doblar, y elástico, que recupera su forma original tras doblarse). Es con el que se elaboran las famosas pajitas de refresco o los bastones de oído, que recomendamos no usar. Los envases de yogur y los de comida para llevar también son de este material, y las tarrinas de helado, así como los tapones de rosca, la cinta adhesiva o los cascos de plástico. Se recicla para hacer cuerdas de plástico, bolsas de basura, maceteros flexibles (los clásicos negros y marrones), material de limpieza como escobas y cepillos, etc.',
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
                      'Rígido y duro, pero muy ligero: es el plástico blanco con el que se hacen los vasos, platos y cubiertos de usar y tirar que hemos quedado en que dejaremos de usar. Una de sus variedades es el famoso poliestireno expandido o porexpan de los moldes protectores de las cajas de electrodomésticos o las cajitas de las hamburguesas. También se usa para moldear figuras. Se recicla básicamente para hacer más bolitas de porexpan o, combinándolo con otros materiales, para fabricar mobiliario urbano (bolardos, bancos para parques y jardines…).',
                      style: t.messagesBlack),
                  Divider(
                    color: c.surface,
                  ),
                  Divider(
                    color: c.surface,
                  ),

                  Text('7. Otros plásticos y resinas sintéticas.',
                      style: t.messagesBlue),
                  Divider(
                    color: c.surface,
                  ),

                  Text(
                      'Con este número, se identifica el resto de polímeros más utilizados en la fabricación de resinas y plásticos para diferentes usos, como los poliamidas (PA), con las que se elabora el nailon, el policarbonato (PC), con el que se hacen las cajas de los CD, las cubiertas de los invernaderos o las garrafas de agua reutilizables, el metacrilato (PMMA), muy usado en productos de decoración y como sustituto del cristal (los estantes de las neveras y las urnas en que votamos son de este material), el etileno-vinil-alcohol (EVOH o EVAL), que es el que se usa para los alimentos envasados al vacío y termosellados, y muchos otros polímeros más.',
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
