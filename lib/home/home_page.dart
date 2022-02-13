import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contents'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/SettingPage');
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(),
    );
  }
}
