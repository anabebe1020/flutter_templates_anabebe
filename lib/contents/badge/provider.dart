import 'package:flutter_riverpod/flutter_riverpod.dart';

final badgeTitleProvider = Provider((ref) => 'Badges');

final badgeProvider = StateNotifierProvider<_BadgeNotifier, int>(
  (ref) => _BadgeNotifier(),
);

class _BadgeNotifier extends StateNotifier<int> {
  _BadgeNotifier() : super(0);

  void onPressPlus() {
    state++;
  }

  void onPressMinus() {
    state--;
  }
}
