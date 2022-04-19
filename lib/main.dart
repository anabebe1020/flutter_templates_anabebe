import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/refresh/provider.dart';
import 'package:flutter_templates_anabebe/home/home_page.dart';
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
    return MaterialApp(
      title: 'Anabebe Templates',
      theme: themeData,
      home: const HomePage(),
    );
  }
}
