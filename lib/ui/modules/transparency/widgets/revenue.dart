import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class Revenue extends StatelessWidget {
  const Revenue({super.key, required this.quantity, required this.title});

  final String title;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.01, bottom: size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //height: size.height * 0.04,
            width: size.width * 0.55,
            color: c.surface,
            child: Text(title, style: t.messagesBlack),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: c.surface,
                  child: Text('\$${quantity.toString()} MXN',
                      style: t.messagesGreen)),
            ],
          ),
        ],
      ),
    );
  }
}
