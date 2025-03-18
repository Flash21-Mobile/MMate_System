import '../request/account_request_dto.dart';
import '../response/account_response_dto.dart';
import '../../../domain/account/account_entity.dart';

abstract class AccountRepository {
  // 유저 관리
  Future<List<AccountResponseDto>> getAccountList({
    int? id,
    int? size,
    String? cellphone,
  });

  Future<AccountResponseDto> putAccount(int id,AccountRequestDto dto);

  // 즐겨찾기
  Future<List<int>> getAccountFavorites();

  Future postAccountFavorite(int id);

  Future deleteAccountFavorite(int id);
}
