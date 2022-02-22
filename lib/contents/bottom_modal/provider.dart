import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_templates_anabebe/contents/bottom_modal/model.dart';

final modalTitleProvider = StateProvider((ref) => 'showModalBottomSheet');

final descriptionProvider =
    StateProvider((ref) => 'Short Press: Displays a half modal.\n\n'
        'Long Press: Displays a full modal.');

final modalProvider = StateNotifierProvider<_ModalNotifier, ModalModel>(
  (ref) => _ModalNotifier(),
);

class _ModalNotifier extends StateNotifier<ModalModel> {
  _ModalNotifier()
      : super(ModalModel(isFullScreen: false, modalTitle: '', modalText: ''));

  Future<void> onPress() async {
    state = ModalModel(
        isFullScreen: false,
        modalTitle: 'Half Modal',
        modalText: 'If the button is pressed normally,'
            'a modal with half the height will be displayed.');
  }

  Future<void> onLongPress() async {
    state = ModalModel(
        isFullScreen: true,
        modalTitle: 'Full Modal',
        modalText: 'If you press and hold the button,'
            'the modal with full height will be displayed.');
  }
}
