import 'package:function_system/data/article/response/article_response_dto.dart';

import '../../../domain/aricle/article_entity.dart';

abstract class ArticleRepository {
  Future<List<ArticleResponseDto>> getArticleList({
    int? boardPk,
    int? id,
  });

  Future<ArticleResponseDto> postArticle({
    required int accountPk,
    required int boardPk,
    required String title,
    required String content,
    required String time,
    required bool sendPushAlarm,
  });

  Future<ArticleResponseDto> putArticle({
    required int articleId,
    required int accountPk,
    required int boardPk,
    required String title,
    required String content,
    required String time,
  });

  Future deleteArticle({
    required int id,
  });
}
