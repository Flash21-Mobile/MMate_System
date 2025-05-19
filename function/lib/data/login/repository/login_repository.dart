import '../../account/response/account_response_dto.dart';

abstract class LoginRepository {
  Future<AccountResponseDto> login();
}
