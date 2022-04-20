import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/common/router.dart';
import 'package:flutter_templates_anabebe/contents/refresh/provider.dart';
import 'package:flutter_templates_anabebe/settings/provider.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = ref.watch(darkModeProvider);
    ref.watch(pullRefreshProvider.notifier).init();
    return MaterialApp.router(
      title: 'Anabebe Templates',
      theme: themeData,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
    );
  }
}
