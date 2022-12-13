import 'package:flutter_riverpod/flutter_riverpod.dart';

final sponsor = StateNotifierProvider<See, bool>((_) => See(true));

class See extends StateNotifier<bool> {
  See(super.state);

  bool visible() {
    return state = true;
  }

  bool delete() {
    return state = false;
  }

  bool refreshState() {
    return state = !state;
  }
}
