import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/colors.dart';
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
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Documentos', style: t.title),
            Text('Últimos', style: t.messages),
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(
            left: size.height * 0.025, top: 0, right: size.height * 0.025),
        children: [
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
