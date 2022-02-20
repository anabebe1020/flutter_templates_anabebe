import 'package:flutter_riverpod/flutter_riverpod.dart';

final sampleTitleProvider = StateProvider((ref) => 'Sample');

final sampleProvider = StateNotifierProvider<_SamplehNotifier, int>(
  (ref) => _SamplehNotifier(),
);

class _SamplehNotifier extends StateNotifier<int> {
  _SamplehNotifier() : super(0);

  void onPressPlus() {
    state++;
  }

  void onPressMinus() {
    state--;
  }

  void onPressClear() {
    state = 0;
  }
}
