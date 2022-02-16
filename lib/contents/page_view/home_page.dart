import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/page_view/pages.dart';
import 'package:flutter_templates_anabebe/contents/page_view/provider.dart';

class PageViewHomePage extends ConsumerWidget {
  PageViewHomePage({Key? key}) : super(key: key);

  final _pageController = PageController();
  static final List<Widget> _pageList = [
    const APage(),
    const BPage(),
    const CPage(),
    const DPage(),
    const EPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // providers
    final title = ref.watch(pageViewTitleProvider);
    final pageChange = ref.watch(pageChangeProvider);
    final titleA = ref.watch(pageATitleProvider);
    final titleB = ref.watch(pageBTitleProvider);
    final titleC = ref.watch(pageCTitleProvider);
    final titleD = ref.watch(pageDTitleProvider);
    final titleE = ref.watch(pageETitleProvider);
    // widgets
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              pageChange.onPageChanged(index);
            },
            children: _pageList,
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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.note_outlined), label: titleA),
          BottomNavigationBarItem(
              icon: const Icon(Icons.note_outlined), label: titleB),
          BottomNavigationBarItem(
              icon: const Icon(Icons.note_outlined), label: titleC),
          BottomNavigationBarItem(
              icon: const Icon(Icons.note_outlined), label: titleD),
          BottomNavigationBarItem(
              icon: const Icon(Icons.note_outlined), label: titleE),
        ],
        currentIndex: pageChange.currentIndex,
        onTap: (index) {
          pageChange.onItemTapped(index, _pageController);
        },
      ),
    );
  }
}
