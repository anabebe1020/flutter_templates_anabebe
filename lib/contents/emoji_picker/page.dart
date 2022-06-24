import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/common/themes.dart';
import 'package:flutter_templates_anabebe/contents/emoji_picker/provider.dart';

class EmojiPickerPage extends ConsumerWidget {
  const EmojiPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = ref.watch(emojiPickerTitleProvider);
    final isShow = ref.watch(emojiPickerProvider);
    final emojiNotifier = ref.watch(emojiPickerProvider.notifier);
    final textNotifier = ref.watch(textFieldProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(isShow.toString()),
              ),
            ),
            keyboard(context, ref),
            Offstage(
              offstage: !isShow,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (Category category, Emoji emoji) {
                    textNotifier.onEmojiSelected(emoji);
                  },
                  onBackspacePressed: textNotifier.onBackspacePressed,
                  config: Config(
                    columns: 10,
                    emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0),
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: const EdgeInsets.all(4),
                    initCategory: Category.RECENT,
                    bgColor: MyTheme.dark.backgroundColor,
                    indicatorColor: Colors.greenAccent,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.greenAccent,
                    progressIndicatorColor: Colors.greenAccent,
                    backspaceColor: Colors.greenAccent,
                    skinToneDialogBgColor: Colors.white.withOpacity(0.5),
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    showRecentsTab: true,
                    recentsLimit: 28,
                    replaceEmojiOnLimitExceed: false,
                    noRecents: const Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget keyboard(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(textFieldProvider);
    final emojiNotifier = ref.watch(emojiPickerProvider.notifier);

    return Container(
      height: 90.0,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: IconButton(
              onPressed: () {
                FocusScope.of(context).unfocus();
                emojiNotifier.onPressToggle();
              },
              icon: const Icon(
                Icons.emoji_emotions,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: controller,
                style: const TextStyle(fontSize: 20.0, color: Colors.black87),
                decoration: InputDecoration(
                  hintText: 'Type a message',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.only(
                      left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: IconButton(
                onPressed: () {
                  // send message
                },
                icon: const Icon(
                  Icons.send,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
