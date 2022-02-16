import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/page_view/provider.dart';

class APage extends ConsumerWidget {
  const APage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(pageATitleProvider);
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
      padding: const EdgeInsets.all(20),
    );
  }
}

class BPage extends ConsumerWidget {
  const BPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(pageBTitleProvider);
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
      padding: const EdgeInsets.all(20),
    );
  }
}

class CPage extends ConsumerWidget {
  const CPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(pageCTitleProvider);
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
      padding: const EdgeInsets.all(20),
    );
  }
}

class DPage extends ConsumerWidget {
  const DPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(pageDTitleProvider);
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
      padding: const EdgeInsets.all(20),
    );
  }
}

class EPage extends ConsumerWidget {
  const EPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(pageETitleProvider);
    return Container(
      alignment: Alignment.center,
      child: Text(title, style: Theme.of(context).textTheme.bodyText1),
      padding: const EdgeInsets.all(20),
    );
  }
}
