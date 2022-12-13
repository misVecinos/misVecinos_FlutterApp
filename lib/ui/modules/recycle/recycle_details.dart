import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/widgets/minicard2.dart';
import 'package:multi_charts/multi_charts.dart';

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
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              left: size.height * 0.025, top: 0, right: size.height * 0.025),
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),

            MiniCard2(
                asset: 'bottle.png',
                title: 'PET',
                number: listPET.isEmpty
                    ? 'Vacio'
                    : listPET
                        .reduce((value, element) => value + element)
                        .toString()),

            SizedBox(
              height: size.height * 0.02,
            ),

            MiniCard2(
                asset: 'can.png',
                title: 'Aluminio',
                number: listAluminium.isEmpty
                    ? 'Vacio'
                    : listAluminium
                        .reduce((value, element) => value + element)
                        .toString()),

            SizedBox(
              height: size.height * 0.02,
            ),

            Text(
              'Contenedor PET',
              style: t.subtitle,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              color: c.surface,
              height: size.height * 0.25,
              width: size.width * 0.8,
              child: PieChart(
                separateFocusedValue: true,
                textScaleFactor: 0.06,
                legendPosition: LegendPosition.Left,
                legendTextSize: 10,
                legendItemPadding: const EdgeInsets.all(2),
                maxHeight: size.height * 0.1,
                maxWidth: size.width * 0.8,
                curve: Curves.easeIn,
                values: const [
                  42,
                  58,
                ],
                labels: const [
                  'Libre',
                  'En uso',
                ],
                sliceFillColors: [
                  c.primary,
                  c.error,
                ],
                animationDuration: const Duration(milliseconds: 1500),
              ),
            ),
            SizedBox(
              height: size.height * 0.1,
            ),

            Text(
              'Contenedor Aluminio',
              style: t.subtitle,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Container(
              color: c.surface,
              height: size.height * 0.25,
              width: size.width * 0.8,
              child: PieChart(
                separateFocusedValue: true,
                textScaleFactor: 0.06,
                legendPosition: LegendPosition.Left,
                legendTextSize: 10,
                legendItemPadding: const EdgeInsets.all(2),
                maxHeight: size.height * 0.1,
                maxWidth: size.width * 0.8,
                curve: Curves.easeIn,
                values: const [
                  82,
                  18,
                ],
                labels: const [
                  'Libre',
                  'En uso',
                ],
                sliceFillColors: [
                  c.primary,
                  c.error,
                ],
                animationDuration: const Duration(milliseconds: 1500),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            // ListView.builder(
            //     shrinkWrap: true,
            //     physics: const NeverScrollableScrollPhysics(),
            //     itemCount: ref.watch(listItemsPET).length,
            //     itemBuilder: (context, index) {
            //       return Text(listItems.isEmpty
            //           ? 'Añade algunos elementos. La lista está vacia.'
            //           : listItems[index].toString());
            //     }),
          ],
        ));
  }
}
