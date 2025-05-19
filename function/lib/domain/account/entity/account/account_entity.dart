import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:function_system/domain/account/base/base_account_entity.dart';
import 'package:function_system/domain/coordinate/coordinate_entity.dart';
import 'package:function_system/domain/uri/uri_entity.dart';

import '../../grade/grade_entity.dart';

part 'account_entity.freezed.dart';

@freezed
abstract class AccountEntity with _$AccountEntity implements BaseAccountEntity{
  const factory AccountEntity({
    required int id,
    required String name,
    required String cellphone,
    required String homeAddress,
    required String? homeAddressSub,
    required String? homeAddressZipCode,
    required GradeEntity? grade,
    required GradeEntity? firstGrade,
    required GradeEntity? secondGrade,
    required GradeEntity? thirdGrade,
    required GradeEntity? fourthGrade,
    required GradeEntity? fifthGrade,
    required bool android,
    required bool ios,
    required bool hidden,
    required bool permission,
    required bool active,
    required bool isFavorite,
    required CoordinateEntity? coordinate,
    required List<UriEntity> profileImage,

    required String email,
    required String telephone,
    required String faxNumber,
    required DateTime? birthDate,
    required String workAddress,
    required String? workAddressSub,
    required String workAddressZipCode,
    required String workName,
    required String workPositionName,
    required String clubRi,
    required String memberRi,
    required String nickname,
    required String englishName,
    required String memo,
    required String job,
    required DateTime? time,

  }) = _AccountEntity;
}