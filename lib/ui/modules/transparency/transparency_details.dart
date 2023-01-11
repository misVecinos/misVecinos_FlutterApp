import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/widgets/acumulated.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/widgets/expense.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/widgets/revenue.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/widgets/revenue_builder.dart';

import '../../utils/text_styles.dart';
import 'widgets/expense_builder.dart';

class TransparencyDetails extends ConsumerStatefulWidget {
  const TransparencyDetails(
      {required this.month, required this.index, super.key});
  final String month;
  final int index;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TransparencyDetailsState();
}

class _TransparencyDetailsState extends ConsumerState<TransparencyDetails> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //Total ingresado = 100%
    //Total egresado = ?
    //Saldo remanente = ?

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(
          left: size.height * 0.025, top: 0, right: size.height * 0.025),
      children: [
        //

        const Acumulated(quantity: '8,666.00', title: 'Saldo Acomulado Total:'),
        SizedBox(height: size.height * 0.02),

        Text('Ingresos', style: t.subtitle),
        const RevenueBuilder(), //Pasar datos de la api

        const Divider(),
        const Revenue(quantity: 22489, title: 'Total ingresado:'),
        const Divider(),

        Text('Egresos', style: t.subtitle),
        const ExpensesBuilder(), //Pasar datos de la api

        const Divider(),
        const Expense2(quantity: '13,823.00', title: 'Total egresado:'),
        const Divider(),

        // const Graphics(
        //   name: [
        //     'Pago de luz',
        //     'Pago a Cesar',
        //     'Pago a Cesar',
        //     'Pago de poda del pasto de la entrada y área verde',
        //     'Pago a Cesar',
        //     'Pago a Cesar',
        //     'Pago a Cesar',
        //     'Pago de gratificación a Cesar',
        //   ],
        //   quntity: [
        //     2323,
        //     1800,
        //     1800,
        //     1100,
        //     1800,
        //     1800,
        //     1800,
        //     1400,
        //   ],
        // ),
        //Pasar datos de la api

        SizedBox(height: size.height * 0.1)
      ],
    );
  }
}
