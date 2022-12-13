import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/documents/documents.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';
import '../settings/settings.dart';

class MenuDrawer extends ConsumerStatefulWidget {
  const MenuDrawer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VecinosPageState();
}

class _VecinosPageState extends ConsumerState<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.1, left: size.width * 0.05),
            child: Container(
              height: size.height * 0.039,
              width: size.width * 0.465,
              color: c.surface,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  'Mis Vecinos',
                  style: t.titleApp,
                ),
              ),
            ),
          ),
          //
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.05),
            child: Row(
              children: [
                Container(
                  color: c.surface,
                  height: size.height * 0.47,
                  // width: size.width * 0.03,
                  child: AnimatedPadding(
                    curve: Curves.fastOutSlowIn,
                    padding: const EdgeInsets.only(top: 0),
                    duration: const Duration(milliseconds: 500),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: c.primary,
                          height: size.height * 0.05,
                          width: size.width * 0.02,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: c.surface,
                  height: size.height * 0.5,
                  width: size.width * 0.68,
                  child: Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          onTap: () {},
                          leading: SvgPicture.asset(
                            'assets/icons/svg/home.svg',
                            color: c.primary,
                            height: size.height * 0.03,
                            width: size.height * 0.03,
                          ),
                          trailing: SvgPicture.asset(
                            'assets/icons/svg/arrow-forward-ios.svg',
                            color: c.primary,
                            height: size.height * 0.03,
                            width: size.height * 0.03,
                          ),
                          title: Text(
                            'Inicio',
                            style: t.link,
                          ),
                        ),
                        //
                        // ListTile(
                        //   onTap: () {},
                        //   leading: SvgPicture.asset(
                        //     'assets/icons/svg/news.svg',
                        //     color: c.disabled,
                        //     height: size.height * 0.03,
                        //     width: size.height * 0.03,
                        //   ),
                        //   trailing: SvgPicture.asset(
                        //     'assets/icons/svg/arrow-forward-ios.svg',
                        //     color: c.disabled,
                        //     height: size.height * 0.03,
                        //     width: size.height * 0.03,
                        //   ),
                        //   title: Text(
                        //     'Noticias',
                        //     style: t.messages,
                        //   ),
                        // ),
                        // ListTile(
                        //   onTap: () {},
                        //   leading: SvgPicture.asset(
                        //     'assets/icons/svg/schedule.svg',
                        //     color: c.disabled,
                        //     height: size.height * 0.035,
                        //     width: size.height * 0.035,
                        //   ),
                        //   trailing: SvgPicture.asset(
                        //     'assets/icons/svg/arrow-forward-ios.svg',
                        //     color: c.disabled,
                        //     height: size.height * 0.03,
                        //     width: size.height * 0.03,
                        //   ),
                        //   title: Text(
                        //     'Agenda',
                        //     style: t.messages,
                        //   ),
                        // ),
                        //--------------------------------------
                        // ListTile(
                        //   onTap: () {},
                        //   leading: SvgPicture.asset(
                        //     'assets/icons/svg/survey.svg',
                        //     color: c.disabled,
                        //     height: size.height * 0.03,
                        //     width: size.height * 0.03,
                        //   ),
                        //   trailing: SvgPicture.asset(
                        //     'assets/icons/svg/arrow-forward-ios.svg',
                        //     color: c.disabled,
                        //     height: size.height * 0.03,
                        //     width: size.height * 0.03,
                        //   ),
                        //   title: Text(
                        //     'Encuestas',
                        //     style: t.messages,
                        //   ),
                        // ),
                        // ListTile(
                        //   onTap: () {},
                        //   leading: SvgPicture.asset(
                        //     'assets/icons/svg/chat.svg',
                        //     color: c.disabled,
                        //     height: size.height * 0.03,
                        //     width: size.height * 0.03,
                        //   ),
                        //   trailing: SvgPicture.asset(
                        //     'assets/icons/svg/arrow-forward-ios.svg',
                        //     color: c.disabled,
                        //     height: size.height * 0.03,
                        //     width: size.height * 0.03,
                        //   ),
                        //   title: Text(
                        //     'Hablar con el administrador',
                        //     style: t.messages,
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: size.height * 0.05,
                        // ),

                        ListTile(
                          onTap: () {
                            Scaffold.of(context).closeEndDrawer();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const Documents();
                            }));
                          },
                          leading: const Icon(
                            Icons.document_scanner,
                          ),
                          trailing: SvgPicture.asset(
                            'assets/icons/svg/arrow-forward-ios.svg',
                            color: c.disabled,
                            height: size.height * 0.03,
                            width: size.height * 0.03,
                          ),
                          title: Text(
                            'Documentos',
                            style: t.messages,
                          ),
                        ),
                        ListTile(
                          onTap: () {
                            Scaffold.of(context).closeEndDrawer();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SettingsPage();
                            }));
                          },
                          leading: SvgPicture.asset(
                            'assets/icons/svg/settings.svg',
                            color: c.disabled,
                            height: size.height * 0.03,
                            width: size.height * 0.03,
                          ),
                          trailing: SvgPicture.asset(
                            'assets/icons/svg/arrow-forward-ios.svg',
                            color: c.disabled,
                            height: size.height * 0.03,
                            width: size.height * 0.03,
                          ),
                          title: Text(
                            'Ajustes',
                            style: t.messages,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          // const Spacer(),
          // Padding(
          //   padding: EdgeInsets.all(size.height * 0.03),
          //   child: Text(
          //     'Versión: 0.0.1.1',
          //     style: t.messages,
          //   ),
          // ),
        ],
      ),
    );
  }

  // double moveSelect(){

  // }
}
