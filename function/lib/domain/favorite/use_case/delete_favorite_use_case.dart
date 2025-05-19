import 'package:function_system/data/account/realm/account_realm_model.dart';
import 'package:function_system/data/favorite/data/repository/favorite_repository.dart';

class DeleteFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;

  const DeleteFavoriteUseCase(this._favoriteRepository);

  void execute(int accountId){
    return _favoriteRepository.deleteFavoriteAccount(accountId);
  }
}