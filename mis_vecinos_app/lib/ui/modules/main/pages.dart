import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pages.freezed.dart';

@freezed
class PageMenu with _$PageMenu {
  const factory PageMenu(
      {required Widget icon,
      @Default(Pages.inicio) Pages page,
      int? bulletCount}) = _PageMenu;
}

enum Pages {
  inicio,
  vecinos,
  alerta,
  pagos,
}

// import 'package:flutter/cupertino.dart';

// class PageMenu {
//   int? bulletCount;
//   Pages page;
//   Widget icon;

//   PageMenu({this.bulletCount, this.page = Pages.inicio, required this.icon});
// }