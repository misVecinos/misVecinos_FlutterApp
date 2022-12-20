// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/utils/utils.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class TextEgreso extends ConsumerWidget {
  const TextEgreso({required this.egreso, required this.cantidad, super.key});
  final String egreso;
  final String cantidad;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: Text(egreso, style: t.messagesBlack)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.attachment)),
          Container(color: c.surface, child: quantity()),
        ],
      ),
    );
  }

  Widget quantity() {
    return Text(toMxn(cantidad), style: t.messagesRed);
  }
}
