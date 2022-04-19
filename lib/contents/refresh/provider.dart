import 'package:anabebe_packages/utils/log.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pLogger = Logger();

final refreshTitleProvider = Provider((ref) => 'RefreshIndicator');

final refreshProvider = FutureProvider<void>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
});

final pullRefreshTitleProvider = Provider((ref) => 'PullRefreshScrollView');

// to View
final pullRefreshProvider =
    StateNotifierProvider<_PullRefreshNotifier, List<int>>(
  (ref) => _PullRefreshNotifier(),
);

// ViewModel
class _PullRefreshNotifier extends StateNotifier<List<int>> {
  _PullRefreshNotifier() : super([0]);

  void init() {
    pLogger.setup('_PullRefreshNotifier');
  }

  void add() {
    try {
      pLogger.log('add start');
      state.add(state.last + 1);
      pLogger.log(state.toString());
    } catch (e) {
      rethrow;
    } finally {
      pLogger.log('add end');
    }
  }

  void refresh() {
    try {
      pLogger.log('refresh start');
      state = [0];
    } catch (e) {
      rethrow;
    } finally {
      pLogger.log('refresh end');
    }
  }
}
