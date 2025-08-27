import 'package:function_system/data/login/repository/login_repository.dart';

import '../../../data/account/enricher/account_enricher.dart';
import '../../account/entity/account/account.dart';

class LoginUseCase {
  final LoginRepository repository;
  final AccountEnricher _accountEnricher;

  LoginUseCase(this.repository, this._accountEnricher);

  Future<Account> execute() async {
    try {
      final result = await repository.login();
      if (result.id == null) {
        throw 'Cannot Found User';
      }

      return _accountEnricher.enrich(result);
    } catch (e) {
      rethrow;
    }
  }
}
