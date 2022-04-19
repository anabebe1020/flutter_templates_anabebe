import 'package:anabebe_packages/anabebe_packages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/refresh/provider.dart';

class PullRefreshPage extends ConsumerWidget {
  const PullRefreshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(pullRefreshTitleProvider);
    final state = ref.watch(pullRefreshProvider);
    final notifier = ref.watch(pullRefreshProvider.notifier);
    //
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: PullRefreshScrollView(
          scrollController: ScrollController(),
          onRefresh: () async => notifier.refresh(),
          child: ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              return _listItem(context, state[index]);
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
