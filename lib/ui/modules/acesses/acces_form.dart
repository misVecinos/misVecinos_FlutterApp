import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class AccesForm extends ConsumerStatefulWidget {
  const AccesForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AccesFormState();
}

class _AccesFormState extends ConsumerState<AccesForm> {
  final name = TextEditingController();
  final description = TextEditingController();

  final appbar = AppBar(
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Acceso temporal ', style: t.title),
        Text('Acceso a personas', style: t.messages)
      ],
    ),
    actions: [Icon(Icons.help, color: c.surface)],
    backgroundColor: c.surface,
    elevation: 0,
    centerTitle: false,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var endDate = DateTime.now();
    var startDate = DateTime.now();

    return Scaffold(
      appBar: appbar,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: ListView(
          padding: EdgeInsets.only(
              left: size.height * 0.025, top: 0, right: size.height * 0.025),
          children: [
            SizedBox(height: size.height * 0.03),
            const Text('Completa los siguientes datos:'),

            //
            SizedBox(height: size.height * 0.05),
            const Text('Nombre completo de la persona a ingresar:'),

            SizedBox(height: size.height * 0.015),
            Container(
              height: size.height * 0.07,
              width: size.width * 0.9,
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.name,
                textAlignVertical: TextAlignVertical.top,
                controller: name,
                textCapitalization: TextCapitalization.words,
                maxLines: 1,
                style: t.messagesBlack,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 12,
                        bottom: 0, // HERE THE IMPORTANT PART
                        top: size.height * 0.07 / 2),
                    hintText: 'Ingresa nombre',
                    prefixIcon: const Icon(Icons.person),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: c.disabled),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: c.primary),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),

            SizedBox(height: size.height * 0.02),
            const Text('Fecha de ingreso:'),

            SizedBox(height: size.height * 0.015),
            GestureDetector(
              onTap: () async {
                var results = await showCalendarDatePicker2Dialog(
                  context: context,
                  config: CalendarDatePicker2WithActionButtonsConfig(),
                  dialogSize: const Size(325, 400),
                  initialValue: [],
                  borderRadius: BorderRadius.circular(15),
                );
              },
              child: Container(
                height: size.height * 0.07,
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: c.disabled, width: 1)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.av_timer, color: c.disabled),
                    ),
                    Text('Fecha', style: t.messages),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            const Text('Fecha de salida:'),

            SizedBox(height: size.height * 0.015),
            Container(
              height: size.height * 0.07,
              width: size.width * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: c.disabled, width: 1)),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.timelapse, color: c.disabled),
                  ),
                  Text('Fecha', style: t.messages),
                ],
              ),
            ),

            SizedBox(height: size.height * 0.02),
            const Text('Descripción:'),

            SizedBox(height: size.height * 0.015),
            Container(
              height: size.height * 0.07,
              width: size.width * 0.9,
              alignment: Alignment.center,
              child: TextField(
                textAlign: TextAlign.start,
                keyboardType: TextInputType.name,
                textAlignVertical: TextAlignVertical.top,
                controller: description,
                textCapitalization: TextCapitalization.sentences,
                maxLines: 1,
                style: t.messagesBlack,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 12,
                        bottom: 0, // HERE THE IMPORTANT PART
                        top: size.height * 0.07 / 2),
                    hintText: 'Descripción breve',
                    prefixIcon: const Icon(Icons.comment),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: c.disabled),
                        borderRadius: BorderRadius.circular(10)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: c.primary),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),

            SizedBox(height: size.height * 0.02),
            const Text('(Opcional)'),

            SizedBox(height: size.height * 0.02),
            Center(
              child: Container(
                height: size.height * 0.065,
                width: size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        color: c.disabled.withOpacity(0.4),
                        blurRadius: 20.0,
                        offset: const Offset(1, 1))
                  ],
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera,
                      color: c.primary,
                    ),
                    Text(
                      'Tomar foto',
                      style: t.buttonBlue2,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: size.height * 0.02),
            Center(
              child: Container(
                height: size.height * 0.065,
                width: size.width * 0.85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                        color: c.disabled.withOpacity(0.4),
                        blurRadius: 20.0,
                        offset: const Offset(1, 1))
                  ],
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'Generar acceso',
                    style: t.buttonBlue2,
                  ),
                ),
              ),
            ),

            //
          ],
        ),
      ),
    );
  }
}
