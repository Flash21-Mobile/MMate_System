import 'package:function_system/data/account/realm/account_realm_model.dart';
import 'package:function_system/data/favorite/data/service/favorite_service.dart';

class FavoriteRepository {
  final FavoriteService _service;

  FavoriteRepository(this._service);

  List<AccountRealmModel> getAllFavoriteAccounts() {
    return _service.getAllFavoriteAccounts();
  }

  bool isFavoriteAccount(int accountId) {
    return _service.isFavoriteAccount(accountId);
  }

  void saveFavoriteAccount(AccountRealmModel realm) {
    _service.saveFavoriteAccount(realm);
  }

  void deleteFavoriteAccount(int accountId) {
    _service.deleteFavoriteAccount(accountId);
  }
}
