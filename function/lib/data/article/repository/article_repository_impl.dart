import 'package:function_system/data/article/request/article_request_dto.dart';
import 'package:function_system/data/article/response/article_response_dto.dart';
import 'package:function_system/data/article/service/article_service.dart';

import 'article_repository.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  final ArticleService service;

  ArticleRepositoryImpl(this.service);

  @override
  Future<List<ArticleResponseDto>> getArticleList({
    int? boardPk,
    int? accountPk,
    int? id,
    String? title,
  }) async {
    try {
      final result = await service.getArticle(
        boardId: boardPk,
        accountId: accountPk,
        title: title,
        id: id,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ArticleResponseDto> postArticle({
    required int accountPk,
    required int boardPk,
    required String title,
    required String content,
    required DateTime time,
    required bool sendPushAlarm,
  }) async {
    try {
      final result = await service.postArticle(
        sendPushAlarm,
        ArticleRequestDto(
          account: accountPk,
          board: boardPk,
          title: title,
          content: content,
          time: time,
        ),
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ArticleResponseDto> putArticle({
    required int articleId,
    required int accountPk,
    required int boardPk,
    required String title,
    required String content,
    required DateTime? time,
  }) async {
    try {
      final result = await service.putArticle(
        articleId,
        ArticleRequestDto(
          account: accountPk,
          board: boardPk,
          title: title,
          content: content,
          time: time,
        ),
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteArticle({required int id}) async {
    try {
      await service.deleteArticle(id: id);
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
