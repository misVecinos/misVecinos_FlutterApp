import 'package:flutter_riverpod/flutter_riverpod.dart';

final load = StateNotifierProvider<Load, bool>((_) => Load(true));

class Load extends StateNotifier<bool> {
  Load(super.state);

  bool loading() {
    return state = true;
  }

  bool saved() {
    return state = false;
  }

  bool refreshState() {
    return state = !state;
  }
}
