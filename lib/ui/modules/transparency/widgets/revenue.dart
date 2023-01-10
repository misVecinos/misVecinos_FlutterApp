import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class Revenue extends StatelessWidget {
  const Revenue({super.key, required this.quantity, required this.title});

  final String title;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.02, bottom: size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            //height: size.height * 0.04,
            width: size.width * 0.6,
            color: c.surface,
            child: Text(title, style: t.messagesBlack),
          ),
          const Spacer(),
          Container(
              color: c.surface,
              child: Text('MXN \$$quantity', style: t.messagesGreen)),
        ],
      ),
    );
  }
}
