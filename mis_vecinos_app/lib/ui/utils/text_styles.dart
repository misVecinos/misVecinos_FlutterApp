import 'package:flutter/material.dart';

import 'colors.dart';

final IText t = _TextStylesMain();

abstract class IText {
  TextStyle get title;
  TextStyle get titleApp;
  TextStyle get subtitle;
  TextStyle get paragraph;
  TextStyle get messages;
  TextStyle get buttons;
  TextStyle get link;
  TextStyle get terms;
}

class _TextStylesMain implements IText {
  @override
  TextStyle titleApp = const TextStyle(
    fontFamily: 'Visby CFH',
    fontSize: 40,
  );

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

  @override
  TextStyle link =
      TextStyle(fontFamily: 'Montserrat', fontSize: 16, color: c.primary);

  @override
  TextStyle terms =
      TextStyle(fontFamily: 'Montserrat', fontSize: 14, color: c.disabled);
}
