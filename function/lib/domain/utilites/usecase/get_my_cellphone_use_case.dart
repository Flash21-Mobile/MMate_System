import 'dart:io';

import 'package:function_system/data/sign/repository/sign_repository.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:permission_handler/permission_handler.dart';

class GetMyCellphoneUseCase {
  final SignRepository repository;

  const GetMyCellphoneUseCase(this.repository);

  Future<String> execute() async {
    try {
      if (Platform.isAndroid && await Permission.phone.request().isDenied) {
        throw 'Permission is Denied';
      }
      final result = await repository.getCellphone();
      return result;
    } catch (e) {
      throw MMateException.noData;
    }
  }
}
