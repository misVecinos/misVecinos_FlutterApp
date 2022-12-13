import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/colors.dart';

class BackgroundImage extends ConsumerWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.25,
          width: size.width,
          child: Image.asset(
            'assets/images/laJoya.jpg',
            fit: BoxFit.cover,
          ),
          // child: const Placeholder(),
        ),
        Container(
          height: size.height * 0.25,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.3,
              0.6,
              0.95,
            ],
            colors: [
              c.secondary.withOpacity(0.3),
              c.secondary.withOpacity(0.65),
              c.secondary,
            ],
          )),
        )
      ],
    );
  }
}
