import 'dart:typed_data';

import 'package:function_system/data/account/enricher/account_enricher.dart';
import 'package:function_system/data/account/mapper/account_mapper.dart';
import 'package:function_system/data/account/realm/account_realm_model.dart';
import 'package:function_system/data/account/repository/account_repository.dart';
import 'package:function_system/data/account/request/account_request_dto.dart';
import 'package:function_system/data/favorite/data/repository/favorite_repository.dart';
import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/domain/uri/uri_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:function_system/utilities/format/date_time_format.dart';

import '../../../key/constants_key.dart';
import '../entity/account/account_entity.dart';

class GetAccountsUseCase {
  final AccountRepository repository;
  final AccountEnricher _accountEnricher;

  GetAccountsUseCase(this.repository, this._accountEnricher);

  Future<List<AccountEntity>> execute() async {
    try {
      final resultAccountList = await repository.getAccountList(size: 10000);

      final tempAccountEntityList = resultAccountList.map((e) {
        return _accountEnricher.enrich(e);
      });

      List<AccountEntity> favoriteAccountList =
          tempAccountEntityList.where((user) => user.isFavorite).toList();

      List<AccountEntity> regularAccountList =
          tempAccountEntityList.where((user) => !user.isFavorite).toList();

      final result = favoriteAccountList + regularAccountList;

      return result;
    } catch (e) {
      rethrow;
    }
  }
}

class GetAccountDetailUseCase {
  final AccountRepository repository;
  final AccountEnricher _accountEnricher;

  GetAccountDetailUseCase(this.repository, this._accountEnricher);

  Future<AccountEntity> execute(int id) async {
    try {
      final tempAccount = await repository.getAccountDetail(id);

      final result = _accountEnricher.enrich(tempAccount);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}

class PutAccountUseCase {
  final AccountRepository repository;
  final AccountEnricher _accountEnricher;
  final FileRepository _fileRepository;

  PutAccountUseCase(
    this.repository,
    this._accountEnricher,
    this._fileRepository,
  );

  Future<AccountEntity> execute({
    required AccountEntity entity,
    required List<UriEntity> profileImages,
  }) async {
    try {
      final accountListResult = await repository.getAccountList(id: entity.id);

      if (accountListResult.isEmpty) {
        throw MMateException.noData;
      }
      final accountResult = accountListResult.last;
      final dto = AccountRequestDto(
        userId: accountResult.userId,
        userPassword: accountResult.userPassword,
        name: entity.name,
        email: entity.email,
        telephone: entity.cellphone,
        cellphone: entity.cellphone,
        faxNumber: entity.faxNumber,
        birthDate: entity.birthDate?.toServerString(),
        workAddress: entity.workAddress,
        workAddressSub: entity.workAddressSub,
        workAddressZipCode: entity.workAddressZipCode,
        workName: entity.workName,
        workPositionName: entity.workPositionName,
        homeAddress: entity.homeAddress,
        homeAddressSub: entity.homeAddressSub,
        homeAddressZipCode: entity.homeAddressZipCode,
        grade: entity.grade?.id,
        firstGrade: entity.firstGrade?.id,
        secondGrade: entity.secondGrade?.id,
        thirdGrade: entity.thirdGrade?.id,
        fourthGrade: entity.fourthGrade?.id,
        fifthGrade: entity.fifthGrade?.id,
        android: entity.android,
        ios: entity.ios,
        active: entity.active,
        hidden: entity.hidden,
        permission: entity.permission,
        clubRi: entity.clubRi,
        memberRi: entity.memberRi,
        nickname: entity.nickname,
        englishName: entity.englishName,
        memo: entity.memo,
        job: entity.job,
        time: entity.time?.toServerString(),
      );

      // 회원 수정
      final result = await repository.putAccount(entity.id, dto);

      // 프로필 사진 전부 삭제
      await _fileRepository.deleteFiles(
        ConstantsKey.accountImagesAPI,
        entity.id,
      );

      // 프로필 사진 멀티파트로 변환
      final multipartProfiles = profileImages.map((e) {
        return e.toMultipart();
      }).toList();

      // 이미지 삽입
      if (profileImages.isNotEmpty) {
        await _fileRepository.postFile(
          ConstantsKey.accountImagesAPI,
          entity.id,
          multipartProfiles,
        );
      }

      return _accountEnricher.enrich(result);
    } catch (e) {
      rethrow;
    }
  }
}

class PostAccountFavoriteUseCase {
  final FavoriteRepository repository;

  PostAccountFavoriteUseCase(this.repository);

  void execute(int id) async {
    try {
      return repository.saveFavoriteAccount(AccountRealmModel(id));
    } catch (e) {
      rethrow;
    }
  }
}

class DeleteAccountFavoriteUseCase {
  final FavoriteRepository _favoriteRepository;

  DeleteAccountFavoriteUseCase(this._favoriteRepository);

  void execute(int id) async {
    try {
      return _favoriteRepository.deleteFavoriteAccount(id);
    } catch (e) {
      rethrow;
    }
  }
}
