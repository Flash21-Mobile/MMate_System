import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../article/response/article_response_dto.dart';
import '../request/fcm_request_dto.dart';

part 'fcm_service.g.dart';

@RestApi()
abstract class FcmService {
  factory FcmService(Dio dio, {String baseUrl}) = _FcmService;

  @PUT("/api/fcm")
  Future<FcmRequestDto> putFcm({
    @Body() FcmRequestDto? dto,
  });

  @GET("/api/fcm")
  Future<FcmRequestDto> getFcm();
}
