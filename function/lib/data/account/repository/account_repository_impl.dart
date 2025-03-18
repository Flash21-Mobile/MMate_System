import 'package:function_system/data/account/request/account_request_dto.dart';
import 'package:function_system/data/account/response/account_response_dto.dart';
import 'package:function_system/data/account/service/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/account/account_entity.dart';
import 'account_repository.dart';
import '../../../key/shared_preference_key.dart';

class AccountRepositoryImpl extends AccountRepository {
  final AccountService service;

  AccountRepositoryImpl(this.service);

  @override
  Future<List<AccountResponseDto>> getAccountList(
      {int? id, int? size, String? cellphone}) async {
    try {
      final result =
          await service.getAccounts(id: id, size: size, cellphone: cellphone);
      return result;
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
  Future<List<int>> getAccountFavorites() async {
    final preferences = await SharedPreferences.getInstance();
    try {
      return (preferences.getStringList(PrefKey.accountFavorite) ?? [])
          .map((value) => int.parse(value))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future postAccountFavorite(int id) async {
    final preferences = await SharedPreferences.getInstance();
    try {
      var temp = preferences.getStringList(PrefKey.accountFavorite) ?? [];
      if (!temp.contains(id.toString())) {
        temp.add(id.toString());
        preferences.setStringList(PrefKey.accountFavorite, temp);
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteAccountFavorite(int id) async {
    final preferences = await SharedPreferences.getInstance();
    try {
      var temp = preferences.getStringList(PrefKey.accountFavorite) ?? [];
      if (temp.contains(id.toString())) {
        temp.remove(id.toString());
        preferences.setStringList(PrefKey.accountFavorite, temp);
      }
    } catch (e) {
      rethrow;
    }
  }
}
