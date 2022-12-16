import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/transparency_details.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../menu/menu.dart';

class Transparency extends ConsumerStatefulWidget {
  const Transparency({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<Transparency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: const MenuDrawer(),
        drawerEnableOpenDragGesture: true,
        appBar: AppBar(
          title: Text('Transparencia', style: t.title),
          actions: [
            Icon(
              Icons.abc,
              color: c.surface,
            ),
          ],
          backgroundColor: c.surface,
          elevation: 0,
          centerTitle: false,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: PageView.builder(
          itemCount: 3, //Controla los meses del fraccionamiento
          itemBuilder: (context, index) {
            return TransparencyDetails(
                index: index, month: 'Noviembre ${index.toString()}');
          },
        ));
  }
}
