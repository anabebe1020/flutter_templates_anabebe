import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/sample/provider.dart';

class SamplePage extends ConsumerWidget {
  const SamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(sampleTitleProvider);
    final sampleProv = ref.watch(sampleProvider);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.center,
        child: Text(sampleProv.count.toString()),
      ),
      persistentFooterButtons: [
        FloatingActionButton(
            heroTag: 'clear',
            child: const Icon(Icons.clear),
            onPressed: () => sampleProv.onPressClear()),
        FloatingActionButton(
            heroTag: 'plus',
            child: const Icon(Icons.add),
            onPressed: () => sampleProv.onPressPlus()),
        FloatingActionButton(
            heroTag: 'minus',
            child: const Icon(Icons.remove),
            onPressed: () => sampleProv.onPressMinus()),
      ],
    );
  }
}
