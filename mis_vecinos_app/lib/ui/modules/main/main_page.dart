import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/alert/alert.dart';
import 'package:mis_vecinos_app/ui/modules/home/home_page.dart';
import 'package:mis_vecinos_app/ui/modules/menu/menu.dart';
import 'package:mis_vecinos_app/ui/modules/pagos/pagos.dart';
import 'package:mis_vecinos_app/ui/modules/vecinos/vecinos.dart';

import '../../utils/colors.dart';
import 'controller.dart';
import 'pages.dart';
import 'state.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainPage> {
  //
  openCloseDrawer(GlobalKey<ScaffoldState> scaffoldKey) {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
      ref.read(menu.notifier).inactive();
    } else {
      scaffoldKey.currentState!.openDrawer();
      // ref.read(menu.notifier).inactive();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(mainController);
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // key: scaffoldKey,
      endDrawer: const MenuDrawer(),
      drawerEnableOpenDragGesture: true,
      body: SafeArea(
        child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            switchInCurve: Curves.fastOutSlowIn,
            switchOutCurve: Curves.easeInBack,
            child: _pages(state)),
      ),
      // bottomNavigationBar: Platform.isIOS
      //     ? _menu(state, scaffoldKey)
      //     : SafeArea(child: _menu(state, scaffoldKey))
      floatingActionButton: FloatingActionButton(
        backgroundColor: c.error,
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.02),
          child: SvgPicture.asset('assets/icons/alarm.svg', color: c.secondary),
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AlertPage();
          }));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.hardEdge,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: _menu(state),
      ),
    );
  }

  Widget _pages(MainState state) {
    switch (state.currentPage.page) {
      case Pages.inicio:
        return const HomePage();

      case Pages.vecinos:
        return const VecinosPage();

      case Pages.pagos:
        return const PagosPage();
    }
  }

  Widget _menu(MainState state) {
    final size = MediaQuery.of(context).size;

    return Container(
        height: size.height * 0.08,
        width: size.width,
        color: c.secondary,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          GestureDetector(
              onTap: () => ref.read(mainController.notifier).setSelectedPage(0),
              child: _icons(
                'assets/icons/home.svg',
                'Inicio',
                state,
                ref.watch(mainController).currentPage.page == Pages.inicio
                    ? c.primary
                    : c.disabled,
              )),
          GestureDetector(
              onTap: () => ref.read(mainController.notifier).setSelectedPage(1),
              child: _icons(
                  'assets/icons/houses.svg',
                  'Vecinos',
                  state,
                  ref.watch(mainController).currentPage.page == Pages.vecinos
                      ? c.primary
                      : c.disabled)),
          _icons('assets/icons/houses.svg', 'Vecinos', state, c.surface),
          GestureDetector(
              onTap: () => ref.read(mainController.notifier).setSelectedPage(2),
              child: _icons(
                  'assets/icons/money.svg',
                  'Pagos',
                  state,
                  ref.watch(mainController).currentPage.page == Pages.pagos
                      ? c.primary
                      : c.disabled)),
          Builder(
            builder: (context) {
              return GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                    //
                    // if (scaffoldKey.currentState!.isDrawerOpen) {
                    //   Scaffold.of(context).closeEndDrawer();
                    //   ref.read(menu.notifier).inactive();
                    // } else {
                    //   Scaffold.of(context).openEndDrawer();
                    //   ref.read(menu.notifier).active();
                    // }
                    //
                  },
                  child: _icons('assets/icons/menu.svg', 'Menu', state,
                      ref.watch(menu) == true ? c.primary : c.disabled));
            },
          ),
        ]));
    //
  }

  Widget _icons(String asset, String name, MainState state, Color color) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.08,
      width: size.width / 5,
      child: FittedBox(
        fit: BoxFit.fitHeight,
        child: Padding(
          padding: EdgeInsets.all(size.height * 0.01),
          child: Column(
            children: [
              //
              SvgPicture.asset(
                asset,
                color: color,
                height: size.height * 0.03,
              ),
              //
              Text(
                name,
                style: TextStyle(color: color, fontSize: 12),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}//