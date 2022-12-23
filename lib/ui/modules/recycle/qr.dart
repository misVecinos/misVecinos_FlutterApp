import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/controller.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_details.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../core/providers/providers.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class QR extends ConsumerStatefulWidget {
  const QR({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _QRState();
}

class _QRState extends ConsumerState<QR> {
  final qrKey = GlobalKey(debugLabel: 'OR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  void initState() {
    super.initState();
    controller?.resumeCamera();

    //Esperaremos 15 segundos para la lectura del QR. Si no lee el qr, redireccionamos atras.
    // Future.delayed(const Duration(seconds: 15)).whenComplete(() =>
    //     Navigator.pushReplacement(context,
    //         MaterialPageRoute(builder: (context) {
    //       return const RecycleDetails();
    //     })));
  }

  @override
  void dispose() {
    controller?.dispose;
    super.dispose();
  }

  // @override
  // void reassemble() async {
  //   super.reassemble();
  //   if (Platform.isAndroid) {
  //     await controller?.pauseCamera();
  //   }
  //   controller?.resumeCamera();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          qrView(context, qrKey, size),
          text(size),
        ],
      ),
    );
  }

  Widget text(Size size) {
    return Positioned(
        top: size.height * 0.2,
        left: size.width * 0.1,
        child: Text(
          barcode != null ? 'Verificado' : 'Verifica el QR del Contenedor',
          style: t.mediumLight,
        ));
  }

  Widget qrView(
      BuildContext context, GlobalKey<State<StatefulWidget>> qrKey, Size size) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: c.primary,
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: size.width * 0.8,
      ),
    );
  }

  onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) async {
      this.barcode = barcode;

      bool ok = false;
      String code = 'JA0JWxippm';

      if (barcode.code == code) {
        //Lanzar la peticion post para añadirlo al back
        int aluminium = ref.watch(indexAluminium);
        int pet = ref.watch(indexPET);
        final service = ref.watch(recycleServiceProvider);

        await service.sendQuantity(aluminium, pet);

        await Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const RecycleDetails();
        }));

        final snackdemo = SnackBar(
          content:
              Text('Registro guardado exitosamente', style: t.messagesLight),
          backgroundColor: c.black,
          elevation: 10,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(5),
        );

        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      } else {
        //Lanzar un mensaje de qr erroneo/no encontrado
        ok = false;
        showMsj(ok);
      }
    });
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
