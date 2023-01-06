import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/character.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/info/cycle_recycle.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/info/pet_info.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/info/pet_recycle.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/info/pet_separate.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/qr.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_details.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/widgets/buttons.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/widgets/recicle_tips.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/providers/providers.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      final recycle = await prefs.setBool('isRecycing', true);

      setState(() {});
      //
    });
  }

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
                child: ref.watch(tips).isNotEmpty
                    ? SizedBox(
                        width: size.width,
                        height: size.height * 0.14,
                        child: CarouselSlider.builder(
                            options: CarouselOptions(
                              autoPlay: true,
                              enableInfiniteScroll: false,
                              viewportFraction: 1,
                            ),
                            itemCount: ref.watch(tips).length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                RecicleTips(
                                    asset: ref.watch(tips)[itemIndex].imagen,
                                    title: ref.watch(tips)[itemIndex].titulo,
                                    content:
                                        ref.watch(tips)[itemIndex].contenido,
                                    content2:
                                        ref.watch(tips)[itemIndex].contenido2,
                                    index: itemIndex,
                                    color: Colors.primaries.reversed
                                        .toList()[itemIndex]
                                        .withOpacity(0.25)))
                        //
                        )
                    //
                    : Container()),

            //
            SizedBox(
              height: size.height * 0.01,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'Elige una de las opciones para reciclar:',
              style: t.messagesBlack,
            ),

            Container(
              color: c.surface,
              height: size.height * 0.43,
              width: size.width,
              child: ListView.builder(
                controller: controller,
                //pageSnapping: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: assets.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: size.height * 0.01, right: size.height * 0.01),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          showBottomMenu(index, context, ref, size);
                        },
                        child: Cards(
                          size: size,
                          assets: assets,
                          names: names,
                          index: index,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Center(
              child: SmoothPageIndicator(
                  controller: controller,
                  count: 2,
                  effect: WormEffect(
                      activeDotColor: c.primary,
                      dotColor: c.disabled,
                      dotHeight: size.height * 0.012,
                      dotWidth: size.height * 0.012)),
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
                    'Mirar Historial',
                    style: t.buttonBlue2,
                  ),
                ),
                Icon(Icons.arrow_forward_ios, color: c.primary, size: 16)
              ],
            ),

            SizedBox(
              height: size.height * 0.01,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),

            Text(
              'Pasos a seguir:',
              style: t.buttonBlue2,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const CycleRecycle())));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ciclo del reciclaje',
                    style: t.subtitle,
                  ),
                  Row(
                    children: [
                      Container(
                        color: c.surface,
                        width: size.width * 0.8,
                        child: Text(
                          '¿Cómo identificar los tipos de plásticos?',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: t.messages,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, color: c.disabled, size: 16)
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: size.height * 0.015,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const PetInfo())));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tipos de PET',
                    style: t.subtitle,
                  ),
                  Row(
                    children: [
                      Container(
                        color: c.surface,
                        width: size.width * 0.8,
                        child: Text(
                          '¿Cómo identificar los tipos de plásticos?',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: t.messages,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, color: c.disabled, size: 16)
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: size.height * 0.015,
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const PetSeparate())));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Separa el PET',
                    style: t.subtitle,
                  ),
                  Row(
                    children: [
                      Container(
                        color: c.surface,
                        width: size.width * 0.8,
                        child: Text(
                          '¿Cómo separar los plásticos para su reciclado?',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: t.messages,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, color: c.disabled, size: 16)
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(
              height: size.height * 0.015,
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const PetRecycle())));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reciclaje de PET',
                    style: t.subtitle,
                  ),
                  Row(
                    children: [
                      Container(
                        color: c.surface,
                        width: size.width * 0.8,
                        child: Text(
                          '¿Cómo separar los plásticos para su reciclado?',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: t.messages,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.arrow_forward_ios, color: c.disabled, size: 16)
                    ],
                  ),
                ],
              ),
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

checkPET(WidgetRef ref, BuildContext context, Size size) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    if (ref.watch(indexPET) > 0) {
      final navigator = Navigator.of(context);
      final prefs = await SharedPreferences.getInstance();
      final notFirstTime = prefs.getBool('firstTimeRecycle');

      if (notFirstTime != true) {
        navigator.push(MaterialPageRoute(builder: (context) {
          return const QR();
        }));
      } else {
        String barcodeScanRes = '';

        var res = await navigator.push(MaterialPageRoute(
          builder: (context) =>
              const SimpleBarcodeScannerPage(lineColor: '#2E75F7'),
        ));

        if (res is String) {
          barcodeScanRes = res;
        }

        String maincode = 'JA0JWxippm';

        if (barcodeScanRes == maincode) {
          int aluminium = ref.watch(indexAluminium);
          int pet = ref.watch(indexPET);
          final service = ref.watch(recycleServiceProvider);

          await service.sendQuantity(aluminium, pet, DateTime.now());

          ref.read(indexPET.notifier).reset();
          ref.read(indexAluminium.notifier).reset();

          await navigator.pushReplacement(MaterialPageRoute(builder: (context) {
            return const Character();
          }));
        } else {
          ref.read(indexPET.notifier).reset();
          ref.read(indexAluminium.notifier).reset();
          showMsjErr(context, size);
        }
        return;
        //
      }
    } else {
      showMessage(context);
      ref.read(indexPET.notifier).reset();
      ref.read(indexAluminium.notifier).reset();
    }
  });
}

checkAluminium(WidgetRef ref, BuildContext context, Size size) {
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    if (ref.watch(indexAluminium) > 0) {
      final navigator = Navigator.of(context);
      final prefs = await SharedPreferences.getInstance();
      final notFirstTime = prefs.getBool('firstTimeRecycle');

      if (notFirstTime != true) {
        navigator.push(MaterialPageRoute(builder: (context) {
          return const QR();
        }));

        await prefs.remove('firstTimeRecycle');
      } else {
        String barcodeScanRes = '';

        var res = await navigator.push(MaterialPageRoute(
          builder: (context) =>
              const SimpleBarcodeScannerPage(lineColor: '#2E75F7'),
        ));

        if (res is String) {
          barcodeScanRes = res;
        }

        String maincode = 'JA0JWxippm';

        if (barcodeScanRes == maincode) {
          int aluminium = ref.watch(indexAluminium);
          int pet = ref.watch(indexPET);
          final service = ref.watch(recycleServiceProvider);

          await service.sendQuantity(aluminium, pet, DateTime.now());

          ref.read(indexPET.notifier).reset();
          ref.read(indexAluminium.notifier).reset();

          await navigator.pushReplacement(MaterialPageRoute(builder: (context) {
            return const Character();
          }));
        } else {
          ref.read(indexPET.notifier).reset();
          ref.read(indexAluminium.notifier).reset();
          showMsjErr(context, size);
        }
        return;
        //
      }
    } else {
      showMessage(context);
      ref.read(indexPET.notifier).reset();
      ref.read(indexAluminium.notifier).reset();
    }
  });
}

showMsjErr(BuildContext context, Size size) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))),
          title: Text('Código Incorrecto', style: t.subtitle),
          content: Container(
            height: size.height * 0.19,
            color: c.surface,
            child: Column(
              children: [
                Text(
                  'Verifica que el codigo sea el correcto e intentalo de nuevo.',
                  style: t.messagesBlack,
                ),
                LottieBuilder.asset(
                  repeat: false,
                  height: size.height * 0.15,
                  'assets/icons/lottie/error.json',
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Aceptar')),
          ],
        );
      });
}
