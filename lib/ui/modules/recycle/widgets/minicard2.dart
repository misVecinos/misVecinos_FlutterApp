import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class MiniCard2 extends StatelessWidget {
  const MiniCard2({
    Key? key,
    required this.asset,
    required this.title,
    required this.number,
  }) : super(key: key);
  final String asset;
  final String title;
  final String number;

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
      height: size.height * .18,
      width: size.width * .28,
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/$asset',
              height: size.height * .08,
              width: size.width * .25,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: t.messagesBold,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text('Este hoy: ',
                    style: t.messages,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(number,
                    style: t.messagesGreen,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text('Este mes: ',
                    style: t.messages,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(number,
                    style: t.messagesGreen,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text('Este año: ',
                    style: t.messages,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(number,
                    style: t.messagesGreen,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
