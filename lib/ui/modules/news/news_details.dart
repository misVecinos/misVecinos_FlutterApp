import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/utils/utils.dart';

import '../../../core/modules/news/news.dart';
import '../../utils/colors.dart';
import '../../utils/text_styles.dart';

class NewsDetails extends ConsumerWidget {
  const NewsDetails(this.news, {Key? key}) : super(key: key);
  final New news;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return Material(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(top: 0),
            physics: const BouncingScrollPhysics(),
            children: [
              _newsImage(size, context, news),
              _content(news, context),
            ],
          ),
          //
          _topButtons(context, news),
          //
        ],
      ),
    );
  }
}

Widget _newsImage(Size size, BuildContext context, New mainNew) {
  return Stack(
    children: [
      Image.asset(
        mainNew.imagen,
        fit: BoxFit.cover,
        height: size.height * 0.45,
        width: size.height * 0.6,
      ),
      //
      Container(
        height: size.height * 0.46,
        width: size.height * 0.6,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [
            0.3,
            0.6,
            0.9,
          ],
          colors: [
            c.surface,
            c.secondary.withOpacity(0.5),
            c.secondary,
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.014),
                child: Text(
                  mainNew.titulo,
                  style: t.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                date(mainNew.fechaCreacion),
                style: t.messagesBlue,
              )
            ],
          ),
        ),
      ),
      //
      // _topButtons(context, mainNew),
    ],
  );
}

Widget _topButtons(BuildContext context, New mainNew) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final imageProvider = Image.asset(mainNew.imagen).image;
              showImageViewer(context, imageProvider,
                  backgroundColor: c.black.withOpacity(0.6),
                  swipeDismissible: true);
            },
            icon: Icon(Icons.image, color: c.primary),
          ),
        ],
        backgroundColor: c.surface,
        elevation: 0,
        centerTitle: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
    ),
  );
}

Widget _content(New news, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
    child: Text(
      toParagraphs(news.noticia),
      style: t.messagesBlack,
    ),
  );
}
