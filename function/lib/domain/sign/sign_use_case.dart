import 'dart:io';

import 'package:function_system/data/fcm/repository/fcm_repository.dart';
import 'package:function_system/data/login/repository/login_repository.dart';
import 'package:function_system/data/sign/repository/sign_repository.dart';
import 'package:function_system/domain/account/account_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:permission_handler/permission_handler.dart';

class SignInUseCase {
  final SignRepository repository;
  final LoginRepository loginRepository;
  final FcmRepository _fcmRepository;

  SignInUseCase(
    this.repository,
    this.loginRepository,
    this._fcmRepository,
  );

  Future<AccountEntity> execute(
    String? fcmToken, {
    String? name,
    String? cellphone,
  }) async {
    late String currentCellphone;

    try {
      if (cellphone == null) {
        if (Platform.isAndroid && await Permission.phone.request().isDenied) {
          throw 'Permission is Denied';
        }
        currentCellphone = await repository.getCellphone();
      } else {
        currentCellphone = cellphone;
      }

      final result = await repository.signIn(name, currentCellphone);
      await repository.setToken(result);

      final loginResult = await loginRepository.login();

      if (fcmToken != null) {
        await _fcmRepository.putFcm(fcmToken);
      }

      if (loginResult.active == true && loginResult.id != null) {
        return loginResult.toEntity();
      }
      throw MMateException.noActiveAccountFound;
    } catch (e) {
      rethrow;
    }
  }
}