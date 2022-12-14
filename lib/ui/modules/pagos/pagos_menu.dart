import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/alCorriente.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/widgets/card.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/atraso.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class PagosMenu extends ConsumerWidget {
  const PagosMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles', style: t.title),
        actions: [
          Icon(
            Icons.abc,
            color: c.surface,
          ),
        ],
        backgroundColor: c.surface,
        elevation: 0,
        centerTitle: false,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: size.height * 0.025, top: 0, right: size.height * 0.025),
        children: [
          //
          SizedBox(
            height: size.height / 4,
          ),

          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const AlCorriente();
                }));
              },
              child: const ShadowCard(title: 'Viviendas al \n corriente')),
          //
          SizedBox(
            height: size.height * 0.025,
          ),
          //
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const Atraso();
                }));
              },
              child: const ShadowCard(title: 'Viviendas con \n adeudo')),
        ],
      ),
    );
  }
}
