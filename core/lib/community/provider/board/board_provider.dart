import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/board/board_use_case_provider.dart';
import 'package:function_system/domain/board/board_use_case.dart';

import 'board_state.dart';

final boardProvider = StateNotifierProvider<_Viewmodel, BoardState>((ref) {
  return _Viewmodel(
    ref.read(getBoardsUseCaseProvider),
  );
});

class _Viewmodel extends StateNotifier<BoardState> {
  final GetBoardsUseCase _getBoardsUseCase;

  _Viewmodel(
    this._getBoardsUseCase,
  ) : super(BoardState.initial());

  Future fetchData() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      var result = await _getBoardsUseCase.execute();
      state = state.copyWith(isLoading: false, boards: result);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
