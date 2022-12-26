import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mis_vecinos_app/ui/utils/widgets.dart';

import '../../../core/providers/providers.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import 'controller.dart';
import 'recycle_details.dart';

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
                    String barcodeScanRes =
                        await FlutterBarcodeScanner.scanBarcode(
                      c.primary.toString(),
                      'Cancelar',
                      false,
                      ScanMode.QR,
                    );

                    String maincode = 'JA0JWxippm';

                    if (barcodeScanRes == maincode) {
                      int aluminium = ref.watch(indexAluminium);
                      int pet = ref.watch(indexPET);
                      final service = ref.watch(recycleServiceProvider);

                      await service.sendQuantity(aluminium, pet);

                      final snackdemo = SnackBar(
                        content: Text('Registro guardado exitosamente',
                            style: t.messagesLight),
                        backgroundColor: c.black,
                        elevation: 10,
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackdemo);

                      await Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return const RecycleDetails();
                      }));
                    }
                  },
                  child: Buton(
                      background: c.primary,
                      title: 'Escanear',
                      style: t.buttons)),
        ],
      ),
    );
  }

  // Widget text(Size size) {
  //   return Positioned(
  //       top: size.height * 0.2,
  //       left: size.width * 0.1,
  //       child: Text(
  //         barcode != null ? 'Verificado' : 'Verifica el QR del Contenedor',
  //         style: t.mediumLight,
  //       ));
  // }

  // Widget qrView(
  //     BuildContext context, GlobalKey<State<StatefulWidget>> qrKey, Size size) {
  //   return QRView(
  //     key: qrKey,
  //     onQRViewCreated: onQRViewCreated,
  //     overlay: QrScannerOverlayShape(
  //       borderColor: c.primary,
  //       borderRadius: 10,
  //       borderLength: 20,
  //       borderWidth: 10,
  //       cutOutSize: size.width * 0.8,
  //     ),
  //   );
  // }

  // onQRViewCreated(QRViewController controller) {
  //   setState(() => this.controller = controller);
  //   controller.scannedDataStream.listen((barcode) async {
  //     this.barcode = barcode;

  //     bool ok = false;
  //     String code = 'JA0JWxippm';

  //     if (barcode.code == code) {
  //       //Lanzar la peticion post para añadirlo al back
  //       int aluminium = ref.watch(indexAluminium);
  //       int pet = ref.watch(indexPET);
  //       final service = ref.watch(recycleServiceProvider);

  //       await service.sendQuantity(aluminium, pet);

  //       await Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) {
  //         return const RecycleDetails();
  //       }));

  //       final snackdemo = SnackBar(
  //         content:
  //             Text('Registro guardado exitosamente', style: t.messagesLight),
  //         backgroundColor: c.black,
  //         elevation: 10,
  //         behavior: SnackBarBehavior.floating,
  //         margin: const EdgeInsets.all(5),
  //       );

  //       ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  //     } else {
  //       //Lanzar un mensaje de qr erroneo/no encontrado
  //       ok = false;
  //       showMsj(ok);
  //     }
  //   });
  // }

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
