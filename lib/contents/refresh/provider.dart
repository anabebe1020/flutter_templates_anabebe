import 'package:flutter_riverpod/flutter_riverpod.dart';

final refreshTitleProvider = StateProvider((ref) => 'RefreshIndicator');

final refreshProvider = FutureProvider<void>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
});
