import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDrawer extends ConsumerStatefulWidget {
  const MenuDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<MenuDrawer> {
  @override
  Widget build(BuildContext context) => const Drawer(
        child: Center(
          child: Text('MenuDrawer'),
        ),
      );
}
