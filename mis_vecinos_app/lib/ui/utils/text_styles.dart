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
    color: Colors.black,
  );

  @override
  TextStyle title = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: c.black);

  @override
  TextStyle paragraph = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: c.black,
  );

  @override
  TextStyle subtitle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: c.black,
  );

  @override
  TextStyle messages = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    color: c.disabled,
  );

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
