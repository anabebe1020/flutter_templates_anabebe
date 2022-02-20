import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _pageTitles = ['Page A', 'Page B', 'Page C', 'Page D', 'Page E'];
final pageViewTitleProvider = Provider((ref) => 'PageView');
final pageTitleProvider = Provider((ref) => _pageTitles);

final pageChangeProvider = StateNotifierProvider<_PageChangeNotifier, int>(
  (ref) => _PageChangeNotifier(),
);

class _PageChangeNotifier extends StateNotifier<int> {
  _PageChangeNotifier() : super(0);

  void onPageChanged(int index) {
    state = index;
  }

  void onItemTapped(int index, PageController pageController) {
    // setting animation page.
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void nextPageChange() {
    state++;
  }

  void prevPageChange() {
    state--;
  }
}
