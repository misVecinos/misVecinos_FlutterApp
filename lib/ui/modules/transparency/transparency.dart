import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/transparency/transparency_details.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../menu/menu.dart';

class Transparency extends ConsumerStatefulWidget {
  const Transparency({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<Transparency> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  final List<String> months = [
    'Diciembre 2022',
    // 'Enero 2023',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        endDrawer: const MenuDrawer(),
        drawerEnableOpenDragGesture: false,
        body: PageView.builder(
          controller: pageController,
          itemCount: months.length, //Controla los meses del fraccionamiento
          itemBuilder: (context, index) {
            //
            return ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                AppBar(
                  title:
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text('Transparencia ', style: t.title),
                      //     Text('Cuentas claras', style: t.messages)
                      //   ],
                      // ),
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      index == 0
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                pageController.animateToPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeIn,
                                    index - 1);
                                pageController.jumpToPage(index - 1);
                              },
                              child:
                                  const Icon(Icons.arrow_back_ios, size: 18)),
                      Text(
                        months[index],
                        style: t.subtitle,
                      ),
                      months.length.toInt() == index + 1
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                pageController.animateToPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeIn,
                                    index + 1);
                                pageController.jumpToPage(index + 1);
                              },
                              child: const Icon(Icons.arrow_forward_ios,
                                  size: 18)),
                    ],
                  ),
                  actions: [
                    Icon(
                      Icons.abc,
                      color: c.surface,
                    ),
                  ],
                  backgroundColor: c.surface,
                  elevation: 0,
                  centerTitle: false,
                  systemOverlayStyle: SystemUiOverlayStyle.dark,
                ),

                //
                TransparencyDetails(
                    index: index, month: 'Noviembre ${index.toString()}'),
              ],
            );
          },
        ));
  }
}
