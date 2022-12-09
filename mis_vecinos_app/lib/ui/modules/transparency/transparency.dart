import 'package:flutter/material.dart';
import 'package:flutter_circle_chart/flutter_circle_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../menu/menu.dart';

class Transparency extends ConsumerStatefulWidget {
  const Transparency({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<Transparency> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //Total ingresado = 100%
    //Total egresado = ?
    //Saldo remanente = ?

    return Scaffold(
      endDrawer: const MenuDrawer(),
      drawerEnableOpenDragGesture: true,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: size.height * 0.025,
            top: size.height * 0.05,
            right: size.height * 0.025),
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/icons/svg/arrow-back-ios.svg',
                    height: size.height * 0.025),
              ),
              SizedBox(width: size.width * 0.01),
              Text('Transparencia', style: t.title),
            ],
          ),
          Text(
            'Mes de Noviembre',
            style: t.messages,
          ),

          // Container(
          //   color: c.OK,
          //   height: size.height * 0.2,
          //   width: size.width * 0.8,
          //   child: PieChart(
          //     separateFocusedValue: true,
          //     textScaleFactor: 0.06,
          //     legendPosition: LegendPosition.Left,
          //     legendTextSize: 10,
          //     legendItemPadding: const EdgeInsets.all(2),
          //     maxHeight: size.height * 0.1,
          //     maxWidth: size.width * 0.8,
          //     curve: Curves.easeIn,
          //     values: const [
          //       14.5,
          //       62.6,
          //       22.9,
          //     ],
          //     labels: const [
          //       'Pago jardineria',
          //       'Pago vigilante',
          //       'Acumulado Total',
          //     ],
          //     sliceFillColors: [
          //       c.error.withOpacity(0.1),
          //       c.error,
          //       c.primary,
          //     ],
          //     animationDuration: const Duration(milliseconds: 1500),
          //   ),
          // ),

          SizedBox(
            height: size.height * 0.04,
          ),

          //
          Text(
            'Ingresos',
            style: t.subtitle,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.02, bottom: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //height: size.height * 0.04,
                  width: size.width * 0.6,
                  color: c.surface,
                  child:
                      Text('Recoleccion de Reciduos:', style: t.messagesBlack),
                ),
                const Spacer(),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.25,
                    color: c.surface,
                    child: Text('MXN \$20.00', style: t.messagesGreen)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.55,
                    color: c.surface,
                    child: Text('Mantenimiento individual:',
                        style: t.messagesBlack)),
                const Spacer(),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.25,
                    color: c.surface,
                    child: Text('MXN \$200.0', style: t.messagesGreen)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.45,
                    color: c.surface,
                    child:
                        Text('Total Mantenimiento:', style: t.messagesBlack)),
                const Spacer(),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.3,
                    color: c.surface,
                    child: Text('MXN \$11,000.00', style: t.messagesGreen)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.55,
                    color: c.surface,
                    child: Text('Remanente de mes anterior:',
                        style: t.messagesBlack)),
                const Spacer(),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.25,
                    color: c.surface,
                    child: Text('MXN \$0.00', style: t.messagesGreen)),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.4,
                    color: c.surface,
                    child: Text('Total ingresado:', style: t.messagesBlack)),
                const Spacer(),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.3,
                    color: c.surface,
                    child: Text('MXN \$11,020.00', style: t.messagesGreen)),
              ],
            ),
          ),
          const Divider(),
          Text(
            'Egresos',
            style: t.subtitle,
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.4,
                    color: c.surface,
                    child: Text('Pago de jardineria:', style: t.messagesBlack)),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.3,
                    color: c.surface,
                    child: Text('MXN \$1,600.00', style: t.messagesRed)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.4,
                    color: c.surface,
                    child: Text('Pago de vigilante:', style: t.messagesBlack)),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.3,
                    color: c.surface,
                    child: Text('MXN \$6,900.00', style: t.messagesRed)),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.4,
                    color: c.surface,
                    child: Text('Total egresado:', style: t.messagesBlack)),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.3,
                    color: c.surface,
                    child: Text('MXN \$8,500.00', style: t.messagesRed)),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.5,
                    color: c.surface,
                    child:
                        Text('Saldo Acomulado Total:', style: t.messagesBlack)),
                Container(
                    //height: size.height * 0.04,
                    width: size.width * 0.3,
                    color: c.surface,
                    child: Text('MXN \$2,520.00', style: t.messagesBlue)),
              ],
            ),
          ),
          const Divider(),

          CircleChart(
              items: [
                CircleChartItemData(
                    color: c.error.withOpacity(0.5),
                    value: 14.5,
                    name: 'Pago de Jardineria',
                    description: 'Pago por la limpieza de jardineria.'),
                CircleChartItemData(
                    color: c.error,
                    value: 62.6,
                    name: 'Pago de Jardineria',
                    description: 'Pago por la limpieza de jardineria.'),
                CircleChartItemData(
                    color: c.primary,
                    value: 22.9,
                    name: 'Pago de Jardineria',
                    description: 'Pago por la limpieza de jardineria.'),
              ],
              backgroundColor: c.disabled.withOpacity(0.5),
              chartType: CircleChartType.solid),

          SizedBox(height: size.height * 0.1)
        ],
      ),
    );
  }
}
