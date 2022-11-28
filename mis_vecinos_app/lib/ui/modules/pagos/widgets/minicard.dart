import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class MiniCard extends StatelessWidget {
  const MiniCard(
      {Key? key,
      required this.asset,
      required this.title,
      required this.number,
      required this.style})
      : super(key: key);
  final String asset;
  final String title;
  final String number;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
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
      height: size.height * .215,
      width: size.width * .28,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/$asset',
            height: size.height * .1,
            width: size.width * .25,
          ),
          Text(title,
              style: t.messages,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
          Text(number, style: style),
        ],
      ),
    );
  }
}
