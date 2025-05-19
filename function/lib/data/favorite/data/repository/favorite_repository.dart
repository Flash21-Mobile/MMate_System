import 'package:function_system/data/account/realm/account_realm_model.dart';

abstract class FavoriteRepository {
  List<AccountRealmModel> getAllFavoriteAccounts();

  bool isFavoriteAccount(int accountId);

  void saveFavoriteAccount(AccountRealmModel realm);

  void deleteFavoriteAccount(int accountId);
}
