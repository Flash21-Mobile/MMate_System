import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../account/response/account_response_dto.dart';

part 'login_service.g.dart';

@RestApi()
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @GET("/api/login")
  Future<List<AccountResponseDto>> login();
}
