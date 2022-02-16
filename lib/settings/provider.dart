import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final darkModeProvider = ChangeNotifierProvider<DarkModeNotifier>(
  (ref) => DarkModeNotifier(),
);

class DarkModeNotifier extends ChangeNotifier {
  bool _isDark = true;
  bool get isDark => _isDark;

  void onModeChanged() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
