import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis_vecinos_app/ui/modules/documents/widgets/kard.dart';

import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class Documents extends ConsumerStatefulWidget {
  const Documents({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TransparencyState();
}

class _TransparencyState extends ConsumerState<Documents> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: size.height * 0.025,
            top: size.height * 0.05,
            right: size.height * 0.025),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Documentos', style: t.title),
              SvgPicture.asset('assets/icons/svg/menu.svg', color: c.black),
            ],
          ),
          Text(
            'Últimos',
            style: t.messages,
          ),
          //
          SizedBox(
            height: size.height * 0.05,
          ),
          const Kard(title: 'Reglamento', image: 'assets/icons/document.png')
          // const Divider(),
        ],
      ),
    );
  }
}
