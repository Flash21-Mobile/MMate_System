import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/domain/aricle/entity/article_entity.dart';
import 'package:function_system/data/article/repository/article_repository.dart';
import 'package:function_system/domain/uri/uri_entity.dart';
import 'package:function_system/key/constants_key.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:function_system/utilities/format/date_time_format.dart';

class GetArticlesUseCase {
  final ArticleRepository _repository;

  GetArticlesUseCase(this._repository);

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
      return result.map((e) => e.toEntity).toList();
    } catch (e) {
      rethrow;
    }
  }
}

class GetArticleDetailUseCase {
  final ArticleRepository _repository;

  GetArticleDetailUseCase(this._repository);

  Future<ArticleEntity> execute({
    required int id,
  }) async {
    try {
      final result = await _repository.getArticleList(id: id);
      return result.first.toEntity;
    } catch (e) {
      rethrow;
    }
  }
}

class PostArticleUseCase {
  final ArticleRepository _repository;
  final FileRepository _fileRepository;

  PostArticleUseCase(
    this._repository,
    this._fileRepository,
  );

  Future<ArticleEntity> execute({
    required int accountPk,
    required int boardPk,
    required String title,
    required String content,
    required DateTime time,
    bool sendPushAlarm = false,
    List<UriEntity> images = const [],
  }) async {
    try {
      final result = await _repository.postArticle(
        accountPk: accountPk,
        boardPk: boardPk,
        title: title,
        content: content,
        time: time.toIso8601(),
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

      return result.toEntity;
    } catch (e) {
      rethrow;
    }
  }
}

class PutArticleUseCase {
  final ArticleRepository _repository;

  PutArticleUseCase(this._repository);

  Future<ArticleEntity> execute({
    required ArticleEntity data,
  }) async {
    try {
      final result = await _repository.putArticle(
        articleId: data.id,
        accountPk: data.account.id,
        boardPk: data.board.id,
        title: data.title,
        content: data.content,
        time: data.time.toIso8601(),
      );
      return result.toEntity;
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
