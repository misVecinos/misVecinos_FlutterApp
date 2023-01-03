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

    _loadPetToday(widget.history);
    _loadAlumToday(widget.history);

    _loadPetMonth(widget.history);
    _loadAlumMonth(widget.history);

    _loadPetYear(widget.history);
    _loadAlumYear(widget.history);
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
            Text(
                widget.title == 'PET'
                    ? _loadPetToday(widget.history)
                    : _loadAlumToday(widget.history),
                style: t.messagesGreen,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text('Este mes: ',
                style: t.messages,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(
                widget.title == 'PET'
                    ? _loadPetMonth(widget.history)
                    : _loadAlumMonth(widget.history),
                style: t.messagesGreen,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text('Este año: ',
                style: t.messages,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            Text(
                widget.title == 'PET'
                    ? _loadPetYear(widget.history)
                    : _loadAlumYear(widget.history),
                style: t.messagesGreen,
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

  String _loadPetToday(History? history) {
    List today = [];
    int tod = 0;

    for (RecycleRegister register in history != null ? history.data : today) {
      if (register.quantityPet > 0 &&
          register.dateIn.day == DateTime.now().day) {
        today.add(register);
        tod += register.quantityPet;
      } else {
        continue;
      }
    }

    setState(() {});
    return today.isEmpty ? '0' : '${tod.toString()} piezas.';
  }

  String _loadAlumToday(History? history) {
    List today = [];
    int tod = 0;

    for (RecycleRegister register in history != null ? history.data : today) {
      if (register.quantityAlum > 0 &&
          register.dateIn.day == DateTime.now().day) {
        today.add(register);
        tod += register.quantityAlum;
      } else {
        continue;
      }
    }

    setState(() {});
    return today.isEmpty ? '0' : '${tod.toString()} piezas.';
  }

  String _loadPetMonth(History? history) {
    List month = [];
    int mont = 0;

    for (RecycleRegister register in history != null ? history.data : month) {
      if (register.quantityPet > 0 &&
          register.dateIn.month == DateTime.now().month) {
        month.add(register);
        mont += register.quantityPet;
      } else {
        continue;
      }
    }

    setState(() {});
    return month.isEmpty ? '0' : '${mont.toString()} piezas.';
  }

  String _loadAlumMonth(History? history) {
    List month = [];
    int mont = 0;

    for (RecycleRegister register in history != null ? history.data : month) {
      if (register.quantityAlum > 0 &&
          register.dateIn.month == DateTime.now().month) {
        month.add(register);
        mont += register.quantityAlum;
      } else {
        continue;
      }
    }

    setState(() {});
    return month.isEmpty ? '0' : '${mont.toString()} piezas.';
  }

  String _loadPetYear(History? history) {
    List year = [];
    int yer = 0;

    for (RecycleRegister register in history != null ? history.data : year) {
      if (register.quantityPet > 0 &&
          register.dateIn.year == DateTime.now().year) {
        year.add(register);
        yer += register.quantityPet;
      } else {
        continue;
      }
    }

    setState(() {});
    return year.isEmpty ? '0' : '${yer.toString()} piezas.';
  }

  String _loadAlumYear(History? history) {
    List year = [];
    int yer = 0;

    for (RecycleRegister register in history != null ? history.data : year) {
      if (register.quantityAlum > 0 &&
          register.dateIn.year == DateTime.now().year) {
        year.add(register);
        yer += register.quantityAlum;
      } else {
        continue;
      }
    }

    setState(() {});
    return year.isEmpty ? '0' : '${yer.toString()} piezas.';
  }
}
