import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'widgets/cards.dart';

class Recycle extends ConsumerStatefulWidget {
  const Recycle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<Recycle> {
  final PageController controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> assets = [
      'assets/bottle.png',
      'assets/can.png',
    ];
    final List<String> names = [
      'PET',
      'Aluminio',
    ];

    return Scaffold(
        body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.135),
          child: PageView.builder(
            controller: controller,
            pageSnapping: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: assets.length,
            itemBuilder: (context, index) {
              return Cards(
                  size: size, assets: assets, names: names, index: index);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: size.height * 0.03, top: size.height * 0.08),
          child: Text(
            '¿Que reciclarás? ',
            style: t.title,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: size.height * 0.03,
              right: size.height * 0.03,
              top: size.height * 0.135),
          child: Text(
            '¡Ayudemos al planeta! \nEs importante que reciclemos nuestra basura si es posible. \n\nElige una de las opciones para reciclar:',
            style: t.messages,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: size.height * 0.23, top: size.height * 0.9),
          child: SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: WormEffect(
                  activeDotColor: c.primary,
                  dotColor: c.disabled,
                  dotHeight: size.height * 0.014,
                  dotWidth: size.height * 0.014)),
        )
      ],
    ));
  }
}
