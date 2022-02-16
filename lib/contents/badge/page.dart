import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/badge/provider.dart';

class BadgePage extends ConsumerWidget {
  const BadgePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(badgeTitleProvider);
    final badgeProv = ref.watch(badgeProvider);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(10, 10, 70, 120),
        child: Badge(
          position: BadgePosition.topEnd(top: 10, end: -60),
          padding: const EdgeInsets.all(8),
          badgeContent: Text(badgeProv.count.toString()),
          child: IconButton(
            icon: const Icon(Icons.mail, size: 100),
            onPressed: () {},
          ),
        ),
      ),
      persistentFooterButtons: [
        FloatingActionButton(
          heroTag: 'plus',
          child: Icon(Icons.add, color: Theme.of(context).primaryColor),
          onPressed: () {
            badgeProv.onPressPlus();
          },
        ),
        FloatingActionButton(
          heroTag: 'minus',
          child: Icon(Icons.remove, color: Theme.of(context).primaryColor),
          onPressed: () {
            badgeProv.onPressMinus();
          },
        ),
      ],
    );
  }
}
