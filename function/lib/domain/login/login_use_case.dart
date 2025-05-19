import 'dart:typed_data';

import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/data/login/repository/login_repository.dart';
import 'package:function_system/data/uri/response/uri_response_dto.dart';
import 'package:function_system/domain/account/base/base_account_entity.dart';
import 'package:function_system/domain/uri/uri_entity.dart';
import 'package:function_system/key/constants_key.dart';
import 'package:function_system/utilities/exception/exceoption.dart';

import '../../data/account/enricher/account_enricher.dart';
import '../account/entity/account/account_entity.dart';

class LoginUseCase {
  final LoginRepository repository;
  final AccountEnricher _accountEnricher;

  LoginUseCase(this.repository, this._accountEnricher);

  Future<AccountEntity> execute() async {
    try {
      final result = await repository.login();
      if (result.id == null) {
        throw 'Cannot Found User';
      }

      return _accountEnricher.enrich(result);
    } catch (e) {
      rethrow;
    }
  }
}
