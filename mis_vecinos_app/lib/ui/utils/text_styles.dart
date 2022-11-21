import 'package:flutter/material.dart';

import 'colors.dart';

final IText t = _TextStylesMain();

abstract class IText {
  TextStyle get title;
  TextStyle get subtitle;
  TextStyle get paragraph;
  TextStyle get messages;
  TextStyle get buttons;
}

class _TextStylesMain implements IText {
  @override
  TextStyle title = const TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  @override
  TextStyle paragraph = const TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 26,
      fontWeight: FontWeight.bold,
      decorationThickness: 9);

  @override
  TextStyle subtitle = const TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 26,
      fontWeight: FontWeight.bold,
      decorationThickness: 9);

  @override
  TextStyle messages = const TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 26,
      fontWeight: FontWeight.bold,
      decorationThickness: 9);

  @override
  TextStyle buttons = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: c.onSecondary);
}
