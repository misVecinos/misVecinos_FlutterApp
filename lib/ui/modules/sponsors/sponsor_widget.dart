import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/sponsors/sponsor.dart';
import 'package:page_route_animator/page_route_animator.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'controller.dart';

class SponsorWidget extends ConsumerStatefulWidget {
  const SponsorWidget(
      {required this.asset,
      required this.title,
      required this.content,
      required this.color,
      required this.index,
      super.key});
  final String asset;
  final String title;
  final String content;
  final Color color;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SponsorWidgetState();
}

class _SponsorWidgetState extends ConsumerState<SponsorWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.11,
      width: size.width,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60)),
            child: Container(
              width: size.width * 0.22,
              height: size.height,
              color: c.secondary,
              child: Image.asset(
                widget.asset,
                fit: BoxFit.contain,
              ),
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(left: size.height * 0.015),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: size.height * 0.005),
                  child: Text(widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: t.messagesBold),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, right: size.height * 0.005),
                  child: Container(
                    color: c.surface,
                    width: size.width * 0.6,
                    child: Text(widget.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: t.messagesBlack),
                  ),
                ),
                //
                Row(
                  children: [
                    //
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            ref
                                .read(sponsors.notifier)
                                .removeAtIndex(widget.index);
                          });
                        },
                        child: Text('No, gracias', style: t.messagesBold)),
                    //
                    SizedBox(
                      width: size.height * 0.015,
                    ),
                    //
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteAnimator(
                              child: Sponsors(color: widget.color),
                              routeAnimation:
                                  RouteAnimation.rightToLeftWithFade,
                              curve: Curves.fastOutSlowIn,
                              duration: const Duration(milliseconds: 400),
                              reverseDuration:
                                  const Duration(milliseconds: 400),
                            ));
                      },
                      child: Center(
                        child: Text('Más info.',
                            style: TextStyle(
                                color: c.primary.withOpacity(0.7),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    //
                  ],
                ),
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
