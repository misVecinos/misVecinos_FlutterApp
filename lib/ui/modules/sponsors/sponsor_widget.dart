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
      //width: size.width * .92,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(60),
                bottomRight: Radius.circular(60)),
            child: SizedBox(
              //width: size.width * 0.23,
              //height: size.height * .15,
              child: Image.asset(
                widget.asset,
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
                  child: Text(widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: t.messagesBold),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.005, right: size.height * 0.005),
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
                const Spacer(),
                //
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // SizedBox(width: size.width * 0.05),
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
                    // SizedBox(width: size.width * 0.02),
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
                                  color: widget.color,
                                  fontWeight: FontWeight.bold))),
                    ),
                    // SizedBox(width: size.width * 0.05)
                  ],
                ),
                //SizedBox(height: size.height * 0.01),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
