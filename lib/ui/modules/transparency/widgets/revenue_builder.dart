import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/widgets/revenue.dart';

class RevenueBuilder extends ConsumerStatefulWidget {
  const RevenueBuilder({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RevenueBuilderState();
}

class _RevenueBuilderState extends ConsumerState<RevenueBuilder> {
  @override
  Widget build(BuildContext context) {
    //Se consume la api de ingresos
    List<String> revenue = [
      'Saldo anterior Noviembre 2022',
      'Ingresos de mensualidad',
      'Dibasa 15/08/2022 y 13/11/2022',
    ];
    List<int> quantity = [
      5951,
      16400,
      138,
    ];

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: revenue.length,
        itemBuilder: (context, index) {
          return Revenue(
            quantity: quantity[index],
            title: revenue[index],
          );
        });
  }
}
