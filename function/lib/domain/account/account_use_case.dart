import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:function_system/data/account/repository/account_repository.dart';
import 'package:function_system/data/account/request/account_request_dto.dart';
import 'package:function_system/data/account/response/account_response_dto.dart';
import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/data/login/repository/login_repository.dart';
import 'package:function_system/domain/account/account_entity.dart';
import 'package:function_system/domain/uri/uri_entity.dart';

import '../../key/constants_key.dart';

class GetAccountsUseCase {
  final AccountRepository repository;

  GetAccountsUseCase(this.repository);

  Future<List<AccountEntity>> execute() async {
    try {
      final resultAccountList = await repository.getAccountList(size: 10000);
      final resultFavoriteIdsList = await repository.getAccountFavorites();

      List<AccountEntity> favoriteAccountList = resultAccountList
          .where((user) => resultFavoriteIdsList.contains(user.id))
          .map((e) => e.toEntity().copyWith(isFavorite: true))
          .toList();

      List<AccountEntity> regularAccountList = resultAccountList
          .where((user) => !resultFavoriteIdsList.contains(user.id))
          .map((e) => e.toEntity())
          .toList();

      return favoriteAccountList + regularAccountList;
    } catch (e) {
      rethrow;
    }
  }
}

class GetAccountDetailUseCase {
  final AccountRepository repository;

  GetAccountDetailUseCase(this.repository);

  Future<AccountEntity> execute(int id) async {
    try {
      final resultAccountList =
          await repository.getAccountList(id: id, size: 1);
      final resultFavoriteIdsList = await repository.getAccountFavorites();

      final temp = resultAccountList.first;
      final isFavorite = resultFavoriteIdsList.contains(temp.id);

      var result = temp.toEntity();
      if (isFavorite) {
        result = result.copyWith(isFavorite: true);
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}

class PutAccountUseCase {
  final AccountRepository repository;
  final LoginRepository _loginRepository;
  final FileRepository _fileRepository;

  PutAccountUseCase(
      this.repository, this._loginRepository, this._fileRepository);

  Future<AccountEntity> execute({
    required AccountEntity entity,
    List<UriEntity> profileImages = const [],
    List<UriEntity> subImages = const [],
  }) async {
    try {
      final accountResult = await _loginRepository.login();

      final dto = AccountRequestDto(
          active: entity.active,
          android: accountResult.android,
          birthDate: accountResult.birthDate,
          cellphone: entity.cellphone,
          email: entity.email,
          faxNumber: accountResult.faxNumber,
          fifthGrade: accountResult.fifthGrade?.id,
          firstGrade: entity.firstGrade?.id,
          fourthGrade: entity.fourthGrade?.id,
          grade: entity.id,
          graduationYear: accountResult.graduationYear,
          homeAddress: entity.homeAddress,
          homeAddressSub: entity.homeAddressSub,
          homeAddressZipCode: accountResult.homeAddressZipCode,
          ios: accountResult.ios,
          name: entity.name,
          permission: entity.permission,
          secondGrade: entity.secondGrade?.id,
          signupYear: accountResult.signupYear,
          telephone: entity.workCellphone,
          thirdGrade: entity.thirdGrade?.id,
          userId: accountResult.userId,
          userPassword: accountResult.userPassword,
          workAddress: entity.workAddress,
          workAddressSub: entity.workAddressSub,
          workAddressZipCode: accountResult.workAddressZipCode,
          workName: entity.workName,
          workPositionName: entity.workPositionName,
          hidden: entity.hidden,
          job: entity.job);

      final result = await repository.putAccount(entity.id, dto);

      await _fileRepository.deleteFiles(ConstantsKey.accountImagesAPI, entity.id);

      final multipartProfiles = profileImages.map((e) => e.toMultipart()).toList();

      if (profileImages.isNotEmpty) {
        await _fileRepository.postFile(ConstantsKey.accountImagesAPI, entity.id, multipartProfiles);
      }

      await _fileRepository.deleteFiles('account_1', entity.id);
      final multipartSub = subImages.map((e) => e.toMultipart()).toList();

      if (subImages.isNotEmpty) {
        await _fileRepository.postFile('account_1', entity.id, multipartSub);
      }
      return result.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}

class PostAccountFavoriteUseCase {
  final AccountRepository repository;

  PostAccountFavoriteUseCase(this.repository);

  Future execute({required int id}) async {
    try {
      await repository.postAccountFavorite(id);
    } catch (e) {
      rethrow;
    }
  }
}

class DeleteAccountFavoriteUseCase {
  final AccountRepository repository;

  DeleteAccountFavoriteUseCase(this.repository);

  Future execute({required int id}) async {
    try {
      await repository.deleteAccountFavorite(id);
    } catch (e) {
      rethrow;
    }
  }
}
