import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../modules/pagos/repository.dart';
import '../modules/pagos/service.dart';

final pagosRepositoryProvider = Provider<PagosRepository>((ref) {
  return PagosRepository();
});

final pagosServiceProvider = Provider<PagosService>((ref) {
  final respository = ref.watch(pagosRepositoryProvider);
  return PagosService(respository);
});
