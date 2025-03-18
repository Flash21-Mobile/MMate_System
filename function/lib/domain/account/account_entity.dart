import 'dart:typed_data';

import 'package:function_system/domain/coordinate/coordinate_entity.dart';
import 'package:function_system/domain/grade/grade_entity.dart';
import 'package:function_system/domain/uri/uri_entity.dart';

class AccountEntity {
  final int id;
  final String name;
  final String email;
  final GradeEntity? grade;
  final GradeEntity? firstGrade;
  final GradeEntity? secondGrade;
  final GradeEntity? thirdGrade;
  final GradeEntity? fourthGrade;
  final bool isFavorite;
  final bool permission;
  final String cellphone;

  final String homeAddress;
  final String homeAddressSub;

  final String workName; // todo d: 회원 상세 정보에서만 필요한 정보는 엔티티 분리하기
  final String workPositionName;
  final String workCellphone;
  final String workAddress;
  final String workAddressSub;
  final bool hidden;
  final bool active;
  final String job;

  final List<UriEntity>? profileImage;

  final CoordinateEntity? coordinate;

  const AccountEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.grade,
    required this.firstGrade,
    required this.secondGrade,
    required this.thirdGrade,
    required this.fourthGrade,
    required this.permission,
    required this.cellphone,
    this.isFavorite = false,
    required this.hidden,
    required this.active,
    required this.workName,
    required this.workPositionName,
    required this.workAddress,
    required this.workAddressSub,
    required this.profileImage,
    required this.job,
    required this.homeAddress,
    required this.homeAddressSub,
    required this.workCellphone,
    required this.coordinate,
  });

  AccountEntity copyWith({
    bool? isFavorite,
    String? homeAddress,
    String? homeAddressSub,
    String? workName,
    String? workPositionName,
    String? telephone,
    String? workAddress,
    String? workAddressSub,
    String? email,
  }) {
    return AccountEntity(
      id: id,
      name: name,
      email: email ?? this.email,
      grade: grade,
      firstGrade: firstGrade,
      secondGrade: secondGrade,
      thirdGrade: thirdGrade,
      fourthGrade: fourthGrade,
      hidden: hidden,
      active: active,
      workName: workName ?? this.workName,
      workAddress: workAddress ?? this.workAddress,
      permission: permission,
      cellphone: cellphone,
      isFavorite: isFavorite ?? this.isFavorite,
      profileImage: profileImage,
      workPositionName: workPositionName ?? this.workPositionName,
      workAddressSub: workAddressSub ?? this.workAddressSub,
      job: job,
      homeAddress: homeAddress ?? this.homeAddress,
      homeAddressSub: homeAddressSub ?? this.homeAddressSub,
      workCellphone: workCellphone,
      coordinate: coordinate
    );
  }
}
