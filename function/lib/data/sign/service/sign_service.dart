import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request/sign_request_dto.dart';
import '../response/sign_response_dto.dart';

part 'sign_service.g.dart';

@RestApi()
abstract class SignService {
  factory SignService(Dio dio, {String baseUrl}) = _SignService;

  @POST("/signin")
  Future<SignResponseDto> signIn(
      @Body() SignRequestDto data
      );
}