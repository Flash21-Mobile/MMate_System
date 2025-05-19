import 'package:function_system/data/account/realm/account_realm_model.dart';
import 'package:realm/realm.dart';

class FavoriteService {
  final Realm realm;

  FavoriteService(this.realm);

  List<AccountRealmModel> getAllFavoriteAccounts() {
    final realmFavoriteAccounts = realm.all<AccountRealmModel>();
    return realmFavoriteAccounts.toList();
  }

  bool isFavoriteAccount(int accountId) {
    final result =
        realm.query<AccountRealmModel>('accountId == $accountId').isNotEmpty;
    return result;
  }

  void saveFavoriteAccount(AccountRealmModel account) {
    realm.write(() {
      realm.add<AccountRealmModel>(account, update: true);
    });
  }

  void deleteFavoriteAccount(int accountId) {
    final account = realm
        .all<AccountRealmModel>()
        .cast<AccountRealmModel?>()
        .firstWhere((element) => element?.accountId == accountId,
            orElse: () => null);

    if (account != null) {
      realm.write(() {
        realm.delete(account);
      });
    }
  }
}
