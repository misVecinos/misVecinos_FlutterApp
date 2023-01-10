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
    List<String> revenue = [''];
    List<String> quantity = [];

    return ListView.builder(
        itemCount: revenue.length,
        itemBuilder: (context, index) {
          return Revenue(
            quantity: quantity[index],
            title: revenue[index],
          );
        });
  }
}
