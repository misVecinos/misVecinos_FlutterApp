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
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    @override
    void initState() {
      super.initState();

      _loadHistorialToday(widget.history);
      _loadHistorialMonth(widget.history);
      _loadHistorialYear(widget.history);
    }

    return Container(
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
      //height: size.height * .18,
      width: size.width * .41,
      child: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.015,
          bottom: size.height * 0.015,
          left: size.height * 0.02,
          right: size.height * 0.02,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.title == 'PET' ? 'assets/bottle.png' : 'assets/can.png',
              height: size.height * .08,
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
          ],
        ),
      ),
    );
  }

  String _loadHistorialToday(History? history) {
    List today = [];
    final length = history?.data.length ?? 0;

    for (int i = 0; i < length; i++) {
      if (history?.data[i].createdAt.day == DateTime.now().day) {
        today.add(history?.data[i]);
      } else {
        return '0';
      }
    }
    setState(() {});
    return today.length.toString();
  }

  String _loadHistorialMonth(History? history) {
    List month = [];
    final length = history?.data.length ?? 0;

    for (int i = 0; i < length; i++) {
      if (history?.data[i].createdAt.month == DateTime.now().month) {
        month.add(history?.data[i]);
      } else {
        return '0';
      }
    }
    setState(() {});
    return month.length.toString();
  }

  String _loadHistorialYear(History? history) {
    List year = [];
    final length = history?.data.length ?? 0;

    for (int i = 0; i < length; i++) {
      if (history?.data[i].createdAt.year == DateTime.now().year) {
        year.add(history?.data[i]);
      } else {
        return '0';
      }
    }
    setState(() {});
    return year.length.toString();
  }
}
