import '../request/account_request_dto.dart';
import '../response/account_response_dto.dart';

abstract class AccountRepository {
  // 유저 관리
  Future<List<AccountResponseDto>> getAccountList({
    int? id,
    int? size = 10000,
    String? cellphone,
  });

  Future<AccountResponseDto> getAccountDetail(int id);

  Future<AccountResponseDto> putAccount(int id, AccountRequestDto dto);

  Future postAccount(AccountRequestDto dto);
}
