import 'package:flutter/material.dart';
import '../../../utils/text_styles.dart';

msjPopup(BuildContext context, String title, String content) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          title: Text(title, style: t.subtitle),
          content: Text(content, style: t.messagesBlack),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Entendido'))
          ],
        );
      });
}
