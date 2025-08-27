import 'package:function_system/domain/account/entity/account/account.dart';

import '../../../data/account/enricher/account_enricher.dart';
import '../../../data/account/repository/account_repository.dart';

class GetAccountDetailUseCase {
  final AccountRepository repository;
  final AccountEnricher _accountEnricher;

  GetAccountDetailUseCase(this.repository, this._accountEnricher);

  Future<Account> execute(int id) async {
    try {
      final tempAccount = await repository.getAccountDetail(id);

      final result = _accountEnricher.enrich(tempAccount);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}