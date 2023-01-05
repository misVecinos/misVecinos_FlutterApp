library cutout_text_effect;

import 'package:flutter/material.dart';

/// Make cutout effect of your text in an easy way.
class ImageInText extends CustomPainter {
  final String? text;
  final TextStyle? textStyle;
  final TextDirection? textDirection;
  final double? boxRadius;
  final Color? boxBackgroundColor;

  ImageInText({
    @required this.text,
    this.textStyle = const TextStyle(
      fontSize: 40.0,
      fontWeight: FontWeight.w600,
    ),
    this.textDirection = TextDirection.ltr,
    this.boxRadius = 6.0,
    this.boxBackgroundColor = Colors.white,
  }) {
    _textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle,
      ),
      textDirection: textDirection,
    );
    _textPainter!.layout();
  }
  TextPainter? _textPainter;

  @override
  void paint(Canvas canvas, Size size) {
    // Draw the text in the middle of the canvas
    final textOffset =
        size.center(Offset.zero) - _textPainter!.size.center(Offset.zero);
    final textRect = textOffset & _textPainter!.size;
    final displayContent = size.height * size.width;

    // The box surrounding the text should be 10 pixels larger, with 4 pixels corner radius
    final boxRect = RRect.fromRectAndRadius(
        textRect.inflate(1500), Radius.circular(boxRadius!));
    final boxPaint = Paint()
      ..color = boxBackgroundColor!
      ..blendMode = BlendMode.srcOut;

    canvas.saveLayer(boxRect.outerRect, Paint());

    _textPainter!.paint(canvas, textOffset);
    canvas.drawRRect(boxRect, boxPaint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(ImageInText oldDelegate) {
    return true;
  }
}
