import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class Expense extends StatelessWidget {
  const Expense(
      {super.key,
      required this.quantity,
      required this.title,
      required this.asset});

  final String title;
  final String quantity;
  final String asset;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.01, bottom: size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.45,
            color: c.surface,
            child: Text(title, style: t.messagesBlack),
          ),
          const Spacer(),
          Container(
              color: c.surface,
              child: Text('\$$quantity MXN', style: t.messagesRed)),
          GestureDetector(
            onTap: () {
              //
              final imageProvider = Image.asset(asset).image;
              showImageViewer(context, imageProvider,
                  backgroundColor: c.black.withOpacity(0.6),
                  swipeDismissible: true);
            },
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 0),
                child: Icon(Icons.attachment, color: c.disabled)),
          ),
        ],
      ),
    );
  }
}

class Expense2 extends StatelessWidget {
  const Expense2({super.key, required this.quantity, required this.title});

  final String title;
  final String quantity;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding:
          EdgeInsets.only(top: size.height * 0.01, bottom: size.height * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width * 0.45,
            color: c.surface,
            child: Text(title, style: t.messagesBlack),
          ),
          const Spacer(),
          Container(
              color: c.surface,
              child: Text('\$$quantity MXN', style: t.messagesRed)),
        ],
      ),
    );
  }
}
