import 'package:function_system/data/account/request/account_request_dto.dart';
import 'package:function_system/data/account/response/account_response_dto.dart';
import 'package:function_system/data/account/service/account_service.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/account/base/base_account_entity.dart';
import 'account_repository.dart';
import '../../../key/shared_preference_key.dart';

class AccountRepositoryImpl extends AccountRepository {
  final AccountService service;

  AccountRepositoryImpl(this.service);

  @override
  Future<List<AccountResponseDto>> getAccountList(
      {int? id, int? size, String? cellphone}) async {
    try {
      final result = await service.getAccounts(id: id, size: size, cellphone: cellphone);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AccountResponseDto> getAccountDetail(int id) async {
    try {
      final result = await service.getAccounts(id: id, size: 1);
      if (result.isEmpty) {
        throw MMateException.noData;
      }
      return result.last;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AccountResponseDto> putAccount(int id, AccountRequestDto dto) async {
    try {
      final result = await service.putAccount(id: id, dto: dto);

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postAccount(AccountRequestDto dto) async {
    try {
      final result = await service.postAccount(dto: dto);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
