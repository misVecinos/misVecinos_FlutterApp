import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class Cards extends ConsumerWidget {
  const Cards(
      {Key? key,
      required this.index,
      required this.size,
      required this.assets,
      required this.names})
      : super(key: key);

  final int index;
  final Size size;
  final List<String> assets;
  final List<String> names;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Ink(
        height: size.height * 0.38,
        width: size.width * 0.7,
        decoration: BoxDecoration(
          color: const Color(0xffFDFDFD),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: c.disabled.withOpacity(0.4),
                blurRadius: 20.0,
                offset: const Offset(1, 1))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              assets[index],
              height: size.height * 0.25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  names[index],
                  style: t.medium,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    // top: size.height * 0.35,
                    left: size.height * 0.02,
                  ),
                  child: CircleAvatar(
                    radius: size.height * 0.03,
                    backgroundColor: c.primary,
                    child: Icon(
                      Icons.add,
                      color: c.secondary,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
