import 'package:function_system/domain/article/entity/article/article.dart';

import '../../../data/article/enricher/article_enricher.dart';
import '../../../data/article/repository/article_repository.dart';
import '../../../data/file/repository/file_repository.dart';
import '../../../key/constants_key.dart';
import '../../uint_file/entity/uint_file.dart';

class PutArticleUseCase {
  final ArticleRepository _repository;
  final ArticleEnricher _articleEnricher;
  final FileRepository _fileRepository;

  PutArticleUseCase(
      this._repository, this._articleEnricher, this._fileRepository);

  Future<Article> execute({
    required Article entity,
    required List<UintFile> images,
  }) async {
    try {
      final result = await _repository.putArticle(
        articleId: entity.id,
        accountPk: entity.account.id,
        boardPk: entity.board.id,
        title: entity.title,
        content: entity.content,
        time: entity.time,
      );

      // 프로필 사진 전부 삭제
      await _fileRepository.delete(
        ConstantsKey.articleImagesAPI,
        entity.id,
      );

      // 프로필 사진 멀티파트로 변환
      final multipartImage = images.map((e) {
        return e.toMultipart();
      }).toList();

      // 이미지 삽입
      if (images.isNotEmpty) {
        await _fileRepository.post(
          ConstantsKey.articleImagesAPI,
          entity.id,
          multipartImage,
        );
      }

      return _articleEnricher.enrich(result);
    } catch (e) {
      rethrow;
    }
  }
}