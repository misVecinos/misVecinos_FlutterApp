import 'package:flutter/material.dart';

import 'colors.dart';

final IText t = _TextStylesMain();

abstract class IText {
  TextStyle get title;
  TextStyle get titleLight;
  TextStyle get medium;
  TextStyle get mediumLight;
  TextStyle get titleApp;
  TextStyle get subtitle;
  TextStyle get paragraph;
  TextStyle get messages;
  TextStyle get messagesLight;
  TextStyle get messagesGreen;
  TextStyle get messagesRed;
  TextStyle get messagesBlue;
  TextStyle get messagesBold;
  TextStyle get buttons;
  TextStyle get buttonBlue;
  TextStyle get buttonBlue2;
  TextStyle get buttonCaution;
  TextStyle get buttonOK;
  TextStyle get buttonError;
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
  TextStyle titleLight = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 26,
      fontWeight: FontWeight.bold,
      color: c.onSecondary);

  @override
  TextStyle medium = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: c.black);

  @override
  TextStyle mediumLight = TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: c.onSecondary);

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
  TextStyle messagesLight = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    color: c.onSecondary,
  );

  @override
  TextStyle messagesBold = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: c.black,
  );
  @override
  TextStyle messagesBlue = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: c.primary,
  );
  @override
  TextStyle messagesRed = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: c.error,
  );
  @override
  TextStyle messagesGreen = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: c.OK,
  );

  @override
  TextStyle buttons = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: c.onSecondary,
  );

  @override
  TextStyle buttonBlue = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: c.primary,
  );

  @override
  TextStyle buttonBlue2 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: c.primary,
  );

  @override
  TextStyle buttonCaution = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: c.caution,
  );

  @override
  TextStyle buttonError = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: c.error,
  );

  @override
  TextStyle buttonOK = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: c.OK,
  );

  @override
  TextStyle link =
      TextStyle(fontFamily: 'Montserrat', fontSize: 16, color: c.primary);

  @override
  TextStyle terms =
      TextStyle(fontFamily: 'Montserrat', fontSize: 14, color: c.disabled);
}
