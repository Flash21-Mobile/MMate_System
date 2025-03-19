import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_key.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_state.dart';

import '../../di/file/file_use_case_provider.dart';
import '../../domain/file/file_use_case.dart';
import '../exception/exceoption.dart';

final imageProvider = StateNotifierProvider.family<_Viewmodel,
    ImageBuilderState, ImageBuilderKey>(
  (ref, imageKey) {
    final viewModel = _Viewmodel(ref.watch(getUintUseCaseProvider), imageKey);
    return viewModel;
  },
);

class _Viewmodel extends StateNotifier<ImageBuilderState> {
  final GetUintUseCase _getUintUseCase;
  final ImageBuilderKey imageKey;

  _Viewmodel(this._getUintUseCase, this.imageKey)
      : super(ImageBuilderState.initial()) {
    _loadImage();
  }

  Future<void> _loadImage() async {
    print('사진 2번 ');
    if ((state.data != null || state.isEmpty == true || state.isLoading) &&
        state.isInit) {
      return;
    }

    print('사진 3번 ');
    state = state.copyWith(isLoading: true, error: null, isInit: true);

    print('사진 4번 ');
    try {
      final imageData = await _getUintUseCase.execute(
        api: imageKey.api,
        id: imageKey.id,
        isFirst: imageKey.isLast,
      );

      print('사진 5번 ');
      state = state.copyWith(
          data: imageData.data,
          isLoading: false);
    } catch (e) {
      if (e == MMateException.noFilesFound) {
        state = state.copyWith(data: null, isEmpty: true, isLoading: false);
        return;
      }
      state = state.copyWith(error: e.toString());
      print('사진 에러 ${e}');
    }
  }

  void clearImage() {
    state = ImageBuilderState.initial();
  }
}
