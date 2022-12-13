import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class ShadowCard extends StatelessWidget {
  const ShadowCard({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: c.disabled.withOpacity(0.4),
                blurRadius: 20.0,
                offset: const Offset(1, 1))
          ],
          color: const Color(0xffFDFDFD),
        ),
        height: size.height * .17,
        width: size.width * .85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * .005,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(title, style: t.subtitle),
                SvgPicture.asset('assets/icons/svg/arrow-forward-ios.svg',
                    color: c.black),
              ],
            ),
            Text('Vivendas en el fraccionamiento.', style: t.messages),
            SizedBox(
              height: size.height * .005,
            ),
          ],
        ),
      ),
    );
  }
}
