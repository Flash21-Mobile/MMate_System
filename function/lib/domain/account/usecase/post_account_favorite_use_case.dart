import '../../../data/account/realm/account_realm_model.dart';
import '../../../data/favorite/data/repository/favorite_repository.dart';

class PostAccountFavoriteUseCase {
  final FavoriteRepository repository;

  PostAccountFavoriteUseCase(this.repository);

  void execute(int id) async {
    try {
      return repository.saveFavoriteAccount(AccountRealmModel(id));
    } catch (e) {
      rethrow;
    }
  }
}