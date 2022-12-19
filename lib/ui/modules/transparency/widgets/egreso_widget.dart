// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class EgresosWidget extends StatefulWidget {
  const EgresosWidget(
      {required this.egreso, required this.cantidad, super.key});
  final String egreso;
  final String cantidad;

  @override
  State<EgresosWidget> createState() => _EgresosWidgetState();
}

class _EgresosWidgetState extends State<EgresosWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.01, bottom: size.height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              //height: size.height * 0.04,
              width: size.width * 0.4,
              color: c.surface,
              child: Text(widget.egreso, style: t.messagesBlack)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.attachment)),
          const Spacer(),
          Container(
              color: c.surface,
              child: Text(toMxn(widget.cantidad), style: t.messagesRed)),
        ],
      ),
    );
  }

  toMxn(String quantity) {
    if (quantity.length == 3) {
      print('OKAY: $quantity.00');
      return 'MXN \$$quantity.00';
      //
    } else if (quantity.length == 4) {
      for (int i = 0; i < quantity.length; i++) {
        quantity = quantity.replaceRange(
            1, null, '${quantity[0]},${quantity.substring(1)}');
      }
      print('OKAY: $quantity');
      return 'MXN \$$quantity.00';
    }

    return 'MXN \$00.00';
  }
}
