import 'package:anabebe_packages/utils/log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pLogger = Logger();

final refreshTitleProvider = Provider((ref) => 'RefreshIndicator');

final refreshProvider = FutureProvider<void>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
});

final pullRefreshTitleProvider = Provider((ref) => 'PullRefreshScrollView');

// to View
final pullRefreshProvider = StateNotifierProvider<_PullRefreshNotifier, int>(
  (ref) => _PullRefreshNotifier(),
);

// ViewModel
class _PullRefreshNotifier extends StateNotifier<int> {
  _PullRefreshNotifier() : super(0);

  void init() {
    pLogger.setup('_PullRefreshNotifier');
  }

  void add() => state++;

  void refresh() => state = 0;
}
