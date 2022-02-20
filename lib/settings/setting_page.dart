import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/settings/provider.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _darkMode(context, ref),
        ],
      ),
    );
  }

  Widget _darkMode(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(darkModeProvider.notifier);
    return Container(
      height: 64,
      child: ListTile(
        leading: const Icon(Icons.brightness_2_outlined, size: 24),
        title: Text('DarkMode', style: Theme.of(context).textTheme.bodyText2),
        trailing: Switch(
          value: notifier.isDark,
          activeColor: Colors.lightBlue,
          activeTrackColor: Colors.grey,
          inactiveThumbColor: Colors.blueGrey,
          inactiveTrackColor: Colors.grey,
          onChanged: (bool bl) {
            notifier.onModeChanged(bl);
          },
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 1.5),
    );
  }
}
