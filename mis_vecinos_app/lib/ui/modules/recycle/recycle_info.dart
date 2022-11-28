import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecycleInfo extends ConsumerStatefulWidget {
  const RecycleInfo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<RecycleInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Center(
            child: Text('Reciclaje Inf'),
          )
        ],
      ),
    );
  }
}
