import 'package:d_chart/d_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'widgets/text_egreso.dart';

class TransparencyDetails extends ConsumerStatefulWidget {
  const TransparencyDetails(
      {required this.month, required this.index, super.key});
  final String month;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransparencyDetailsState();
}

class _TransparencyDetailsState extends ConsumerState<TransparencyDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //Total ingresado = 100%
    //Total egresado = ?
    //Saldo remanente = ?

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
          left: size.height * 0.025, top: 0, right: size.height * 0.025),
      children: [
        //

        SizedBox(
          height: size.height * 0.02,
        ),

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
                child: Text('Recoleccion de Reciduos:', style: t.messagesBlack),
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
                  child: Text('Total Mantenimiento:', style: t.messagesBlack)),
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

        //---------

        const TextEgreso(egreso: 'Pago Jardinero', cantidad: '1600'),

        // Padding(
        //   padding: EdgeInsets.only(
        //       top: size.height * 0.01, bottom: size.height * 0.015),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //           //height: size.height * 0.04,
        //           width: size.width * 0.4,
        //           color: c.surface,
        //           child: Text('Pago de jardineria:', style: t.messagesBlack)),
        //       Container(
        //           color: c.surface,
        //           child: Text('MXN \$1,600.00', style: t.messagesRed)),
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(
        //       top: size.height * 0.01, bottom: size.height * 0.015),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //           //height: size.height * 0.04,
        //           width: size.width * 0.4,
        //           color: c.surface,
        //           child: Text('Pago de vigilante:', style: t.messagesBlack)),
        //       Container(
        //           color: c.surface,
        //           child: Text('MXN \$6,900.00', style: t.messagesRed)),
        //     ],
        //   ),
        // ),
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
    );
  }
}
