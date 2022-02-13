import 'package:flutter/material.dart';
import 'package:flutter_templates_anabebe/home/home_page.dart';
import 'package:flutter_templates_anabebe/settings/setting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anabebe Templates',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/SettingPage': (_) => const SettingPage(),
      },
    );
  }
}
