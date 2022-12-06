import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
  return Hero(
    tag: 'news',
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            mainNew.imagen,
            fit: BoxFit.cover,
            height: size.height * 0.45,
            width: size.height * 0.6,
          ),
        ),
        //
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          child: Container(
            height: size.height * 0.45,
            width: size.height * 0.6,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.3,
                0.9,
              ],
              colors: [
                c.surface,
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
        ),
        //
        // _topButtons(context, mainNew),
      ],
    ),
  );
}

Widget _topButtons(BuildContext context, New mainNew) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: 26,
              backgroundColor: c.secondary.withOpacity(0.8),
              child: SvgPicture.asset('assets/icons/svg/arrow-back-ios.svg'),
            ),
          ),
          //
          InkWell(
            onTap: () {
              final imageProvider = Image.asset(mainNew.imagen).image;
              showImageViewer(context, imageProvider,
                  backgroundColor: c.black.withOpacity(0.6),
                  swipeDismissible: true);
            },
            child: CircleAvatar(
              radius: 26,
              backgroundColor: c.secondary.withOpacity(0.8),
              child: Icon(
                Icons.image,
                color: c.black,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _content(New news, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
    child: Text(
      toParagraphs(news.noticia),
      style: t.messages,
    ),
  );
}
