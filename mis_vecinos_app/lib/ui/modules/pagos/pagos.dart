import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/widgets/minicard.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/pagos_menu.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class PagosPage extends ConsumerStatefulWidget {
  const PagosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<PagosPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
            Text('60', style: t.buttonBlue),
          ],
        ),
        const Divider(thickness: 1),
        SizedBox(
          height: size.height * 0.05,
        ),
        Container(
          color: c.surface,
          height: size.height * 0.2,
          width: size.height * 0.2,
          child: PieChart(
            swapAnimationCurve: Curves.easeIn,
            swapAnimationDuration: const Duration(seconds: 3),
            PieChartData(
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                startDegreeOffset: 5,
                centerSpaceRadius: 15,
                sections: sections),
          ),
        ),
        SizedBox(
          height: size.height * 0.05,
        ),
        //
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MiniCard(
                asset: 'home.png',
                title: 'Al corriente:',
                number: '54',
                style: t.buttonOK),
            MiniCard(
                asset: 'home.png',
                title: 'Con Adeudo:',
                number: '1',
                style: t.buttonCaution),
            MiniCard(
                asset: 'home.png',
                title: 'Adeudo más de 2 meses',
                number: '5',
                style: t.buttonError),
          ],
        ),
        SizedBox(
          height: size.height * 0.03,
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
                    SvgPicture.asset('assets/icons/svg/arrow-forward-ios.svg',
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
  } //

  List<PieChartSectionData> sections = [
    PieChartSectionData(
        badgePositionPercentageOffset: 5,
        color: c.OK,
        value: 90,
        title: '90%',
        titleStyle: t.buttons,
        radius: 50),
    PieChartSectionData(
        color: c.error,
        value: 8.3,
        title: '8.3%',
        titleStyle: t.buttons,
        radius: 50),
    PieChartSectionData(
        color: c.caution,
        value: 1.7,
        title: '1.7%',
        titleStyle: t.buttons,
        radius: 50)
  ];
}
