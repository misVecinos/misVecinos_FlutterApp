import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/core/modules/recycle/service.dart';

import '../../../core/modules/recycle/history.dart';
import '../../../core/modules/sponsors/sponsor.dart';
import '../../../core/providers/providers.dart';
import 'state.dart';

final recycleControllerProvider =
    StateNotifierProvider<RecycleControllerNotifier, RecycleState>((ref) {
  final service = ref.watch(recycleServiceProvider);
  return RecycleControllerNotifier(service);
});

class RecycleControllerNotifier extends StateNotifier<RecycleState> {
  final RecycleService recycleService;

  RecycleControllerNotifier(this.recycleService) : super(const RecycleState());

  void init() {
    _getHistory();
  }

  void _getHistory() async {
    //tratar response
    History history = await recycleService.getHistory();
    state = state.copyWith(state: States.succes);
    state = state.copyWith(state: States.succes, listHistory: history);
  }
}

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

// final listItemsPET = StateNotifierProvider<Items, List<int>>((_) => Items([]));
// final listItemsAluminium =
//     StateNotifierProvider<Items, List<int>>((_) => Items([]));

// class Items extends StateNotifier<List<int>> {
//   Items(super.state);

//   void recicleItems(int items) {
//     state.add(items);
//   }
// }

// final listItemsDatesPET =
//     StateNotifierProvider<ItemsDates, List<DateTime>>((_) => ItemsDates([]));
// final listItemsDatesAluminium =
//     StateNotifierProvider<ItemsDates, List<DateTime>>((_) => ItemsDates([]));

// class ItemsDates extends StateNotifier<List<DateTime>> {
//   ItemsDates(super.state);

//   void recicleItems(DateTime itemsDate) {
//     state.add(itemsDate);
//   }
// }

//Cambiar List<Sponsor> x List<Tip>
final tips = StateNotifierProvider<See, List<Sponsor>>((_) => See([
      Sponsor(
          id: 0,
          titulo: 'Cuanto tiempo dura el PET?',
          contenido: 'Conoce más sobre el PET. Conoce más.',
          contenido2:
              'No es poco tiempo, el plástico es un gran contaminante. Alrededor de 150 años es el tiempo que tarda una bolsa de plástico común en degradarse y una botella de PET (la abreviatura de polietileno tereftalato, una resina plástica y una forma de poliéster) puede tardar 1.000 años en desaparecer. La botella de plástico es un envase muy utilizado en la comercialización de líquidos en productos como lácteos, bebidas o limpia hogares. Sus ventajas respecto al vidrio son básicamente su menor precio y su gran versatilidad de formas. Se comenzaron a desarrollar en la década de 1950.',
          imagen: 'assets/bottle.png'),
      Sponsor(
          id: 1,
          titulo: '¡Pomposta para el planeta!',
          contenido: 'Pomposta más natural, más vida. ¡Únete!',
          contenido2:
              'Compostar excrementos de perro y gato mejora la salud del planeta, a cambio obtenemos un fertilizante de excelente calidad. Solo en España hay censadas más de 13 millones de mascotas, de los cuales 12 millones son perros, 600.000 son gatos y el resto animales varios (mayormente conejos).',
          imagen: 'assets/can.png'),
    ]));

class See extends StateNotifier<List<Sponsor>> {
  See(super.state);

  void removeAtIndex(int index) {
    List<Sponsor> list2 = [...state];
    list2.removeAt(index);
    state = list2;
  }
}
