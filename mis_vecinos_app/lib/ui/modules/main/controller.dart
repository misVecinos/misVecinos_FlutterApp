import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/main/pages.dart';

import 'state.dart';

final mainController = StateNotifierProvider<MenuSection, MainState>(
    (_) => MenuSection(mainSection));

final mainSection = MainState(pages: pages, currentPage: current);
const current = PageMenu(icon: Icon(Icons.abc), page: Pages.inicio);

final List<PageMenu> pages = [
  const PageMenu(icon: Icon(Icons.abc), page: Pages.inicio),
  const PageMenu(icon: Icon(Icons.abc), page: Pages.vecinos),
  const PageMenu(icon: Icon(Icons.abc), page: Pages.alerta),
  const PageMenu(icon: Icon(Icons.abc), page: Pages.pagos),
  // const PageMenu(icon: Icon(Icons.abc), page: Pages.menu)
];

class MenuSection extends StateNotifier<MainState> {
  MenuSection(super.state);

  void setSelectedPage(int index) {
    final currentPage = state.pages[index];
    state = state.copyWith(currentPage: currentPage);
  }

  // dynamic noticias() {
  //   return state = state.copyWith(
  //       sections: sections,
  //       currentSection: current.copyWith(section: Sections.Noticias));
  // }

} //

final menu =
    StateNotifierProvider<ColorTransition, bool>((_) => ColorTransition(false));

class ColorTransition extends StateNotifier<bool> {
  ColorTransition(super.state);

  bool active() {
    return state = true;
  }

  bool inactive() {
    return state = false;
  }

  bool refreshState() {
    return state = !state;
  }
}
