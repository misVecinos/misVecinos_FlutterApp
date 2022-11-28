import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Recycle extends ConsumerStatefulWidget {
  const Recycle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<Recycle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          Center(
            child: Text('Reciclaje'),
          )
        ],
      ),
    );
  }
}
