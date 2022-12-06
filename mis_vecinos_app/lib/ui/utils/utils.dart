import 'package:flutter/material.dart';

String date(DateTime date) {
  String dateFormatted = '${date.day} de ${month(date.month)} de ${date.year}';
  return dateFormatted;
}

String month(int month) {
  if (month == 1) {
    return 'Enero';
  } else if (month == 2) {
    return 'Febrero';
  } else if (month == 3) {
    return 'Marzo';
  } else if (month == 4) {
    return 'Abril';
  } else if (month == 5) {
    return 'Mayo';
  } else if (month == 6) {
    return 'Junio';
  } else if (month == 7) {
    return 'Julio';
  } else if (month == 8) {
    return 'Agosto';
  } else if (month == 9) {
    return 'Septiembre';
  } else if (month == 10) {
    return 'Octubre';
  } else if (month == 11) {
    return 'Noviembre';
  } else if (month == 12) {
    return 'Diciembre';
  } else {
    return 'otro';
  }
}

String toParagraphs(String description) {
  List<String> splited = description.split(' ');
  List<String> mainList = [];

  for (int i = 0; i < splited.length; i++) {
    if (splited[i].characters.contains('.')) {
      mainList.insert(i, '.\n\n');
    } else {
      mainList.add(splited[i]);
    }
  }

  return mainList.join(' ');
}
