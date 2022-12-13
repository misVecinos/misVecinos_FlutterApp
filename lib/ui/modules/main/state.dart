import 'package:freezed_annotation/freezed_annotation.dart';
import 'pages.dart';

part 'state.freezed.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    required List<PageMenu> pages,
    required PageMenu currentPage,
  }) = _MainState;
}

// import 'package:mis_vecinos_app/ui/modules/main/pages.dart';

// class MainState {
//   List<PageMenu> pages;
//   PageMenu currentPage;

//   MainState({required this.pages, required this.currentPage});
// }
