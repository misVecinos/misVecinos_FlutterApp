import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/widgets/card.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/pagos_details.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class PagosMenu extends ConsumerWidget {
  const PagosMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: size.height * 0.025,
            top: size.height * 0.05,
            right: size.height * 0.025),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/svg/arrow-back-ios.svg',
                    color: c.black),
                Text('Detalles', style: t.title),
              ],
            ),
          ),

          //
          SizedBox(
            height: size.height / 4,
          ),

          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PagosDetails('Viviendas al \n corriente');
                }));
              },
              child: const ShadowCard(title: 'Viviendas al \n corriente')),
          //
          SizedBox(
            height: size.height * 0.025,
          ),
          //
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const PagosDetails('Viviendas con \n adeudo');
                }));
              },
              child: const ShadowCard(title: 'Viviendas con \n adeudo')),
        ],
      ),
    );
  }
}
