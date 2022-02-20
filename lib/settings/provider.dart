import 'package:flutter_riverpod/flutter_riverpod.dart';

final darkModeProvider = StateNotifierProvider<_DarkModeNotifier, bool>(
  (ref) => _DarkModeNotifier(),
);

class _DarkModeNotifier extends StateNotifier<bool> {
  _DarkModeNotifier() : super(true);

  void onModeChanged() {
    state = !state;
  }
}
