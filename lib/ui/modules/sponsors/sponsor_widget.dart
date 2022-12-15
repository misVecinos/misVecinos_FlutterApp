import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/sponsors/sponsor.dart';
import 'package:page_route_animator/page_route_animator.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'controller.dart';

class SponsorWidget extends ConsumerWidget {
  const SponsorWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
          top: size.height * 0.005, bottom: size.height * 0.015),
      child: Container(
        height: size.height * .125,
        //width: size.width * .92,
        decoration: BoxDecoration(
          color: c.primary.withOpacity(0.25),
          borderRadius: BorderRadius.circular(14),

          //color: const Color(0xffFDFDFD),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(60),
                  bottomRight: Radius.circular(60)),
              child: SizedBox(
                width: size.width * 0.23,
                height: size.height * .15,
                child: Image.asset(
                  'assets/images/composta.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //
            Padding(
              padding: EdgeInsets.only(left: size.height * 0.015),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.005),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.005),
                    child: Text('¡Hagamos composta!',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: t.messagesBold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.005),
                    child: Container(
                      color: c.surface,
                      width: size.width * 0.6,
                      child: Text(
                          'Hagamos composta y ayudemos al planeta. ¡Únete!',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: t.messagesBlack),
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.05),
                        TextButton(
                            onPressed: () {
                              ref.read(sponsor.notifier).delete();
                            },
                            child: Text('No, gracias', style: t.messagesBlack)),
                        SizedBox(width: size.width * 0.02),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageRouteAnimator(
                                    child: const Sponsors(),
                                    routeAnimation:
                                        RouteAnimation.rightToLeftWithFade,
                                    curve: Curves.fastOutSlowIn,
                                    duration: const Duration(milliseconds: 400),
                                    reverseDuration:
                                        const Duration(milliseconds: 400),
                                  ));
                            },
                            child: Text('Más info.', style: t.buttons)),
                        SizedBox(width: size.width * 0.05)
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.008),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
