import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/widgets/minicard2.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'controller.dart';

class RecycleDetails extends ConsumerStatefulWidget {
  const RecycleDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecycleDetailsState();
}

class _RecycleDetailsState extends ConsumerState<RecycleDetails> {
  @override
  Widget build(BuildContext context) {
    List<int> listPET = ref.watch(listItemsPET);
    List<int> listAluminium = ref.watch(listItemsAluminium);
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Historial Reciclaje', style: t.title),
              //Text('Mes de Noviembre', style: t.messages),
            ],
          ),
          actions: [
            Icon(
              Icons.abc,
              color: c.surface,
            ),
          ],
          backgroundColor: c.surface,
          elevation: 0,
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              left: size.height * 0.025, top: 0, right: size.height * 0.025),
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MiniCard2(
                    asset: 'bottle.png',
                    title: 'PET',
                    number: listPET.isEmpty
                        ? '0'
                        : listPET
                            .reduce((value, element) => value + element)
                            .toString()),
                SizedBox(
                  width: size.width * 0.04,
                ),
                MiniCard2(
                    asset: 'can.png',
                    title: 'Aluminio',
                    number: listAluminium.isEmpty
                        ? '0'
                        : listAluminium
                            .reduce((value, element) => value + element)
                            .toString()),
              ],
            ),

            SizedBox(
              height: size.height * 0.02,
            ),

            ExpansionTile(
              initiallyExpanded: true,
              title: Text('Historial', style: t.subtitle),
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ref.watch(listItemsPET).length,
                    itemBuilder: (context, index) {
                      return ref.watch(listItemsPET).isEmpty
                          ? Text(
                              'Añade algunos elementos. Tu historial de reciclaje está vacio.',
                              style: t.messages)
                          : Row(
                              children: [
                                Text(
                                    'Hoy: ${ref.watch(listItemsPET)[index]} piezas de PET  ',
                                    style: t.messagesBlack),
                                const Spacer(),
                                Text(
                                    '${DateTime.now().hour}:${DateTime.now().minute}',
                                    style: t.messagesBlack),
                              ],
                            );
                    }),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: ref.watch(listItemsAluminium).length,
                    itemBuilder: (context, index) {
                      return ref.watch(listItemsAluminium).isEmpty
                          ? Text(
                              'Añade algunos elementos. Tu historial de reciclaje está vacio.',
                              style: t.messages)
                          : Row(
                              children: [
                                Text(
                                    'Hoy: ${ref.watch(listItemsAluminium)[index]} piezas de Aluminio  ',
                                    style: t.messagesBlack),
                                const Spacer(),
                                Text(
                                    '  ${DateTime.now().hour}:${DateTime.now().minute}',
                                    style: t.messagesBlack),
                              ],
                            );
                    }),
                //
              ],
            ),

            //
            Text(
              'Contenedor PET',
              style: t.subtitle,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),

            Stack(
              children: [
                Container(
                  color: c.surface,
                  height: size.height * 0.26,
                  width: size.width,
                  child: DChartPie(
                    data: const [
                      {'domain': 'En uso', 'measure': 58},
                      {'domain': 'Libre', 'measure': 42},
                    ],
                    fillColor: (barData, index) {
                      switch (barData['domain']) {
                        case 'Libre':
                          return c.primary.withOpacity(0.5);
                        case 'En uso':
                          return c.primary;
                        default:
                          return c.error;
                      }
                    },
                    strokeWidth: 4,
                    labelColor: c.secondary,
                    labelFontSize: 14,
                  ),
                ),
                //
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: c.primary.withOpacity(0.5),
                      radius: size.width * 0.025,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    const Text('Libre'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: c.primary,
                        radius: size.width * 0.025,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      const Text('En uso'),
                    ],
                  ),
                ),
              ],
            ),

            Text(
              'Contenedor Aluminio',
              style: t.subtitle,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Stack(
              children: [
                Container(
                  color: c.surface,
                  height: size.height * 0.26,
                  width: size.width,
                  child: DChartPie(
                    data: const [
                      {'domain': 'En uso', 'measure': 18},
                      {'domain': 'Libre', 'measure': 82},
                    ],
                    fillColor: (barData, index) {
                      switch (barData['domain']) {
                        case 'Libre':
                          return c.primary.withOpacity(0.5);
                        case 'En uso':
                          return c.primary;
                        default:
                          return c.error;
                      }
                    },
                    strokeWidth: 4,
                    labelColor: c.secondary,
                    labelFontSize: 14,
                  ),
                ),
                //
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: c.primary.withOpacity(0.5),
                      radius: size.width * 0.025,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    const Text('Libre'),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.03),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: c.primary,
                        radius: size.width * 0.025,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      const Text('En uso'),
                    ],
                  ),
                ),
              ],
            ),
            //
            SizedBox(
              height: size.height * 0.05,
            ),
          ],
        ));
  }
}
