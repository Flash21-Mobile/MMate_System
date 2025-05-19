import 'package:function_system/data/account/repository/account_repository.dart';
import 'package:function_system/data/account/response/account_response_dto.dart';
import 'package:function_system/data/favorite/data/repository/favorite_repository.dart';
import 'package:function_system/domain/account/entity/account/account_entity.dart';

import '../../../domain/coordinate/coordinate_entity.dart';
import '../../../utilities/date_format.dart';

class AccountEnricher {
  final FavoriteRepository _favoriteRepository;

  const AccountEnricher(this._favoriteRepository);

  AccountEntity enrich(AccountResponseDto dto) {
    final resultXCoordinate = double.tryParse(dto.xCoordinate ?? '');
    final resultYCoordinate = double.tryParse(dto.yCoordinate ?? '');

    final coordinate = resultXCoordinate != null && resultYCoordinate != null
        ? CoordinateEntity(resultYCoordinate, resultXCoordinate)
        : null;

    final isFavorite = _favoriteRepository.isFavoriteAccount(dto.id!);

    return AccountEntity(
      id: dto.id ?? 0,
      name: dto.name ?? '',
      email:dto. email ?? '',
      telephone:dto. telephone ?? '',
      cellphone: dto.cellphone ?? '',
      faxNumber: dto.faxNumber ?? '',
      birthDate: MMateDateFormat.formatStringToDateTime(dto.birthDate),
      workAddress: dto.workAddress ?? '',
      workAddressSub: dto.workAddressSub ?? '',
      workAddressZipCode: dto.workAddressZipCode ?? '',
      workName:dto. workName ?? '',
      workPositionName: dto.workPositionName ?? '',
      homeAddress: dto.homeAddress ?? '',
      homeAddressSub: dto.homeAddressSub ?? '',
      homeAddressZipCode: dto.homeAddressZipCode ?? '',
      coordinate: coordinate,
      grade: dto.grade?.toEntity(),
      firstGrade:dto. firstGrade?.toEntity(),
      secondGrade: dto.secondGrade?.toEntity(),
      thirdGrade: dto.thirdGrade?.toEntity(),
      fourthGrade: dto.fourthGrade?.toEntity(),
      fifthGrade: dto.fifthGrade?.toEntity(),
      android: dto.android ?? false,
      ios: dto.ios ?? false,
      active: dto.active ?? false,
      hidden: dto.hidden ?? false,
      permission: dto.permission ?? false,
      clubRi: dto.clubRi ?? '',
      memberRi: dto.memberRi ?? '',
      nickname: dto.nickname ?? '',
      englishName: dto.englishName ?? '',
      memo: dto.memo ?? '',
      job: dto.job ?? '',
      time: MMateDateFormat.formatStringToDateTime(dto.time),
      isFavorite: isFavorite,
    );
  }
}
