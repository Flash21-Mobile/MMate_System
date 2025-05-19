import 'package:function_system/data/login/service/login_service.dart';

import 'login_repository.dart';
import '../../account/response/account_response_dto.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginService service;

  LoginRepositoryImpl(this.service);

  @override
  Future<AccountResponseDto> login() async {
    try {
      final result = await service.login();

      return result.first;
    } catch (e) {
      rethrow;
    }
  }
}
