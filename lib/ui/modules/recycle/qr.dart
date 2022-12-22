import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:mis_vecinos_app/ui/modules/recycle/recycle_details.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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

    //Esperaremos 10 segundos para la lectura del QR. Si no lee el qr, redireccionamos atras.
    Future.delayed(const Duration(seconds: 4)).whenComplete(() =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const RecycleDetails();
        })));
  }

  @override
  void dispose() {
    controller?.dispose;
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

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
          barcode != null
              ? 'Codigo: ${barcode!.code.toString()}'
              : 'Verifica el QR del Contenedor',
          style: t.mediumLight,
        ));
  }

  Widget qrView(
      BuildContext context, GlobalKey<State<StatefulWidget>> qrKey, Size size) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated(controller!, size),
      overlay: QrScannerOverlayShape(
        borderColor: c.primary,
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: size.width * 0.8,
      ),
    );
  }

  onQRViewCreated(QRViewController controller, Size size) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((barcode) {
      this.barcode = barcode;

      bool ok = false;

      if (this.barcode == 'JA0JWxippm') {
        ok = true;
        showMsj(ok, size);
      } else {
        ok = false;
        showMsj(ok, size);
      }
    });
  }

  showMsj(bool ok, Size size) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0))),
            title: Text(ok == true ? 'Yes' : 'No', style: t.subtitle),
            content: Column(
              children: [
                Text(
                  ok == true ? 'Si es el codigo' : 'No es el codigo',
                  style: t.messages,
                ),
                LottieBuilder.asset(
                  repeat: false,
                  'assets/icons/lottie/chek.json',
                  height: size.height * 0.1,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Ok',
                  style: t.messagesBlue,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(foregroundColor: c.disabled),
                child: Text(
                  'Cancelar',
                  style: t.messages,
                ),
              ),
            ],
          );
        });
  }

  //
}
