import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PagosPage extends ConsumerStatefulWidget {
  const PagosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<PagosPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Pagos'),
    );
  }
}
