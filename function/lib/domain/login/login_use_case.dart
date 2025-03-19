import 'dart:typed_data';

import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/data/login/repository/login_repository.dart';
import 'package:function_system/data/uri/response/uri_response_dto.dart';
import 'package:function_system/domain/account/account_entity.dart';
import 'package:function_system/domain/uri/uri_entity.dart';
import 'package:function_system/key/constants_key.dart';
import 'package:function_system/utilities/exception/exceoption.dart';

class LoginUseCase {
  final LoginRepository repository;
  final FileRepository fileRepository;

  LoginUseCase(this.repository, this.fileRepository);

  Future<AccountEntity> execute() async {
    try {
      final result = await repository.login();
      if (result.id == null) {
        throw 'Cannot Found User';
      }

      List<UriResponseDTO> fileResult = [];

      try {
        fileResult =
            await fileRepository.getImages(ConstantsKey.accountImagesAPI, result.id!);
      } catch (e) {
        if (e != MMateException.noFilesFound) {
          rethrow;
        }
      }

      return result.toEntity(profileImage: fileResult.map((e)=> e.toEntity).toList());
    } catch (e) {
      rethrow;
    }
  }
}
