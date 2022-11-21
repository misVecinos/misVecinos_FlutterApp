import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

import '../../utils/colors.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return WidgetMask(
      childSaveLayer: false,
      blendMode: BlendMode.srcATop,
      mask: Image.asset(
        'assets/images/back2.png',
        height: 400,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      child: Stack(
        children: [
          Image.asset(
            'assets/images/5.jpeg',
            height: 400,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [
                  0.1,
                  0.2,
                  0.8,
                ],
                colors: [
                  c.primary.withOpacity(0.1),
                  c.primary.withOpacity(0.2),
                  c.primary.withOpacity(0.6),
                ],
              ))),
        ],
      ),
    );
  }
}
