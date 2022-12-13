import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';
import '../recycle.dart';

Widget buton(BuildContext context, int index) {
  final size = MediaQuery.of(context).size;

  return Consumer(
    builder: ((context, ref, child) {
      return Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            index == 0 ? checkPET(ref, context) : checkAluminium(ref, context);
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: c.disabled.withOpacity(0.4),
                    blurRadius: 20.0,
                    offset: const Offset(1, 1))
              ],
              color: c.secondary,
            ),
            height: size.height * 0.065,
            width: size.width * 0.85,
            child: Center(
              child: Text(
                'Reciclar',
                style: t.buttonBlue2,
              ),
            ),
          ),
        ),
      );
    }),
  );
}

Widget butonDisabled(BuildContext context) {
  final size = MediaQuery.of(context).size;

  return Consumer(
    builder: ((context, ref, child) {
      return Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: null,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: c.disabled.withOpacity(0.4),
                    blurRadius: 20.0,
                    offset: const Offset(1, 1))
              ],
              color: c.disabled.withOpacity(0.1),
            ),
            height: size.height * 0.065,
            width: size.width * 0.85,
            child: Center(
              child: Text(
                'Reciclar',
                style: t.buttonDisabled,
              ),
            ),
          ),
        ),
      );
    }),
  );
}

showMessage(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Ups',
            style: t.subtitle,
          ),
          content: Text(
            'Añade un elemento como mínimo para reciclar.',
            style: t.messages,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar')),
          ],
        );
      });
}
