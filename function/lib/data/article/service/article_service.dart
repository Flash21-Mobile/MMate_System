import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request/article_request_dto.dart';
import '../response/article_response_dto.dart';

part 'article_service.g.dart';

@RestApi()
abstract class ArticleService {
  factory ArticleService(Dio dio, {String baseUrl}) = _ArticleService;

  @GET("/api/article")
  Future<List<ArticleResponseDto>> getArticle({
    @Query('board') int? boardId,
    @Query('account') int? accountId,
    @Query('id') int? id,
    @Query('title') String? title,
  });

  @POST("/api/article")
  Future<ArticleResponseDto> postArticle(
    @Query('sendPushAlarm') bool? sendPushAlarm,
    @Body() ArticleRequestDto? data,
  );

  @PUT("/api/article/{id}")
  Future<ArticleResponseDto> putArticle(
    @Path('id') int? id,
    @Body() ArticleRequestDto data,
  );

  @DELETE("/api/article/{id}")
  Future deleteArticle({@Path('id') int? id});
}
