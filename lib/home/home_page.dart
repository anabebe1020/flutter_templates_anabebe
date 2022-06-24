import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/common/themes.dart';
import 'package:flutter_templates_anabebe/contents/badge/provider.dart';
import 'package:flutter_templates_anabebe/contents/bottom_modal/provider.dart';
import 'package:flutter_templates_anabebe/contents/emoji_picker/provider.dart';
import 'package:flutter_templates_anabebe/contents/page_view/provider.dart';
import 'package:flutter_templates_anabebe/contents/refresh/provider.dart';
//import 'package:flutter_templates_anabebe/contents/sample/page.dart';
//import 'package:flutter_templates_anabebe/contents/sample/provider.dart';
import 'package:flutter_templates_anabebe/settings/setting_page.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final badgeTitle = ref.watch(badgeTitleProvider);
    final pageViewTitle = ref.watch(pageViewTitleProvider);
    final refreshTitle = ref.watch(refreshTitleProvider);
    final pullRefreshTitle = ref.watch(pullRefreshTitleProvider);
    final modalTitle = ref.watch(modalTitleProvider);
    final emojiPickerTitle = ref.watch(emojiPickerTitleProvider);
    //final sampleTitle = ref.watch(sampleTitleProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contents'),
        elevation: 0,
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
          ContentsItem(title: pageViewTitle, route: '/pageView'),
          ContentsItem(title: badgeTitle, route: '/badges'),
          ContentsItem(title: refreshTitle, route: '/refresh'),
          ContentsItem(title: pullRefreshTitle, route: '/pullRefresh'),
          ContentsItem(title: modalTitle, route: '/bottomModal'),
          ContentsItem(title: emojiPickerTitle, route: '/emojiPicker'),
          //ContentsItem(title: sampleTitle, widget: const SamplePage()),
        ],
      ),
    );
  }
}

class ContentsItem extends StatelessWidget {
  final String title;
  final String route;
  const ContentsItem({Key? key, required this.title, required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12.withOpacity(0.1),
      height: 64,
      child: TextButton(
        child: Text(title, style: MyTheme.linkText),
        onPressed: () {
          GoRouter.of(context).push(route);
        },
      ),
      margin: const EdgeInsets.symmetric(vertical: 1.5),
    );
  }
}
