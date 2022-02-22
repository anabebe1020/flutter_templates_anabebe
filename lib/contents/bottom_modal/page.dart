import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/bottom_modal/provider.dart';

class BottomModalPage extends ConsumerWidget {
  const BottomModalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(modalTitleProvider);
    final description = ref.watch(descriptionProvider);
    final notifier = ref.watch(modalProvider.notifier);
    // description
    final descriptionArea = Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Text(description, style: Theme.of(context).textTheme.bodyText2),
    );
    // Button
    final button = Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: SizedBox(
        height: 60,
        width: 180,
        child: ElevatedButton(
          child: Text('Modal', style: Theme.of(context).textTheme.bodyText2),
          onPressed: () async {
            await notifier.onPress();
            await _showBottomModal(context, ref);
          },
          onLongPress: () async {
            await notifier.onLongPress();
            await _showBottomModal(context, ref);
          },
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shadowColor: Colors.white,
            primary: Colors.blueGrey,
            onPrimary: Colors.white,
          ),
        ),
      ),
    );
    // Body
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            descriptionArea,
            button,
          ],
        ),
      ),
    );
  }

  Future<void> _showBottomModal(BuildContext context, WidgetRef ref) async {
    final state = ref.watch(modalProvider);
    await showModalBottomSheet(
      context: context,
      isScrollControlled: state.isFullScreen,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 100,
              padding: const EdgeInsets.only(top: 30),
              child: Text(state.modalTitle,
                  style: Theme.of(context).textTheme.headline2),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Text(state.modalText),
            ),
          ],
        );
      },
    );
  }
}
