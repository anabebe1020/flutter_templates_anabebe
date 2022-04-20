import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/refresh/provider.dart';

class RefreshPage extends ConsumerWidget {
  const RefreshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(refreshTitleProvider);
    final state = ref.watch(pullRefreshProvider);
    final notifier = ref.read(pullRefreshProvider.notifier);
    //
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).iconTheme.color,
          displacement: 150,
          onRefresh: () async => notifier.refresh(),
          child: ListView.builder(
            itemCount: state + 1,
            itemBuilder: (context, index) {
              return _listItem(context, index);
            },
            shrinkWrap: true,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => notifier.add(),
      ),
    );
  }

  Widget _listItem(BuildContext context, int index) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(index.toString()),
    );
  }
}
