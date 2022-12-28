import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/core/modules/recycle/history.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/state.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/widgets/minicard2.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'controller.dart';

class RecycleDetails extends ConsumerStatefulWidget {
  const RecycleDetails({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecycleDetailsState();
}

class _RecycleDetailsState extends ConsumerState<RecycleDetails> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Acordarse de watch, read y listen tienen distintas implicaciones
      final provider = ref.read(recycleControllerProvider.notifier);
      provider.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = ref.watch(recycleControllerProvider);

    switch (state.state) {
      case States.loading:
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );

      case States.succes:
        return Scaffold(
            appBar: AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Historial Reciclaje', style: t.title),
                  //Text('Mes de Noviembre', style: t.messages),
                ],
              ),
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
            body: ListView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                  left: size.height * 0.025,
                  top: 0,
                  right: size.height * 0.025),
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MiniCard2(
                      title: 'PET',
                      history: state.listHistory,
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    MiniCard2(
                      title: 'Aluminio',
                      history: state.listHistory,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        showBottomMenu(context, size);
                      },
                      child: Text(
                        'Contenedores',
                        style: t.buttonBlue2,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: c.primary)
                  ],
                ),
                //
                ExpansionTile(
                  initiallyExpanded: true,
                  title: Text('Historial', style: t.subtitle),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.listHistory?.recycleData.length,
                        itemBuilder: (context, index) {
                          return state.listHistory?.recycleData.length == null
                              ? Text(
                                  'Añade algunos elementos. Tu historial de reciclaje está vacio.',
                                  style: t.messages)
                              : Row(
                                  children: [
                                    Text(
                                        '${state.listHistory?.recycleData[index].quantityPet.toString()} piezas de PET  ',
                                        style: t.messagesBlack),
                                    const Spacer(),
                                    Text(
                                        '  ${state.listHistory?.recycleData[index].createdAt.hour.toString()}:${state.listHistory?.recycleData[index].createdAt.minute.toString()}',
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: t.messagesBlack),
                                  ],
                                );
                        }),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.listHistory?.recycleData.length,
                        itemBuilder: (context, index) {
                          return state.listHistory?.recycleData == null
                              ? Text(
                                  'Añade algunos elementos. Tu historial de reciclaje está vacio.',
                                  style: t.messages)
                              : Row(
                                  children: [
                                    Text(
                                        '${state.listHistory?.recycleData[index].quantityAlum.toString()} piezas de Aluminio  ',
                                        style: t.messagesBlack),
                                    const Spacer(),
                                    Text(
                                        '  ${state.listHistory?.recycleData[index].createdAt.hour.toString()}:${state.listHistory?.recycleData[index].createdAt.minute.toString()}',
                                        style: t.messagesBlack),
                                  ],
                                );
                        }),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
              ],
            ));

      case States.error:
        return Center(
          child: Text(States.error.name),
        );
    }
  }

  showBottomMenu(BuildContext context, Size size) async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) {
          return Consumer(
            builder: (context, ref, child) {
              return Padding(
                padding: EdgeInsets.only(
                    left: size.height * 0.015, right: size.height * 0.015),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: c.surface,
                      height: size.height * 0.02,
                    ),

                    Text(
                      'Contenedor de PET',
                      style: t.subtitle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Limite: ',
                          style: t.messagesBlack,
                        ),
                        Text(
                          '5900 piezas',
                          style: t.messagesBlack,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height * 0.01,
                    ),

                    Stack(
                      children: [
                        Container(
                          color: c.surface,
                          height: size.height * 0.26,
                          width: size.width,
                          child: DChartPie(
                            animate: true,
                            animationDuration: const Duration(seconds: 1),
                            data: const [
                              {'domain': 'En uso', 'measure': 58},
                              {'domain': 'Libre', 'measure': 42},
                            ],
                            fillColor: (barData, index) {
                              switch (barData['domain']) {
                                case 'Libre':
                                  return c.primary.withOpacity(0.5);
                                case 'En uso':
                                  return c.primary;
                                default:
                                  return c.error;
                              }
                            },
                            pieLabel: (pieData, index) {
                              return "${pieData['measure']}%";
                            },
                            strokeWidth: 4,
                            labelColor: c.secondary,
                            labelFontSize: 14,
                          ),
                        ),
                        //
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: c.primary.withOpacity(0.5),
                              radius: size.width * 0.025,
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            const Text('Libre'),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: c.primary,
                                radius: size.width * 0.025,
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              const Text('En uso'),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Text(
                      'Contenedor de aluminio',
                      style: t.subtitle,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Limite: ',
                          style: t.messagesBlack,
                        ),
                        Text(
                          '8000 piezas',
                          style: t.messagesBlack,
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height * 0.01,
                    ),

                    Stack(
                      children: [
                        Container(
                          color: c.surface,
                          height: size.height * 0.26,
                          width: size.width,
                          child: DChartPie(
                            animate: true,
                            animationDuration: const Duration(seconds: 1),
                            data: const [
                              {'domain': 'En uso', 'measure': 18},
                              {'domain': 'Libre', 'measure': 82},
                            ],
                            fillColor: (barData, index) {
                              switch (barData['domain']) {
                                case 'Libre':
                                  return c.primary.withOpacity(0.5);
                                case 'En uso':
                                  return c.primary;
                                default:
                                  return c.error;
                              }
                            },
                            pieLabel: (pieData, index) {
                              return "${pieData['measure']}%";
                            },
                            strokeWidth: 4,
                            labelColor: c.secondary,
                            labelFontSize: 14,
                          ),
                        ),
                        //
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: c.primary.withOpacity(0.5),
                              radius: size.width * 0.025,
                            ),
                            SizedBox(
                              width: size.width * 0.01,
                            ),
                            const Text('Libre'),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.03),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: c.primary,
                                radius: size.width * 0.025,
                              ),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              const Text('En uso'),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    //
                  ],
                ),
              );
            },
          );
        });
  }

  petInUsage(History? history) {
    final lenght = history?.recycleData.length ?? 0;
    int totalPet = 0;
    int petLimit = 5900;
    double percent = 0;

    for (int i = 0; i <= lenght; i++) {
      totalPet += history?.recycleData[i].quantityPet ?? 0;
    }

    percent = totalPet * 100 / petLimit;

    return percent.toInt();
  }

  aluminiumInUsage() {}
}
