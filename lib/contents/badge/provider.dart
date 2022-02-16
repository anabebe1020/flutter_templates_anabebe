import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final badgeTitleProvider = StateProvider((ref) => 'Badges');

final badgeProvider = ChangeNotifierProvider<BadgeNotifier>(
  (ref) => BadgeNotifier(),
);

class BadgeNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void onPressPlus() {
    _count++;
    notifyListeners();
  }

  void onPressMinus() {
    _count--;
    notifyListeners();
  }
}
