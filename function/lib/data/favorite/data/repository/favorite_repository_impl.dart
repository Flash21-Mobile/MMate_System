import 'package:function_system/data/account/realm/account_realm_model.dart';
import 'package:function_system/data/favorite/data/service/favorite_service.dart';

import 'favorite_repository.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteService _service;

  FavoriteRepositoryImpl(this._service);

  @override
  List<AccountRealmModel> getAllFavoriteAccounts() {
    return _service.getAllFavoriteAccounts();
  }

  @override
  bool isFavoriteAccount(int accountId) {
    return _service.isFavoriteAccount(accountId);
  }

  @override
  void saveFavoriteAccount(AccountRealmModel realm) {
    _service.saveFavoriteAccount(realm);
  }

  @override
  void deleteFavoriteAccount(int accountId) {
    _service.deleteFavoriteAccount(accountId);
  }
}
