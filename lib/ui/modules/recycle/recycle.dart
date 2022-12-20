import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_details.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/widgets/buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../sponsors/controller.dart';
import '../sponsors/sponsor_widget.dart';
import 'controller.dart';
import 'widgets/cards.dart';

class Recycle extends ConsumerStatefulWidget {
  const Recycle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<Recycle> {
  final PageController controller = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final List<String> assets = [
      'assets/bottle.png',
      'assets/can.png',
    ];
    final List<String> names = [
      'PET',
      'Aluminio',
    ];

    return Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('¿Que reciclarás? ', style: t.title),
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
          padding: EdgeInsets.only(
              left: size.height * 0.025, top: 0, right: size.height * 0.025),
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),

            AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                switchInCurve: Curves.fastLinearToSlowEaseIn,
                switchOutCurve: Curves.ease,
                child: ref.watch(sponsors).isNotEmpty
                    ? SizedBox(
                        width: double.infinity,
                        height: size.height * 0.145,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: SponsorWidget(
                                    asset: assets[index],
                                    title: index == 0
                                        ? 'Cuanto tiempo dura el PET?'
                                        : 'Aluminio reutilizable',
                                    content: index == 0
                                        ? 'Conoce más sobre el PET. Conoce más.'
                                        : 'Reutiliza el aluminio que tienes. Ayuda al planeta.',
                                    index: index,
                                    color: index == 0
                                        ? c.primary.withOpacity(0.25)
                                        : c.OK.withOpacity(0.25)),
                              );
                            }),
                      )
                    : Container()),

            //
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              '¡Ayudemos al planeta! \nEs importante que reciclemos nuestra basura si es posible.',
              style: t.messages,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'Elige una de las opciones para reciclar:',
              style: t.messagesBlack,
            ),

            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              color: c.surface,
              height: size.height * 0.5,
              width: size.width,
              child: PageView.builder(
                controller: controller,
                pageSnapping: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  return Align(
                    child: Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          showBottomMenu(index, context, ref, size);
                        },
                        child: Ink(
                          height: size.height * 0.45,
                          width: size.width * 0.7,
                          child: Cards(
                            size: size,
                            assets: assets,
                            names: names,
                            index: index,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: size.height * 0.003,
            ),
            Center(
              child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: WormEffect(
                      activeDotColor: c.primary,
                      dotColor: c.disabled,
                      dotHeight: size.height * 0.014,
                      dotWidth: size.height * 0.014)),
            ),
            //

            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RecycleDetails();
                    }));
                  },
                  child: Text(
                    'Historial',
                    style: t.buttonBlue2,
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: c.primary)
              ],
            ),

            SizedBox(
              height: size.height * 0.01,
            ),

            Text(
              'Conoce mas sobre el PET',
              style: t.subtitle,
            ),
            Row(
              children: [
                Container(
                  color: c.surface,
                  width: 340,
                  child: Text(
                    'Explora las curiosidades del PET. Ten en cuenta ayudar al planeta. ',
                    style: t.messages,
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: c.disabled)
              ],
            ),

            SizedBox(
              height: size.height * 0.2,
            ),

            //
          ],
        ));
  }
}

showBottomMenu(
    int index, BuildContext context, WidgetRef ref, Size size) async {
  await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: size.height * 0.015,
                ),
                Center(
                  child: Text(index == 0 ? 'PET' : 'Aluminio',
                      style: t.buttonBlue2),
                ),

                Center(
                  child: Text(
                    'Piezas a reciclar:',
                    style: t.title,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        ref
                            .read(index == 0
                                ? indexPET.notifier
                                : indexAluminium.notifier)
                            .substract();
                      },
                      backgroundColor: c.primary,
                      child: const Icon(Icons.remove),
                    ),
                    Text(
                      ref
                          .watch(index == 0 ? indexPET : indexAluminium)
                          .toString(),
                      style: t.title,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        ref
                            .read(index == 0
                                ? indexPET.notifier
                                : indexAluminium.notifier)
                            .add();
                      },
                      backgroundColor: c.primary,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),

                Center(
                  child: TextButton(
                    onPressed: () {
                      ref
                          .read(index == 0
                              ? indexPET.notifier
                              : indexAluminium.notifier)
                          .reset();
                    },
                    child: Text(
                      'Reset',
                      style: t.messagesBold,
                    ),
                  ),
                ),

                //
                ref.watch(index == 0 ? indexPET : indexAluminium) > 0
                    ? buton(context, index)
                    : butonDisabled(context),
                //
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            );
          },
        );
      });
}

checkPET(WidgetRef ref, BuildContext context) {
  if (ref.watch(indexPET) > 0) {
    ref.read(listItemsPET.notifier).recicleItems(ref.watch(indexPET));
    ref.read(listItemsDatesPET.notifier).recicleItems(DateTime.now());

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RecycleDetails();
    }));

    ref.read(indexPET.notifier).reset();
  } else {
    showMessage(context);
  }
}

checkAluminium(WidgetRef ref, BuildContext context) {
  if (ref.watch(indexAluminium) > 0) {
    ref
        .read(listItemsAluminium.notifier)
        .recicleItems(ref.watch(indexAluminium));
    ref.read(listItemsDatesAluminium.notifier).recicleItems(DateTime.now());

    //Ir a la otra pagina y añadir el index a una lista
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RecycleDetails();
    }));

    ref.read(indexAluminium.notifier).reset();
  } else {
    //Mensaje de que no puede ser 0
    showMessage(context);
  }
}
