import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/modules/vecinos/service.dart';
import '../../../core/providers/providers.dart';
import 'state.dart';

final vecinoControllerProvider =
    StateNotifierProvider<NewsControllerNotifier, VecinoState>((ref) {
  final service = ref.watch(vecinoServiceProvider);
  return NewsControllerNotifier(service);
});

class NewsControllerNotifier extends StateNotifier<VecinoState> {
  final VecinoService vecinoService;

  NewsControllerNotifier(this.vecinoService) : super(const VecinoState());

  void init() {
    _getNegocios();
  }

  _getNegocios() {
    //tratar response
    state = state.copyWith(
        negocios: vecinoService.getNegocios(), state: States.succes);
  }
}
