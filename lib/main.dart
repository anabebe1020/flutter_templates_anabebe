import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/common/themes.dart';
import 'package:flutter_templates_anabebe/home/home_page.dart';

void main() {
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anabebe Templates',
      theme: MyTheme.main,
      home: const HomePage(),
    );
  }
}
