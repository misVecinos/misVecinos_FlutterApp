import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mis_vecinos_app/core/modules/news/service.dart';
import 'package:mis_vecinos_app/ui/modules/news/state.dart';
import '../../../core/providers/providers.dart';

final newsControllerProvider =
    StateNotifierProvider<NewsControllerNotifier, NewsState>((ref) {
  final service = ref.watch(newsServiceProvider);
  return NewsControllerNotifier(service);
});

class NewsControllerNotifier extends StateNotifier<NewsState> {
  final NewsService newsService;

  NewsControllerNotifier(this.newsService) : super(const NewsState());

  void init() {
    _getNews();
  }

  _getNews() {
    //tratar response
    state =
        state.copyWith(noticias: newsService.getNews(), state: States.succes);
  }
}
