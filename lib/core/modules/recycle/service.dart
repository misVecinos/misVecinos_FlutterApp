import 'package:mis_vecinos_app/core/modules/recycle/history.dart';

import 'repository.dart';

class RecycleService {
  final RecycleRepository repository;
  RecycleService(this.repository);

  Future sendQuantity(int aluminium, int pet, DateTime time) async {
    await repository.sendQuantity(aluminium, pet, time);
  }

  Future<History> getHistory() async {
    final History history = await repository.getHistory();
    return history;
  }
//
}
