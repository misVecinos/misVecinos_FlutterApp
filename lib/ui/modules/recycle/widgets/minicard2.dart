import 'package:flutter/material.dart';
import 'package:mis_vecinos_app/core/modules/recycle/history.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_styles.dart';

class MiniCard2 extends StatefulWidget {
  const MiniCard2({
    Key? key,
    required this.title,
    this.history,
  }) : super(key: key);

  final String title;
  final History? history;

  @override
  State<MiniCard2> createState() => _MiniCard2State();
}

class _MiniCard2State extends State<MiniCard2> {
  @override
  void initState() {
    super.initState();

    _loadHistorialToday(widget.history);
    _loadHistorialMonth(widget.history);
    _loadHistorialYear(widget.history);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .45,
      width: size.width * .41,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
              color: c.disabled.withOpacity(0.4),
              blurRadius: 20.0,
              offset: const Offset(1, 1))
        ],
        color: const Color(0xffFDFDFD),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.015,
          bottom: size.height * 0.015,
          left: size.height * 0.02,
          right: size.height * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.title == 'PET' ? 'assets/bottle.png' : 'assets/can.png',
              height: size.height * .16,
              width: size.width * .25,
            ),
            Text(widget.title,
                style: t.messagesBold,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text('Hoy: ',
                style: t.messages,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(_loadHistorialToday(widget.history),
                style: _loadHistorialToday(widget.history) == '0'
                    ? t.messagesBold
                    : t.messagesGreen,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text('Este mes: ',
                style: t.messages,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(_loadHistorialMonth(widget.history),
                style: _loadHistorialMonth(widget.history) == '0'
                    ? t.messagesBold
                    : t.messagesGreen,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text('Este año: ',
                style: t.messages,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(_loadHistorialYear(widget.history),
                style: _loadHistorialYear(widget.history) == '0'
                    ? t.messagesBold
                    : t.messagesGreen,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            //
            // const Spacer(),
            // //
            // GestureDetector(
            //   onTap: () {
            //     print('tap');
            //   },
            //   child: Row(
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text('Más info',
            //           style: t.messagesBlue,
            //           textAlign: TextAlign.center,
            //           maxLines: 1,
            //           overflow: TextOverflow.ellipsis),
            //       Icon(Icons.help, color: c.disabled)
            //     ],
            //   ),
            // )
            //
          ],
        ),
      ),
    );
  }

  String _loadHistorialToday(History? history) {
    List today = [];

    for (RecycleRegister register in history != null ? history.data : today) {
      if (register.dateIn.day == DateTime.now().day) {
        today.add(register);
      } else {
        continue;
      }
    }

    setState(() {});
    return today.isEmpty ? '0' : '${today.length.toString()} piezas.';
  }

  String _loadHistorialMonth(History? history) {
    List month = [];

    for (RecycleRegister register in history != null ? history.data : month) {
      if (register.dateIn.month == DateTime.now().month) {
        month.add(register);
      } else {
        continue;
      }
    }

    setState(() {});
    return month.isEmpty ? '0' : '${month.length.toString()} piezas.';
  }

  String _loadHistorialYear(History? history) {
    List year = [];

    for (RecycleRegister register in history != null ? history.data : year) {
      if (register.dateIn.year == DateTime.now().year) {
        year.add(register);
      } else {
        continue;
      }
    }

    setState(() {});
    return year.isEmpty ? '0' : '${year.length.toString()} piezas.';
  }
}
