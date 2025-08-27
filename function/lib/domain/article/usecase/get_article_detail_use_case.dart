import 'package:function_system/domain/article/entity/article/article.dart';

import '../../../data/article/enricher/article_enricher.dart';
import '../../../data/article/repository/article_repository.dart';

class GetArticleDetailUseCase {
  final ArticleRepository _repository;
  final ArticleEnricher _articleEnricher;

  GetArticleDetailUseCase(
      this._repository,
      this._articleEnricher,
      );

  Future<Article> execute({
    required int id,
  }) async {
    try {
      final articlesResult = await _repository.getArticleList(id: id);
      final result = articlesResult.last;

      return _articleEnricher.enrich(result);
    } catch (e) {
      rethrow;
    }
  }
}