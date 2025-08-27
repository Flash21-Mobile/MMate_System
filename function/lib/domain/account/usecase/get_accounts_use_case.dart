import 'package:function_system/domain/account/entity/account/account.dart';

import '../../../data/account/enricher/account_enricher.dart';
import '../../../data/account/repository/account_repository.dart';

class GetAccountsUseCase {
  final AccountRepository repository;
  final AccountEnricher _accountEnricher;

  GetAccountsUseCase(this.repository, this._accountEnricher);

  Future<List<Account>> execute() async {
    try {
      final resultAccountList = await repository.getAccountList(size: 10000);

      final tempAccountEntityList = resultAccountList.map((e) {
        return _accountEnricher.enrich(e);
      });

      List<Account> favoriteAccountList =
      tempAccountEntityList.where((user) => user.isFavorite).toList();

      List<Account> regularAccountList =
      tempAccountEntityList.where((user) => !user.isFavorite).toList();

      final result = favoriteAccountList + regularAccountList;

      return result;
    } catch (e) {
      rethrow;
    }
  }
}