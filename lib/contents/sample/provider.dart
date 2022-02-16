import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleTitleProvider = StateProvider((ref) => 'Sample');

final sampleProvider = ChangeNotifierProvider<SamplehNotifier>(
  (ref) => SamplehNotifier(),
);

class SamplehNotifier extends ChangeNotifier {
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

  void onPressClear() {
    _count = 0;
    notifyListeners();
  }
}
