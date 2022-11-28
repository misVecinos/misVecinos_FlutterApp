import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/widgets/card2.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class PagosDetails extends ConsumerWidget {
  const PagosDetails(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
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
                Text(title, style: t.title),
              ],
            ),
          ),

          //
          SizedBox(
            height: size.height / 4,
          ),
          //
          const LongCard2(title: 'Casa 8.')
          //
        ],
      ),
    );
  }
}
