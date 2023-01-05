import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../utils/colors.dart';
import 'clipper.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return DropShadow(
      borderRadius: 0,
      offset: const Offset(1, 1),
      spread: 0,
      opacity: 0.7,
      child: ClipPath(
        clipper: MyCustomClipper(),
        child: Stack(
          children: [
            SizedBox(
                height: size.height * 0.5,
                width: size.width,
                child: ImageSlideshow(
                    autoPlayInterval: 5000,
                    isLoop: true,
                    children: [
                      Image.asset(
                        'assets/images/5.jpeg',
                        height: size.height * 0.5,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/3.jpeg',
                        height: size.height * 0.5,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/1.jpeg',
                        height: size.height * 0.5,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
                    ])),
            Container(
                height: size.height * 0.5,
                width: size.width,
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
      ),
    );
  }
}
