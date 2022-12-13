import 'package:flutter_riverpod/flutter_riverpod.dart';

final color =
    StateNotifierProvider<ColorTransition, bool>((_) => ColorTransition(false));

class ColorTransition extends StateNotifier<bool> {
  ColorTransition(super.state);

  bool forward() {
    return state = true;
  }

  bool stop() {
    return state = false;
  }

  bool refreshState() {
    return state = !state;
  }
}
