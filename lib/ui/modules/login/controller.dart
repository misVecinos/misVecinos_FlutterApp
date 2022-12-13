import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/colors.dart';

//final authorize = StateNotifierProvider<Auth, bool>((_) => Auth(false));
final userAuth = StateNotifierProvider<Auth, bool>((_) => Auth(false));
final passAuth = StateNotifierProvider<Auth, bool>((_) => Auth(false));

final obscurePassword = StateNotifierProvider<Auth, bool>((_) => Auth(true));
final loading = StateNotifierProvider<Auth, bool>((_) => Auth(false));

class Auth extends StateNotifier<bool> {
  Auth(super.state);

  bool ok() {
    return state = true;
  }

  bool denied() {
    return state = false;
  }

  bool refreshState() {
    return state = !state;
  }
}

final user =
    StateNotifierProvider<SetColors, Color>((_) => SetColors(c.disabled));
final pass =
    StateNotifierProvider<SetColors, Color>((_) => SetColors(c.disabled));

class SetColors extends StateNotifier<Color> {
  SetColors(super.state);

  Color defaul() {
    return state = c.disabled;
  }

  Color ok() {
    return state = c.primary;
  }

  Color denied() {
    return state = c.error;
  }
}
