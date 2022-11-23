import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertPage extends ConsumerStatefulWidget {
  const AlertPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Alert'),
    );
  }
}
