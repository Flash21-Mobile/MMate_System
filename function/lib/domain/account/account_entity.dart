import 'package:freezed_annotation/freezed_annotation.dart';

import '../coordinate/coordinate_entity.dart';
import '../grade/grade_entity.dart';
import '../uri/uri_entity.dart';

part 'account_entity.freezed.dart';

@freezed
abstract class AccountEntity with _$AccountEntity {
  // todo d: 회원 상세 정보에서만 필요한 정보는 엔티티 분리하기
  const factory AccountEntity({
    required int id,
    required String name,
    required String email,
    GradeEntity? grade,
    GradeEntity? firstGrade,
    GradeEntity? secondGrade,
    GradeEntity? thirdGrade,
    GradeEntity? fourthGrade,
    @Default(false) bool isFavorite,
    @Default(false) bool permission,
    required String cellphone,
    required String homeAddress,
    required String homeAddressSub,
    required String workName,
    required String workPositionName,
    required String workCellphone,
    required String workAddress,
    required String workAddressSub,
    required bool hidden,
    required bool active,
    required String job,
    List<UriEntity>? profileImage,
    CoordinateEntity? coordinate,




    required DateTime? birthDate,
    required int point,
    required int gender,
  }) = _AccountEntity;
}
