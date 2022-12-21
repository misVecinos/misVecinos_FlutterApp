import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/controller.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class RecicleTips extends ConsumerStatefulWidget {
  const RecicleTips(
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

class _SponsorWidgetState extends ConsumerState<RecicleTips> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      //height: size.height * .2,
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
                  padding: EdgeInsets.only(top: size.height * 0.005),
                  child: Container(
                    color: c.surface,
                    width: size.width * 0.6,
                    child: Text(widget.content,
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
                            setState(() {
                              ref
                                  .read(tips.notifier)
                                  .removeAtIndex(widget.index);
                            });
                          },
                          style: TextButton.styleFrom(
                              foregroundColor: widget.color),
                          child: Text('No, gracias', style: t.messagesBlack)),
                      SizedBox(width: size.width * 0.02),
                      ElevatedButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     PageRouteAnimator(
                            //       child: Sponsors(color: widget.color),
                            //       routeAnimation:
                            //           RouteAnimation.rightToLeftWithFade,
                            //       curve: Curves.fastOutSlowIn,
                            //       duration: const Duration(milliseconds: 400),
                            //       reverseDuration:
                            //           const Duration(milliseconds: 400),
                            //     ));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: widget.color,
                              foregroundColor: widget.color),
                          child: Text('Más info.', style: t.buttons)),
                      SizedBox(width: size.width * 0.05)
                    ],
                  ),
                ),
                //SizedBox(height: size.height * 0.01),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
