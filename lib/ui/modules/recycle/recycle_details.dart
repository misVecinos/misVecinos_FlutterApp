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

  getMonths(int month) {
    if (month == 1) {
      return 'Ene';
    } else if (month == 2) {
      return 'Feb';
    } else if (month == 3) {
      return 'Mar';
    } else if (month == 4) {
      return 'Abr';
    } else if (month == 5) {
      return 'May';
    } else if (month == 6) {
      return 'Jun';
    } else if (month == 7) {
      return 'Jul';
    } else if (month == 8) {
      return 'Ago';
    } else if (month == 9) {
      return 'Sep';
    } else if (month == 10) {
      return 'Oct';
    } else if (month == 11) {
      return 'Nov';
    } else if (month == 12) {
      return 'Dic';
    } else {
      return 'Mes';
    }
  }

  row(RecycleRegister? register) {
    if (register?.quantityAlum == 0 && register?.quantityPet == 0) {
      return Container();
    } else if (register?.quantityAlum == 0 && register?.quantityPet != 0) {
      return Row(
        children: [
          Text('${register?.quantityPet.toString()} piezas de PET  ',
              style: t.messagesBlack),
          const Spacer(),
          Text(
              '${register?.dateIn.day.toString()} de ${getMonths(register?.dateIn.month ?? 0)}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: t.messagesBlack),
        ],
      );
    } else if (register?.quantityPet == 0 && register?.quantityAlum != 0) {
      return Row(
        children: [
          Text('${register?.quantityAlum.toString()} piezas de Aluminio  ',
              style: t.messagesBlack),
          const Spacer(),
          Text(
              '${register?.dateIn.day.toString()} de ${getMonths(register?.dateIn.month ?? 0)}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: t.messagesBlack),
        ],
      );
    } else {
      return Container();
    }
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
                  Text('Reciclado', style: t.title),
                  //Text('Mes de Noviembre', style: t.messages),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      showMsj(
                          'Reciclaje',
                          'Puedes visualizar tu historial de reciclaje. Todo lo que has reciclado lo verás en esta pantalla. \n\nTambien puedes ver la capacidad y el estado de los contenedores de tu vecindario.',
                          size);
                    },
                    icon: Icon(Icons.help, color: c.disabled))
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
                        'Ver Contenedores',
                        style: t.buttonBlue2,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios, color: c.primary)
                  ],
                ),
                //
                ExpansionTile(
                  initiallyExpanded: false,
                  title: Text('Tu Historial', style: t.subtitle),
                  subtitle:
                      Text(DateTime.now().year.toString(), style: t.messages),
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.listHistory?.data.length,
                        itemBuilder: (context, index) {
                          return state.listHistory?.data.length == null
                              ? Text(
                                  'Añade algunos elementos. Tu historial de reciclaje está vacio.',
                                  style: t.messages)
                              : row(state.listHistory?.data[index]);
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

  petInUsage() {}

  aluminiumInUsage() {}

  showMsj(String title, String content, Size size) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
            title: Text(title, style: t.subtitle),
            content: Container(
              height: size.height * 0.32,
              color: c.surface,
              child: Column(
                children: [
                  Text(content, style: t.messagesBlack),
                  // Expanded(
                  //   child: LottieBuilder.asset(
                  //     repeat: true,
                  //     'assets/icons/lottie/character.json',
                  //   ),
                  // ),
                  Expanded(
                      child: Image.asset(
                    'assets/icons/character.gif',
                  ))
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(foregroundColor: c.primary),
                child: Text(
                  'Entendido',
                  style: t.messagesBlue,
                ),
              ),
              //
            ],
          );
        });
  }
}
