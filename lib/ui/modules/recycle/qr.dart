import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mis_vecinos_app/ui/utils/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../core/providers/providers.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'character.dart';
import 'controller.dart';
import 'recycle.dart';

class QR extends ConsumerStatefulWidget {
  const QR({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QRState();
}

class _QRState extends ConsumerState<QR> {
  String? code;
  int currentStep = 0;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contenedor', style: t.title),
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
          systemOverlayStyle: SystemUiOverlayStyle.dark),

      //
      body: ListView(
        padding: EdgeInsets.only(
            left: size.height * 0.025, top: 0, right: size.height * 0.025),
        children: [
          Container(
            height: size.height * 0.42,
            width: size.width,
            color: c.surface,
            child: Stepper(
                currentStep: currentStep,
                onStepContinue: () {
                  if (currentStep == 2) {
                    //Habilitar el boton
                    setState(() => check = true);
                  } else {
                    setState(() => currentStep += 1);
                    setState(() => check = false);
                  }
                },
                onStepCancel: () {
                  setState(() {
                    if (currentStep == 0) {
                      setState(() => check = false);
                      return;
                    } else {
                      setState(() => check = false);
                      currentStep -= 1;
                    }
                  });
                },
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      TextButton(
                        onPressed: details.onStepContinue,
                        child: const Text('Continuar'),
                      ),
                      TextButton(
                        onPressed: details.onStepCancel,
                        child: Text('Cancelar', style: t.messages),
                      ),
                    ],
                  );
                },
                steps: [
                  Step(
                      isActive: currentStep >= 0,
                      title: const Text('Dirígete al contenedor'),
                      content: const Text(
                          'Camina hasta donde se encuentra el contenedor de tu colonia o fraccionamiento.')),
                  //
                  Step(
                      isActive: currentStep >= 1,
                      title: const Text('Escanea'),
                      content: const Text('Selecciona el botón escanear.')),
                  Step(
                      isActive: currentStep >= 2,
                      title: const Text('Espera'),
                      content: const Text(
                          'Sosten firmememnnte tu dispositivo hasta que se complete el escaneo.')),
                ]),
          ),
          //
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.01, bottom: size.height * 0.03),
            child: Image.asset(
              'assets/images/qr.jpg',
              height: size.height * 0.3,
              width: size.width,
            ),
          ),
          //
          check == false
              ? Buton(
                  background: c.disabled, title: 'Escanear', style: t.buttons)
              : InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () async {
                    // String barcodeScanRes =
                    //     await FlutterBarcodeScanner.scanBarcode(
                    //   c.primary.toString(),
                    //   'Cancelar',
                    //   false,
                    //   ScanMode.QR,
                    // );

                    String barcodeScanRes = '';
                    final navigator = Navigator.of(context);

                    var res = await navigator.push(MaterialPageRoute(
                      builder: (context) => const SimpleBarcodeScannerPage(
                        lineColor: '#2E75F7',
                        scanType: ScanType.qr,
                        cancelButtonText: 'Cancelar',
                        appBarTitle: 'Sostén y enfóca el qr',
                        isShowFlashIcon: true,
                        centerTitle: true,
                      ),
                    ));
                    setState(() {
                      if (res is String) {
                        barcodeScanRes = res;
                      }
                    });

                    String maincode = 'JA0JWxippm';
                    setState(() {});

                    if (barcodeScanRes == maincode) {
                      int aluminium = ref.watch(indexAluminium);
                      int pet = ref.watch(indexPET);
                      final service = ref.watch(recycleServiceProvider);

                      await service.sendQuantity(
                          aluminium, pet, DateTime.now());

                      ref.read(indexPET.notifier).reset();
                      ref.read(indexAluminium.notifier).reset();

                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setBool('firstTimeRecycle', true);

                      navigator.pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const Character();
                      }));
                    } else {
                      ref.read(indexPET.notifier).reset();
                      ref.read(indexAluminium.notifier).reset();
                      showMsjErr(context, size);
                    }
                    return;
                  },
                  child: Buton(
                      background: c.primary,
                      title: 'Escanear',
                      style: t.buttons)),
        ],
      ),
    );
  }

  showMsj(bool ok) {
    showDialog(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            color: c.surface,
            child: FittedBox(
              fit: BoxFit.contain,
              child: AlertDialog(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14.0))),
                title: Text(ok == true ? 'Reciclaje registrado' : 'Error',
                    style: t.subtitle),
                content: Column(
                  children: [
                    Text(
                      ok == true
                          ? 'Registro añadido con exito.'
                          : 'Algo salio mal, enfoca bien el codigo QR.',
                      style: t.messages,
                    ),
                    LottieBuilder.asset(
                      repeat: false,
                      'assets/icons/lottie/chek.json',
                      height: 60,
                    ),
                  ],
                ),
                actions: [
                  ok == true
                      ? TextButton(
                          onPressed: () {
                            // Navigator.pushReplacement(context,
                            //     MaterialPageRoute(builder: (context) {
                            //   return const RecycleDetails();
                            // }));
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Ok',
                            style: t.messagesBlue,
                          ),
                        )
                      : TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style:
                              TextButton.styleFrom(foregroundColor: c.disabled),
                          child: Text(
                            'Cancelar',
                            style: t.messages,
                          ),
                        ),
                ],
              ),
            ),
          );
        });
  }

  //
}
