import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VecinosPage extends ConsumerStatefulWidget {
  const VecinosPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<VecinosPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Vecinos'),
    );
  }
}
