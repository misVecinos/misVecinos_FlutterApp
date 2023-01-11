import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class Acumulated extends StatelessWidget {
  const Acumulated({super.key, required this.quantity, required this.title});

  final String title;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: 0, bottom: size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  color: c.surface,
                  child: Text('\$$quantity MXN',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: c.primary,
                      ))),
              Container(
                color: c.surface,
                child: Text(title, style: t.messagesBlack),
              ),
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.help_outlined, color: c.disabled))
        ],
      ),
    );
  }
}
