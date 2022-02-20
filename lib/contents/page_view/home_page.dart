import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/page_view/pages.dart';
import 'package:flutter_templates_anabebe/contents/page_view/provider.dart';

class PageViewHomePage extends ConsumerWidget {
  PageViewHomePage({Key? key}) : super(key: key);

  final _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // providers
    final title = ref.watch(pageViewTitleProvider);
    final index = ref.watch(pageChangeProvider);
    final notifier = ref.watch(pageChangeProvider.notifier);
    final pagetitles = ref.watch(pageTitleProvider);
    final barItems = pagetitles
        .map((title) => BottomNavigationBarItem(
            icon: const Icon(Icons.note_outlined), label: title))
        .toList();
    final pageList =
        pagetitles.map((title) => PageWidget(title: title)).toList();
    // widgets
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              notifier.onPageChanged(index);
            },
            children: pageList,
          ),
          Container(
            alignment: Alignment.center,
            child: Row(
              children: const [
                Icon(Icons.arrow_left, size: 60),
                Icon(Icons.arrow_right, size: 60),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white70,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: barItems,
        currentIndex: index,
        onTap: (index) {
          notifier.onItemTapped(index, _pageController);
        },
      ),
    );
  }
}
