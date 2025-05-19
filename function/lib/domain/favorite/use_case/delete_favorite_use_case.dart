import 'package:function_system/data/account/realm/account_realm_model.dart';
import 'package:function_system/data/favorite/data/repository/favorite_repository.dart';

class SetFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;

  const SetFavoriteUseCase(this._favoriteRepository);

  void call(int accountId){
    return _favoriteRepository.saveFavoriteAccount(AccountRealmModel(accountId));
  }
}