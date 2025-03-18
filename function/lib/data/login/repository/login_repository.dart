import '../../account/response/account_response_dto.dart';
import '../../../domain/account/account_entity.dart';

abstract class LoginRepository {
  Future<AccountResponseDto> login();
}
