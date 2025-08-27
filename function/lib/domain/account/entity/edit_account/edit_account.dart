import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../uint_file/entity/uint_file.dart';

part 'edit_account.freezed.dart';

@freezed
abstract class EditAccount with _$EditAccount {
  const factory EditAccount({
    required int? secondGrade,
    required String email,
    required String telephone,
    required String faxNumber,
    required DateTime? birthDate,
    required String workAddress,
    required String workAddressSub,
    required String workAddressZipCode,
    required String workName,
    required String workPositionName,
    required String nickname,
    required String englishName,
    required String memo,
    required String job,
    required DateTime? time,

    required List<UintFile> profileImages,
  }) = _EditAccount;
}
