import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/core/modules/pagos/pago_atraso.dart';

import '../../../core/modules/pagos/service.dart';
import '../../../core/providers/providers.dart';
import 'state.dart';

final pagosControllerProvider =
    StateNotifierProvider<NewsControllerNotifier, PagosState>((ref) {
  final service = ref.watch(pagosServiceProvider);
  return NewsControllerNotifier(service);
});

class NewsControllerNotifier extends StateNotifier<PagosState> {
  final PagosService newsService;

  NewsControllerNotifier(this.newsService) : super(const PagosState());

  void init() {
    _getHouses();
  }

  void _getHouses() {
    //state = state.copyWith(state: States.loading);
    final housesOk = newsService.getViviendasOk();
    final housesAtraso = newsService.getViviendasAtraso();

    final List<ViviendaAtraso> housesAtraso1 = [];
    final List<ViviendaAtraso> housesAtraso2 = [];

    for (var element in housesAtraso) {
      if (element.mesesAtraso <= 2) {
        housesAtraso1.add(element);
      } else {
        housesAtraso2.add(element);
      }
    }

    //tratar response

    state = state.copyWith(
        state: States.succes,
        alCorriente: housesOk,
        atrasadas: housesAtraso1,
        atrasadasMas2Meses: housesAtraso2);
  }
}
