import 'package:flutter/material.dart';

final IColors c = _ColorsMain();

abstract class IColors {
  Brightness get brightness;
  Color get disabled;
  Color get primary;
  Color get secondary;
  Color get onSecondary;
  Color get error;
  Color get caution;
  Color get black;
  Color get alarmBack;
  Color get surface;
}

class _ColorsMain implements IColors {
  @override
  Brightness brightness = Brightness.light;
  @override
  Color primary = const Color(0xff2E75F7);

  @override
  Color secondary = const Color(0xffffffff);

  @override
  Color disabled = const Color(0xffAFAFAF);

  @override
  Color onSecondary = const Color(0xffffffff);

  @override
  Color error = const Color(0xffC5283D);

  @override
  Color caution = const Color(0xffFABC2A);

  @override
  Color black = const Color(0xff383838);

  @override
  Color alarmBack = const Color(0xfff0cece);

  @override
  Color surface = Colors.transparent;
}
