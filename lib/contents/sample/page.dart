import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/sample/provider.dart';

class SamplePage extends ConsumerWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(sampleTitleProvider);
    final count = ref.watch(sampleProvider);
    final notifier = ref.watch(sampleProvider.notifier);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.center,
        child: Text(count.toString()),
      ),
      persistentFooterButtons: [
        FloatingActionButton(
            heroTag: 'clear',
            child: const Icon(Icons.clear),
            onPressed: () => notifier.onPressClear()),
        FloatingActionButton(
            heroTag: 'plus',
            child: const Icon(Icons.add),
            onPressed: () => notifier.onPressPlus()),
        FloatingActionButton(
            heroTag: 'minus',
            child: const Icon(Icons.remove),
            onPressed: () => notifier.onPressMinus()),
      ],
    );
  }
}
