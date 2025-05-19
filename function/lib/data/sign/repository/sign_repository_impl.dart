import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_system/data/sign/request/sign_request_dto.dart';
import 'package:function_system/data/sign/service/sign_service.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sign_repository.dart';
import '../../../key/secure_storage_key.dart';
import '../../../key/shared_preference_key.dart';

class SignRepositoryImpl extends SignRepository {
  final FlutterSecureStorage secureStorage;
  final SignService service;

  SignRepositoryImpl(
    this.secureStorage,
    this.service,
  );

  @override
  Future<String> signIn(String? name, String cellphone) async {
    try {
      final temp = await service.signIn(SignRequestDto(
        name: name,
        cellphone: cellphone,
      ));
      final result = temp.token;

      if (result != null) {
        return result;
      } else {
        throw 'tokenIsNull';
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future setToken(String token) async {
    await secureStorage.write(key: SecureStorageKey.token, value: token);
  }

  @override
  Future<String?> getToken() async {
    return await secureStorage.read(key: SecureStorageKey.token);
  }

  @override
  Future setCellphone(String cellphone) async {
    await secureStorage.write(key: SecureStorageKey.cellphone, value: cellphone);
  }

  @override
  Future<String> getCellphone() async {
    final preferences = await SharedPreferences.getInstance();
    try {
      if ((preferences.getBool(PrefKey.isNotFirst)) == true) {
        final cellphone = await secureStorage.read(key: SecureStorageKey.cellphone);
        if (cellphone != null) {
          return cellphone;
        }
      }
      secureStorage.deleteAll();
      preferences.setBool(PrefKey.isNotFirst, true);

      throw MMateException.noData;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> getCellphoneOnDevice() async {
    try {
      if (Platform.isAndroid) {
        const androidChannel = MethodChannel('com.flash21.mmate/android');

        var cellphoneNum = await androidChannel.invokeMethod('getCellphone');
        if (cellphoneNum != null && cellphoneNum is String) {
          var cellphone = cellphoneNum.replaceAll('+82', '0');

          final indexPhone =
              '${cellphone.substring(0, 3)}-${cellphone.substring(3, 7)}-${cellphone.substring(7)}';
          return indexPhone;
        }
      }
      throw MMateException.noData;
    } catch (e) {
      rethrow;
    }
  }
}
