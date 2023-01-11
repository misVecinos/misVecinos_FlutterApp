import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/graphics_model.dart';

import '../../utils/colors.dart';

class Graphics extends ConsumerStatefulWidget {
  const Graphics({super.key, required this.name, required this.quntity});
  final List<String> name;
  final List<int> quntity;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GraphicsState();
}

class _GraphicsState extends ConsumerState<Graphics> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.25,
      width: size.width,
      child: DChartBar(
        //Insertar datos del back
        data: [
          {
            'id': 'Bar',
            'data': List.generate(
                widget.name.length,
                (index) => Datum(
                        domain: widget.name[index]
                            .substring(0, widget.name.length - 2),
                        measure: widget.quntity[index])
                    .toMap()),
          },
        ],
        domainLabelPaddingToAxisLine: 16,
        barValue: (barData, index) {
          String value = '\$${barData['measure'].toString()}';
          return value;
        },
        barValueColor: c.secondary,
        barValueFontSize: 10,
        borderWidth: 0,
        domainLabelRotation: 0, //
        minimumPaddingBetweenLabel: 5,
        domainAxisTitlePosition: TitlePositionX.bottom,
        axisLineTick: 2,
        axisLinePointTick: 3,
        axisLinePointWidth: 5,
        axisLineColor: c.black,
        measureLabelPaddingToAxisLine: 5,
        barColor: (barData, index, id) {
          if (widget.name.length <= 8) {
            return c.error;
          } else {
            return c.OK;
          }
          // switch (barData['domain']) {
          //   case 'Ingresos':
          //     return c.OK;
          //   case 'Saldo':
          //     return c.primary;
          //   default:
          //     return c.error;
          // }
        },
        showBarValue: true,
      ),
    );
  }
}
