import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/refresh/provider.dart';

class RefreshPage extends ConsumerWidget {
  const RefreshPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(refreshTitleProvider);
    final refresh = ref.watch(refreshProvider.future);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: RefreshIndicator(
          backgroundColor: Theme.of(context).iconTheme.color,
          displacement: 150,
          onRefresh: () async {
            await refresh;
          },
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('1')),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('2')),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('3')),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('4')),
            ],
          ),
        ),
      ),
    );
  }
}
