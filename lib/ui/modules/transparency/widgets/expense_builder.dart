import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/widgets/expense.dart';

class ExpensesBuilder extends ConsumerStatefulWidget {
  const ExpensesBuilder({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RevenueBuilderState();
}

class _RevenueBuilderState extends ConsumerState<ExpensesBuilder> {
  @override
  Widget build(BuildContext context) {
    //Se consume la api de ingresos
    List<String> expense = [
      'Pago de luz',
      'Pago a Cesar',
      'Pago a Cesar',
      'Pago de poda del pasto de la entrada y área verde',
      'Pago a Cesar',
      'Pago a Cesar',
      'Pago a Cesar',
      'Pago de gratificación a Cesar',
    ];
    List<String> quantity = [
      '2,323.00',
      '1,800.00',
      '1,800.00',
      '1,100.00',
      '1,800.00',
      '1,800.00',
      '1,800.00',
      '1,400.00',
    ];
    List<String> assets = [
      'assets/images/Transparencia/000.jpeg',
      'assets/images/Transparencia/1.png',
      'assets/images/Transparencia/2.png',
      'assets/images/Transparencia/3.jpeg',
      'assets/images/Transparencia/5.png',
      'assets/images/Transparencia/6.png',
      'assets/images/Transparencia/7.png',
      'assets/images/Transparencia/8.png',
    ];

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: expense.length,
        itemBuilder: (context, index) {
          return Expense(
            quantity: quantity[index],
            title: expense[index],
            asset: assets[index],
          );
        });
  }
}
