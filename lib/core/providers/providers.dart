import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/news/service.dart';
import '../modules/pagos/repository.dart';
import '../modules/pagos/service.dart';
import '../modules/recycle/repository.dart';
import '../modules/recycle/service.dart';
import '../modules/vecinos/service.dart';

final pagosRepositoryProvider = Provider<PagosRepository>((ref) {
  return PagosRepository();
});

final pagosServiceProvider = Provider<PagosService>((ref) {
  final respository = ref.watch(pagosRepositoryProvider);
  return PagosService(respository);
});

//

final newsServiceProvider = Provider<NewsService>((ref) {
  return NewsService();
});

final vecinoServiceProvider = Provider<VecinoService>((ref) {
  return VecinoService();
});

//

final recycleRepositoryProvider = Provider<RecycleRepository>((ref) {
  return RecycleRepository();
});

final recycleServiceProvider = Provider<RecycleService>((ref) {
  final respository = ref.watch(recycleRepositoryProvider);
  return RecycleService(respository);
});
