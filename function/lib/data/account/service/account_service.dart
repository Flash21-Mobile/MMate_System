import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../request/account_request_dto.dart';
import '../response/account_response_dto.dart';

part 'account_service.g.dart';

@RestApi()
abstract class AccountService {
  factory AccountService(Dio dio, {String baseUrl}) = _AccountService;

  @GET('/api/account')
  Future<List<AccountResponseDto>> getAccounts({
    @Query('id') int? id,
    @Query('size') int? size,
    @Query('cellphone') String? cellphone,
  });

  @PUT('/api/account/{id}')
  Future<AccountResponseDto> putAccount({
    @Path('id') int? id,
    @Body() AccountRequestDto? dto,
  });
}
