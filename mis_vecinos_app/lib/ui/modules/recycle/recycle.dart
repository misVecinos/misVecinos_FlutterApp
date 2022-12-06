import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_details.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/widgets/buttons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
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
        body: Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.135),
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
                      showBottomMenu(index, context, ref);
                    },
                    child: Ink(
                      height: size.height * 0.48,
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
        Padding(
          padding: EdgeInsets.only(
              left: size.height * 0.03, top: size.height * 0.08),
          child: Text(
            '¿Que reciclarás? ',
            style: t.title,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: size.height * 0.03,
              right: size.height * 0.03,
              top: size.height * 0.135),
          child: Text(
            '¡Ayudemos al planeta! \nEs importante que reciclemos nuestra basura si es posible. \n\nElige una de las opciones para reciclar:',
            style: t.messages,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: size.height * 0.23, top: size.height * 0.9),
          child: SmoothPageIndicator(
              controller: controller,
              count: 2,
              effect: WormEffect(
                  activeDotColor: c.primary,
                  dotColor: c.disabled,
                  dotHeight: size.height * 0.014,
                  dotWidth: size.height * 0.014)),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: size.height * 0.36, top: size.height * 0.88),
            child: TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const RecycleDetails();
                }));
              },
              child: Text(
                'Historial',
                style: t.buttonBlue2,
              ),
            )),
      ],
    ));
  }
}

showBottomMenu(int index, BuildContext context, WidgetRef ref) async {
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
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 10,
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
                const SizedBox(
                  height: 20,
                ),
                //
                ref.watch(index == 0 ? indexPET : indexAluminium) > 0
                    ? buton(context, index)
                    : butonDisabled(context),
                //
                const SizedBox(
                  height: 30,
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
