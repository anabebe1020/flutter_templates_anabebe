import 'package:flutter/material.dart';
import 'package:flutter_templates_anabebe/common/themes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final darkModeProvider = StateNotifierProvider<_DarkModeNotifier, ThemeData>(
  (ref) => _DarkModeNotifier(),
);

class _DarkModeNotifier extends StateNotifier<ThemeData> {
  _DarkModeNotifier() : super(MyTheme.dark);

  bool get isDark => state == MyTheme.dark;

  void onModeChanged(bool isDark) {
    state = isDark ? MyTheme.dark : MyTheme.light;
  }
}
