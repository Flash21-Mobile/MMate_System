import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/uint_file/use_case/uint_file_use_case_provider.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_key.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_keys_provider.dart';
import 'package:function_system/utilities/imagebuilder/image_builder_state.dart';

import '../../domain/uint_file/use_case/get_uint_file_by_last_use_case.dart';
import '../exception/exception.dart';

final imageBuilderProvider = StateNotifierProvider.family<_Viewmodel, ImageBuilderState, ImageBuilderKey>(
  (ref, imageKey) {
    final getUintUseCase = ref.read(getUintFileByLastUseCaseProvider);

    return _Viewmodel(ref, imageKey, getUintUseCase);
  },
);

class _Viewmodel extends StateNotifier<ImageBuilderState> {
  final Ref _ref;
  final GetUintFileByLastUseCase _getUintFileByLastUseCase;
  final ImageBuilderKey imageKey;

  _Viewmodel(this._ref, this.imageKey, this._getUintFileByLastUseCase)
      : super(ImageBuilderState.initial()) {
    Future.microtask(() {
      _ref
          .read(imageBuilderKeysProvider.notifier)
          .update((state) => {...state, imageKey});
    });
    _loadImage();
  }

  Future<void> _loadImage() async {
    if ((state.data != null || state.isEmpty == true || state.isLoading) &&
        state.isInit) {
      return;
    }

    state = state.copyWith(isLoading: true, error: null, isInit: true);

    try {
      final imageData = await _getUintFileByLastUseCase.execute(
        api: imageKey.api,
        id: imageKey.id,
        isFirst: imageKey.isLast,
      );

      state = state.copyWith(data: imageData.data, isLoading: false);
    } catch (e) {
      if (e == MMateException.noFilesFound) {
        state = state.copyWith(data: null, isEmpty: true, isLoading: false);
        return;
      }
      state = state.copyWith(error: e.toString());
    }
  }

  void clearImage() {
    state = ImageBuilderState.initial();
  }
}
