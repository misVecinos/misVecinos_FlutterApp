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
        height: size.height * .176,
        width: size.width * .92,
        decoration: BoxDecoration(
          color: c.primary.withOpacity(0.25),
          borderRadius: BorderRadius.circular(14),

          //color: const Color(0xffFDFDFD),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.005),
              child: Container(
                height: size.height * .11,
                width: size.width * .89,
                decoration: BoxDecoration(
                  color: c.surface,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.08,
                      backgroundImage:
                          const AssetImage('assets/images/composta.jpg'),
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Ayuda al planeta, Hagamos composta!',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: t.messagesBold),
                          Text(
                              'Unete a nuestro movimiento. Hagamos composta y ayudemos al planeta.',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: t.messagesBlack),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .05,
              width: size.width * .89,
              child: FittedBox(
                fit: BoxFit.cover,
                clipBehavior: Clip.hardEdge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: size.width * 0.4),
                    TextButton(
                        onPressed: () {
                          ref.read(sponsor.notifier).delete();
                        },
                        child: Text('No, gracias', style: t.messagesBlack)),
                    SizedBox(width: size.width * 0.02),
                    SizedBox(
                      width: size.width * 0.3,
                      height: size.height * 0.045,
                      child: ElevatedButton(
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
                    ),
                    SizedBox(width: size.width * 0.05)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
