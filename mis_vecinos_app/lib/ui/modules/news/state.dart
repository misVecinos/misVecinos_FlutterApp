import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/modules/news/news.dart';
part 'state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState({
    List<New>? noticias,
    @Default(States.loading) States state,
  }) = _NewsState;
}

enum States { succes, error, loading }
