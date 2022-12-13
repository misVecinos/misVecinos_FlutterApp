import 'package:flutter_riverpod/flutter_riverpod.dart';

final indexPET = StateNotifierProvider<Increase, int>((_) => Increase(0));
final indexAluminium = StateNotifierProvider<Increase, int>((_) => Increase(0));

class Increase extends StateNotifier<int> {
  Increase(super.state);

  int add() {
    return state++;
  }

  int substract() {
    if (state == 0) {
      return state;
    } else {
      return state--;
    }
  }

  int reset() {
    return state = 0;
  }
}

final listItemsPET = StateNotifierProvider<Items, List<int>>((_) => Items([]));
final listItemsAluminium =
    StateNotifierProvider<Items, List<int>>((_) => Items([]));

class Items extends StateNotifier<List<int>> {
  Items(super.state);

  void recicleItems(int items) {
    state.add(items);
  }
}

final listItemsDatesPET =
    StateNotifierProvider<ItemsDates, List<DateTime>>((_) => ItemsDates([]));
final listItemsDatesAluminium =
    StateNotifierProvider<ItemsDates, List<DateTime>>((_) => ItemsDates([]));

class ItemsDates extends StateNotifier<List<DateTime>> {
  ItemsDates(super.state);

  void recicleItems(DateTime itemsDate) {
    state.add(itemsDate);
  }
}
