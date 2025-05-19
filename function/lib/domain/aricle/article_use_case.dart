import 'package:function_system/data/article/enricher/article_enricher.dart';
import 'package:function_system/data/article/repository/article_repository.dart';
import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/domain/uri/uri_entity.dart';
import 'package:function_system/key/constants_key.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:function_system/utilities/format/date_time_format.dart';

import '../account/entity/account/account_entity.dart';
import 'entity/article/article_entity.dart';

class GetArticlesUseCase {
  final ArticleRepository _repository;
  final ArticleEnricher _articleEnricher;

  GetArticlesUseCase(this._repository, this._articleEnricher);

  Future<List<ArticleEntity>> execute({
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

class GetArticleDetailUseCase {
  final ArticleRepository _repository;
  final ArticleEnricher _articleEnricher;

  GetArticleDetailUseCase(
    this._repository,
    this._articleEnricher,
  );

  Future<ArticleEntity> execute({
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

class PostArticleUseCase {
  final ArticleRepository _repository;
  final ArticleEnricher _articleEnricher;
  final FileRepository _fileRepository;

  PostArticleUseCase(
    this._repository,
    this._articleEnricher,
    this._fileRepository,
  );

  Future<ArticleEntity> execute({
    required AccountEntity account,
    required int boardPk,
    required String title,
    required String content,
    required DateTime time,
    bool sendPushAlarm = false,
    List<UriEntity> images = const [],
  }) async {
    try {
      final result = await _repository.postArticle(
        accountPk: account.id,
        boardPk: boardPk,
        title: title,
        content: content,
        time: time.toServerIso8601(),
        sendPushAlarm: sendPushAlarm,
      );
      if (result.id == null) throw MMateException.failedSend;

      if (images.isNotEmpty) {
        final fileResult = await _fileRepository.postFile(
            ConstantsKey.articleImagesAPI,
            result.id!,
            images.map((e) => e.toMultipart()).toList());

        if (fileResult.first.id == null) throw MMateException.failedSend;
      }

      return _articleEnricher.enrich(result);
    } catch (e) {
      rethrow;
    }
  }
}

class PutArticleUseCase {
  final ArticleRepository _repository;
  final ArticleEnricher _articleEnricher;
  final FileRepository _fileRepository;

  PutArticleUseCase(
      this._repository, this._articleEnricher, this._fileRepository);

  Future<ArticleEntity> execute({
    required ArticleEntity entity,
    required List<UriEntity> images,
  }) async {
    try {
      final result = await _repository.putArticle(
        articleId: entity.id,
        accountPk: entity.account.id,
        boardPk: entity.board.id,
        title: entity.title,
        content: entity.content,
        time: entity.time.toServerIso8601(),
      );

      // 프로필 사진 전부 삭제
      await _fileRepository.deleteFiles(
        ConstantsKey.articleImagesAPI,
        entity.id,
      );

      // 프로필 사진 멀티파트로 변환
      final multipartImage = images.map((e) {
        return e.toMultipart();
      }).toList();

      // 이미지 삽입
      if (images.isNotEmpty) {
        await _fileRepository.postFile(
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
