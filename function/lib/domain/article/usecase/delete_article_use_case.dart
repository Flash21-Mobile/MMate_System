import 'package:function_system/data/article/repository/article_repository.dart';

class DeleteArticleUseCase {
  final ArticleRepository _repository;

  DeleteArticleUseCase(this._repository);

  Future execute({required int id}) async {
    try {
      await _repository.deleteArticle(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
