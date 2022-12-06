import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/ui/modules/news/news_details.dart';
import 'package:mis_vecinos_app/ui/modules/news/state.dart';

import '../../../core/modules/news/news.dart';
import '../../utils/text_styles.dart';
import '../../utils/utils.dart';
import '../documents/widgets/kard.dart';
import 'controller.dart';

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends ConsumerState<NewsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Acordarse de watch, read y listen tienen distintas implicaciones
      final provider = ref.read(newsControllerProvider.notifier);
      provider.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final state = ref.watch(newsControllerProvider);
    List<New> listNews = state.noticias ?? [];

    switch (state.state) {
      case States.loading:
        return const Center(child: CircularProgressIndicator());

      case States.succes:
        return Scaffold(
          drawerEnableOpenDragGesture: true,
          body: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
                left: size.height * 0.025,
                top: size.height * 0.05,
                right: size.height * 0.025),
            children: [
              Text('Noticias', style: t.title),
              Text(
                'Últimas',
                style: t.messages,
              ),
              //
              SizedBox(
                height: size.height * 0.01,
              ),
              listNews.isEmpty
                  ? Text(
                      'Aun no hay noticias',
                      style: t.subtitle,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: listNews.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return NewsDetails(listNews[index]);
                              }));
                            },
                            child: Kard(
                                fecha: date(listNews[index].fechaCreacion),
                                title: listNews[index].titulo,
                                image: listNews[index].imagen));
                      })
            ],
          ),
        );

      case States.error:
        return Center(child: ErrorWidget.withDetails());
    }
  }
}
