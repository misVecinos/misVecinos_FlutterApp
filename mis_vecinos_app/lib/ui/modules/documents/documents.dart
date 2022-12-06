import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/text_styles.dart';
import 'document_details.dart';
import 'widgets/kard.dart';

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
      drawerEnableOpenDragGesture: true,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: size.height * 0.025,
            top: size.height * 0.05,
            right: size.height * 0.025),
        children: [
          Text('Documentos', style: t.title),
          Text(
            'Últimos',
            style: t.messages,
          ),
          //
          SizedBox(
            height: size.height * 0.03,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (_, animation, __) => FadeTransition(
                              opacity: animation,
                              child: const DocumentDetails(),
                            )));
              },
              child: const KardDocument(
                  title: 'Reglamento', image: 'assets/icons/document.png'))
        ],
      ),
    );
  }
}
