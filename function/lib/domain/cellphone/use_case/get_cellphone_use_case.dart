import 'dart:io';

import 'package:function_system/utilities/log.dart';

import '../../../data/sign/repository/sign_repository.dart';

class GetCellphoneUseCase {
  final SignRepository repository;

  const GetCellphoneUseCase(this.repository);

  Future<String?> execute() async {
    try {
      if (Platform.isAndroid) {
        try {
          return await repository.getCellphoneOnDevice();
        } catch (e, stackTrace) {
          Log.e('$e $stackTrace');
        }
      }

      return await repository.getCellphone();
    } catch (e) {
      return null;
    }
  }
}