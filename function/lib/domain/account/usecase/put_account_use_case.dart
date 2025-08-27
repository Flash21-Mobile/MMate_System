import 'package:function_system/domain/account/entity/edit_account/edit_account.dart';
import 'package:function_system/utilities/format/date_time_format.dart';

import '../../../data/account/enricher/account_enricher.dart';
import '../../../data/account/repository/account_repository.dart';
import '../../../data/account/request/account_request_dto.dart';
import '../../../data/file/repository/file_repository.dart';
import '../../../utilities/exception/exception.dart';
import '../entity/account/account.dart';

class PutAccountUseCase {
  final AccountRepository repository;
  final AccountEnricher _accountEnricher;
  final FileRepository _fileRepository;

  PutAccountUseCase(
      this.repository,
      this._accountEnricher,
      this._fileRepository,
      );

  Future<Account> execute(
      int id, {
        required EditAccount account,
      }) async {
    try {
      final accountListResult = await repository.getAccountList(id: id);

      if (accountListResult.isEmpty) {
        throw MMateException.noData;
      }
      final accountResult = accountListResult.last;

      final dto = AccountRequestDto(
        userId: accountResult.userId,
        userPassword: accountResult.userPassword,
        name: accountResult.name,
        email: account.email,
        telephone: account.telephone,
        cellphone: accountResult.cellphone,
        faxNumber: account.faxNumber,
        birthDate: account.birthDate?.toDate(),
        workAddress: account.workAddress,
        workAddressSub: account.workAddressSub,
        workAddressZipCode: account.workAddressZipCode,
        workName: account.workName,
        workPositionName: account.workPositionName,
        homeAddress: accountResult.homeAddress,
        homeAddressSub: accountResult.homeAddressSub,
        homeAddressZipCode: accountResult.homeAddressZipCode,
        grade: accountResult.grade?.id,
        firstGrade: accountResult.firstGrade?.id,
        secondGrade: account.secondGrade,
        thirdGrade: accountResult.thirdGrade?.id,
        fourthGrade: accountResult.fourthGrade?.id,
        fifthGrade: accountResult.fifthGrade?.id,
        android: accountResult.android,
        ios: accountResult.ios,
        active: accountResult.active,
        hidden: accountResult.hidden,
        permission: accountResult.permission,
        clubRi: accountResult.clubRi,
        memberRi: accountResult.memberRi,
        nickname: account.nickname,
        englishName: account.englishName,
        memo: account.memo,
        job: account.job,
        time: account.time?.toDate(),
      );

      // 회원 수정
      final result = await repository.putAccount(id, dto);

      // 프로필 사진 전부 삭제
      await _fileRepository.delete(
        'account',
        id,
      );

      // 프로필 사진 멀티파트로 변환
      final multipartProfiles = account.profileImages.map((e) {
        return e.toMultipart();
      }).toList();

      // 이미지 삽입
      if (account.profileImages.isNotEmpty) {
        await _fileRepository.post(
          'account',
          id,
          multipartProfiles,
        );
      }

      return _accountEnricher.enrich(result);
    } catch (e) {
      rethrow;
    }
  }
}