import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../coordinate/entity/coordinate.dart';
import '../../../grade/entity/grade.dart';

part 'account.freezed.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    required int id,
    required String name,
    required String cellphone,
    required String homeAddress,
    required String homeAddressSub,
    required String homeAddressZipCode,
    required Grade? grade,
    required Grade? firstGrade,
    required Grade? secondGrade,
    required Grade? thirdGrade,
    required Grade? fourthGrade,
    required Grade? fifthGrade,
    required bool android,
    required bool ios,
    required bool hidden,
    required bool permission,
    required bool active,
    required bool isFavorite,
    required Coordinate? coordinate,

    required String email,
    required String telephone,
    required String faxNumber,
    required DateTime? birthDate,
    required String workAddress,
    required String workAddressSub,
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
  }) = _Account;
}