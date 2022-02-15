import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageViewTitleProvider = StateProvider((ref) => 'PageView');
final badgeTitleProvider = StateProvider((ref) => 'Badge');
final pageATitleProvider = StateProvider((ref) => 'Page A');
final pageBTitleProvider = StateProvider((ref) => 'Page B');
final pageCTitleProvider = StateProvider((ref) => 'Page C');
final pageDTitleProvider = StateProvider((ref) => 'Page D');
final pageETitleProvider = StateProvider((ref) => 'Page E');

final pageChangeProvider = ChangeNotifierProvider<PageChangeNotifier>(
  (ref) => PageChangeNotifier(),
);

class PageChangeNotifier extends ChangeNotifier {
  int currentIndex = 0;

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onItemTapped(int index, PageController pageController) {
    // setting animation page.
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    notifyListeners();
  }

  void nextPageChange() {
    currentIndex = currentIndex++;
    notifyListeners();
  }

  void prevPageChange() {
    currentIndex = currentIndex--;
    notifyListeners();
  }
}
