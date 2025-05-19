import 'dart:io';

import 'package:function_system/data/fcm/repository/fcm_repository.dart';
import 'package:function_system/data/login/repository/login_repository.dart';
import 'package:function_system/data/sign/repository/sign_repository.dart';
import 'package:function_system/domain/account/base/base_account_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:permission_handler/permission_handler.dart';

import '../account/entity/account/account_entity.dart';

class SignInUseCase {
  final SignRepository repository;
  final LoginRepository loginRepository;
  final FcmRepository _fcmRepository;

  SignInUseCase(
    this.repository,
    this.loginRepository,
    this._fcmRepository,
  );

  Future<String> execute(
    String? fcmToken, {
    String? name,
    required String cellphone,
  }) async {
    try {
      final result = await repository.signIn(name, cellphone);
      await repository.setToken(result);

      if (fcmToken != null) {
        await _fcmRepository.putFcm(fcmToken);
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}

class GetCellphoneUseCase {
  final SignRepository repository;

  const GetCellphoneUseCase(this.repository);

  Future<String?> execute() async {
    try {
      final result = await repository.getCellphone();
      return result;
    } catch (e) {
      return null;
    }
  }
}

class SetCellphoneUseCase {
  final SignRepository repository;

  const SetCellphoneUseCase(this.repository);

  Future execute(String cellphone) async {
    try {
      await repository.setCellphone(cellphone);
    } catch (e) {
      rethrow;
    }
  }
}

class GetCellphoneInAndroidUseCase {
  final SignRepository repository;

  const GetCellphoneInAndroidUseCase(this.repository);

  Future<String?> execute() async {
    try {
      final result = await repository.getCellphoneOnDevice();
      return result;
    } catch (e) {
      return null;
    }
  }
}
