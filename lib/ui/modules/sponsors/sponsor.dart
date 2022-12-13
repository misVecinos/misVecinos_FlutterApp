import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../home/cotroller.dart';

class Sponsors extends ConsumerStatefulWidget {
  const Sponsors({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SponsorsState();
}

class _SponsorsState extends ConsumerState<Sponsors> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: ref.watch(valid) == false
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SizedBox(
                              height: size.height * 0.2,
                              width: size.width,
                              child: Image.asset(
                                'assets/images/composta.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            // Center(
                            //   child:
                            //       Text('Hagamos composta. ', style: t.subtitle),
                            // ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.02,
                                    right: size.height * 0.02),
                                child: Text(
                                  'Unete a nuestro movimiento. Ingresa tus datos y te contactaremos para más información.',
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  style: t.messages,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            txtField(size, name, 'Nombre completo', 'name.svg'),
                            txtField(size, phone, 'Teléfono', 'whatsapp.svg'),
                            txtField(size, email, 'Email', ''),
                            const SizedBox(
                              height: 20,
                            ),
                            buton(context, c.primary, 'Enviar', t.buttons, name,
                                email, phone),
                            SizedBox(
                              height: size.height * 0.08,
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SizedBox(
                              height: size.height * 0.2,
                              width: size.width,
                              child: Image.asset(
                                'assets/images/composta.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            SizedBox(
                              height: size.height * 0.02,
                            ),
                            Center(
                              child: Text('Exelente', style: t.subtitle),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Center(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: size.height * 0.02,
                                    right: size.height * 0.02),
                                child: Text(
                                  'Gracias por tu información. Nos prondrémos en contacto contigo en breve.',
                                  style: t.messages,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            LottieBuilder.asset(
                              repeat: false,
                              'assets/icons/lottie/chek.json',
                              height: size.height * 0.1,
                            ),
                            SizedBox(
                              height: size.height * 0.08,
                            ),
                          ],
                        )))
        ],
      ),
    );
  }
}

Widget txtField(
    Size size, TextEditingController controller, String label, String asset) {
  return Padding(
    padding:
        EdgeInsets.only(top: size.height * 0.01, bottom: size.height * 0.01),
    child: SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: t.messages,
          prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: asset.isNotEmpty
                  ? SvgPicture.asset(
                      'assets/icons/svg/$asset',
                      color: c.disabled,
                    )
                  : const Icon(Icons.alternate_email)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: c.disabled,
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: c.disabled,
              ),
              borderRadius: BorderRadius.circular(10)),
          hintText: label,
        ),
      ),
    ),
  );
}

Widget buton(
    BuildContext context,
    Color background,
    String title,
    TextStyle textStyle,
    TextEditingController name,
    TextEditingController phone,
    TextEditingController email) {
  final size = MediaQuery.of(context).size;

  return Consumer(
    builder: (context, ref, child) {
      return Center(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            if (name.text.isNotEmpty &&
                phone.text.isNotEmpty &&
                email.text.isNotEmpty) {
              ref.read(valid.notifier).forward();
            } else {
              ref.read(valid.notifier).stop();
              showMessage(context, 'Casi',
                  'Completa los campos para entrar en contacto contigo.');
            }
            //index == 0 ? checkPET(ref, context) : checkAluminium(ref, context);
          },
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: c.disabled.withOpacity(0.4),
                    blurRadius: 20.0,
                    offset: const Offset(1, 1))
              ],
              color: background,
            ),
            height: size.height * 0.065,
            width: size.width * 0.85,
            child: Center(
              child: Text(
                title,
                style: textStyle,
              ),
            ),
          ),
        ),
      );
    },
  );
}

showMessage(BuildContext context, String title, String content) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: t.subtitle,
          ),
          content: Text(
            content,
            style: t.messages,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancelar')),
          ],
        );
      });
}
