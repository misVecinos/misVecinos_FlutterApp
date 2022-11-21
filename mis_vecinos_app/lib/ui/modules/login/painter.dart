import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'dart:ui' as ui show Image;

class MyPainter extends CustomPainter {
  final ui.Image myBackground;
  MyPainter(this.myBackground);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = Colors.blueGrey);

    final paint = Paint()
      ..color = c.primary
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    final path = Path();

    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(0, size.height * 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
