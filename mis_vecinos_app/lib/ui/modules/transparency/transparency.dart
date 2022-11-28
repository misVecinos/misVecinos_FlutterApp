import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class Transparency extends ConsumerStatefulWidget {
  const Transparency({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<Transparency> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: size.height * 0.025,
            top: size.height * 0.05,
            right: size.height * 0.025),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Cuentas Claras', style: t.title),
              SvgPicture.asset('assets/icons/svg/menu.svg', color: c.black),
            ],
          ),
          Text(
            'Mes de Noviembre',
            style: t.messages,
          ),
          SizedBox(
            height: size.height * 0.05,
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
                Text('Recoleccion de Reciduos:', style: t.messages),
                Text('MXN \$20.0', style: t.messagesGreen),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Mantenimiento individual:', style: t.messages),
                Text('MXN \$200.0', style: t.messagesGreen),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Mantenimiento:', style: t.messages),
                Text('MXN \$11,000.00', style: t.messagesGreen),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Remanente de mes anterior:', style: t.messages),
                Text('MXN \$0.00', style: t.messagesGreen),
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
                Text('Total ingresado:', style: t.messages),
                Text('MXN \$1020.00', style: t.messagesGreen),
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
                Text('Pago de jardineria:', style: t.messages),
                Text('MXN \$1600.00', style: t.messagesRed),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pago de vigilante:', style: t.messages),
                Text('MXN \$6,900.00', style: t.messagesRed),
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
                Text('Saldo Acomulado Total:', style: t.messages),
                Text('MXN \$2,520.00', style: t.messagesBlue),
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
