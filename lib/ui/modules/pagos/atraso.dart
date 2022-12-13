import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/widgets/card2.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'controller.dart';

class Atraso extends ConsumerWidget {
  const Atraso({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final state = ref.watch(pagosControllerProvider);
    //Recibir la lista de las casas al corriente / con atraso

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
                Text('Viviendas con \n adeudo', style: t.title),
              ],
            ),
          ),

          //
          SizedBox(
            height: size.height * 0.04,
          ),
          //
          Text(
            'Menos de 2 meses de atraso:',
            style: t.messagesBold,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.atrasadas?.length,
              itemBuilder: (context, index) {
                return LongCard2(
                  title: state.atrasadas![index].nombreCasa,
                  mesesAtraso:
                      '${state.atrasadas![index].mesesAtraso.toString()} meses.',
                );
              }),

          Text(
            'Más de 2 meses de atraso:',
            style: t.messagesBold,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.atrasadasMas2Meses?.length,
              itemBuilder: (context, index) {
                return LongCard2(
                  title: state.atrasadasMas2Meses![index].nombreCasa,
                  mesesAtraso:
                      '${state.atrasadasMas2Meses![index].mesesAtraso.toString()} meses.',
                );
              }),

          //
        ],
      ),
    );
  }
}
