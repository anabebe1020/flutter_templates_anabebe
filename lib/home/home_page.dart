import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/badge/page.dart';
import 'package:flutter_templates_anabebe/common/themes.dart';
import 'package:flutter_templates_anabebe/page_view/home_page.dart';
import 'package:flutter_templates_anabebe/page_view/provider.dart';
import 'package:flutter_templates_anabebe/settings/setting_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageViewTitle = ref.watch(pageViewTitleProvider);
    final badgeTitle = ref.watch(badgeTitleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contents'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const SettingPage();
                },
              ));
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: ListView(
        children: [
          ContentsItem(title: pageViewTitle, widget: PageViewHomePage()),
          ContentsItem(title: badgeTitle, widget: const BadgePage()),
        ],
      ),
    );
  }
}

class ContentsItem extends StatelessWidget {
  final String title;
  final Widget widget;
  const ContentsItem({Key? key, required this.title, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12.withOpacity(0.1),
      height: 64,
      child: TextButton(
        child: Text(title, style: MyTheme.linkText),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return widget;
            },
          ));
        },
      ),
      margin: const EdgeInsets.symmetric(vertical: 1.5),
    );
  }
}
