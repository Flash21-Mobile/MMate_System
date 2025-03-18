import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/article/article_use_case_provider.dart';
import 'package:function_system/domain/aricle/article_use_case.dart';

import 'article_state.dart';

final articleProvider =
    StateNotifierProvider.family<_Viewmodel, ArticleState, int>((ref, boardId) {
  return _Viewmodel(
    boardId,
    ref.read(getArticlesUseCaseProvider),
    ref.read(deleteArticleUseCaseProvider),
  );
});

class _Viewmodel extends StateNotifier<ArticleState> {
  final int boardId;
  final GetArticlesUseCase _getArticlesUseCase;
  final DeleteArticleUseCase _deleteArticleUseCase;

  _Viewmodel(
    this.boardId,
    this._getArticlesUseCase,
    this._deleteArticleUseCase,
  ) : super(ArticleState.initial()) {
    fetchData();
  }

  Future fetchData() async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      var result = await _getArticlesUseCase.execute(boardPk: boardId);
      state = state.copyWith(isLoading: false, articles: result);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future delete(int id) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await _deleteArticleUseCase.execute(id: id);
      final resultData = state.articles;
      resultData?.removeWhere((e) => e.id == id);

      state = state.copyWith(isLoading: false, articles: resultData);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
