import 'package:function_system/domain/article/entity/article/article.dart';

import '../../../data/article/enricher/article_enricher.dart';
import '../../../data/article/repository/article_repository.dart';

class GetArticlesUseCase {
  final ArticleRepository _repository;
  final ArticleEnricher _articleEnricher;

  GetArticlesUseCase(this._repository, this._articleEnricher);

  Future<List<Article>> execute({
    int? boardPk,
    int? accountPk,
    String? title,
  }) async {
    try {
      final result = await _repository.getArticleList(
        boardPk: boardPk,
        accountPk: accountPk,
        title: title,
      );

      return result.map((e) {
        return _articleEnricher.enrich(e);
      }).toList();
    } catch (e) {
      rethrow;
    }
  }
}