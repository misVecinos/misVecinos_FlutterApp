import 'package:flutter_riverpod/flutter_riverpod.dart';

//final authorize = StateNotifierProvider<Auth, bool>((_) => Auth(false));
final animate1 = StateNotifierProvider<Animate, bool>((_) => Animate(true));
final valid = StateNotifierProvider<Animate, bool>((_) => Animate(false));

class Animate extends StateNotifier<bool> {
  Animate(super.state);

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
