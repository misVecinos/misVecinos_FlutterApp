import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/state.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/widgets/minicard.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/pagos_menu.dart';
import 'package:multi_charts/multi_charts.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'controller.dart';

class PagosPage extends ConsumerStatefulWidget {
  const PagosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<PagosPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Acordarse de watch, read y listen tienen distintas implicaciones
      final provider = ref.read(pagosControllerProvider.notifier);
      provider.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = ref.watch(pagosControllerProvider);

    int housesAlCorriente = state.alCorriente?.length ?? 0;
    int housesAtrasadas = state.atrasadas?.length ?? 0;
    int housesAtrasadas2 = state.atrasadasMas2Meses?.length ?? 0;

    int totalHouses = housesAtrasadas + housesAlCorriente + housesAtrasadas2;

    //Total casas = 100%
    //Al corriente = ?
    //Con adeudo = ?
    //Con adeudo mas de 2meses = ?

    switch (state.state) {
      case States.loading:
        return const Center(child: CircularProgressIndicator());

      case States.succes:
        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
              left: size.height * 0.025,
              top: size.height * 0.025,
              right: size.height * 0.025),
          children: [
            Text('Adeudos', style: t.title),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text('Viviendas en el fraccionamiento:', style: t.messages),
            Row(
              children: [
                Text('La Joya', style: t.medium),
                const Spacer(),
                Text(totalHouses.toString(), style: t.buttonBlue),
              ],
            ),
            const Divider(thickness: 1),

            Container(
              color: c.surface,
              height: size.height * 0.3,
              width: size.width,
              child: FittedBox(
                fit: BoxFit.contain,
                child: PieChart(
                  // maxHeight: size.height * 0.2,
                  maxWidth: size.width,
                  separateFocusedValue: false,
                  legendItemPadding: const EdgeInsets.all(0),
                  textScaleFactor: 0.06,
                  legendTextSize: 15,
                  curve: Curves.easeIn,
                  showLegend: true,
                  values: const [74, 3.8, 22.2],
                  labels: const [
                    'Al corriente',
                    'Adeudo',
                    'Adeudo 2m',
                  ],
                  sliceFillColors: [
                    c.OK,
                    c.caution,
                    c.error,
                  ],
                  animationDuration: const Duration(seconds: 2),
                  legendPosition: LegendPosition.Right,
                ),
              ),
            ),

            SizedBox(
              height: size.height * 0.03,
            ),
            //
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MiniCard(
                    asset: 'home.png',
                    title: 'Al corriente:',
                    number: state.alCorriente!.length.toString(),
                    style: t.buttonOK),
                MiniCard(
                    asset: 'home.png',
                    title: 'Con Adeudo:',
                    number: state.atrasadas!.length.toString(),
                    style: t.buttonCaution),
                MiniCard(
                    asset: 'home.png',
                    title: 'Adeudo más de 2 meses',
                    number: state.atrasadasMas2Meses!.length.toString(),
                    style: t.buttonError),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            //
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                width: size.width * 0.3,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const PagosMenu();
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Detalles', style: t.buttonBlue2),
                        SvgPicture.asset(
                            'assets/icons/svg/arrow-forward-ios.svg',
                            color: c.primary)
                      ],
                    ),
                  ),
                ),
              ),
            )
            //
          ],
        );

      case States.error:
        return Center(
          child: Text(States.error.name),
        );
    }
  } //

}
