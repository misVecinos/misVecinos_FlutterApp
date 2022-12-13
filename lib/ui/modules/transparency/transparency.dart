import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transparencia', style: t.title),
            Text('Mes de Noviembre', style: t.messages),
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
            height: size.height * 0.02,
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
                    color: c.surface,
                    child: Text('MXN \$2,520.00', style: t.messagesBlue)),
              ],
            ),
          ),
          const Divider(),

          // CircleChart(
          //     items: [
          //       CircleChartItemData(
          //           color: c.error.withOpacity(0.5),
          //           value: 14.5,
          //           name: 'Pago de Jardineria',
          //           description: 'Pago por la limpieza de jardineria.'),
          //       CircleChartItemData(
          //           color: c.error,
          //           value: 62.6,
          //           name: 'Pago de Jardineria',
          //           description: 'Pago por la limpieza de jardineria.'),
          //       CircleChartItemData(
          //           color: c.primary,
          //           value: 22.9,
          //           name: 'Pago de Jardineria',
          //           description: 'Pago por la limpieza de jardineria.'),
          //     ],
          //     backgroundColor: c.disabled.withOpacity(0.5),
          //     chartType: CircleChartType.solid),

          SizedBox(
            height: size.height * 0.25,
            child: DChartBar(
              data: const [
                {
                  'id': 'Bar',
                  'data': [
                    {'domain': 'Ingresos', 'measure': 11020},
                    {'domain': 'P. Jardineria', 'measure': 1600},
                    {'domain': 'P. Vigilante', 'measure': 6900},
                    {'domain': 'Saldo', 'measure': 2520},
                  ],
                },
              ],
              domainLabelPaddingToAxisLine: 16,
              axisLineTick: 2,
              axisLinePointTick: 2,
              axisLinePointWidth: 10,
              axisLineColor: c.black,
              measureLabelPaddingToAxisLine: 16,
              barColor: (barData, index, id) {
                switch (barData['domain']) {
                  case 'Ingresos':
                    return c.OK;
                  case 'Saldo':
                    return c.primary;
                  default:
                    return c.error;
                }
              },
              showBarValue: true,
            ),
          ),

          SizedBox(height: size.height * 0.1)
        ],
      ),
    );
  }
}
