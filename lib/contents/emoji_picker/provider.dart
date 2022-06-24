import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emojiPickerTitleProvider = StateProvider((ref) => 'EmojiPicker');

final emojiPickerProvider = StateNotifierProvider<_EmojiPickerNotifier, bool>(
  (ref) => _EmojiPickerNotifier(),
);

final textFieldProvider =
    StateNotifierProvider<_TextFieldNotifier, TextEditingController>(
  (ref) => _TextFieldNotifier(),
);

class _EmojiPickerNotifier extends StateNotifier<bool> {
  _EmojiPickerNotifier() : super(false);

  void onPressPlus() {
    state = true;
  }

  void onPressMinus() {
    state = false;
  }

  void onPressToggle() {
    state = !state;
  }
}

class _TextFieldNotifier extends StateNotifier<TextEditingController> {
  _TextFieldNotifier() : super(TextEditingController());

  void onEmojiSelected(Emoji emoji) {
    state
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: state.text.length),
      );
  }

  void onBackspacePressed() {
    state
      ..text = state.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: state.text.length),
      );
  }
}
