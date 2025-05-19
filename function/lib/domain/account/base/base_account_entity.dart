import 'package:freezed_annotation/freezed_annotation.dart';

import '../../coordinate/coordinate_entity.dart';
import '../../grade/grade_entity.dart';
import '../../uri/uri_entity.dart';

part 'base_account_entity.freezed.dart';

@freezed
abstract class BaseAccountEntity with _$BaseAccountEntity {
  const factory BaseAccountEntity({
    required int id,
    required String name,
    required String cellphone,
    required String homeAddress,
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
  }) = _BaseAccountEntity;
}
