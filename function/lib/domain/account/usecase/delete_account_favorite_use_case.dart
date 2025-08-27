import '../../../data/favorite/data/repository/favorite_repository.dart';

class DeleteAccountFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;

  DeleteAccountFavoriteUseCase(this._favoriteRepository);

  void execute(int id) async {
    try {
      return _favoriteRepository.deleteFavoriteAccount(id);
    } catch (e) {
      rethrow;
    }
  }
}