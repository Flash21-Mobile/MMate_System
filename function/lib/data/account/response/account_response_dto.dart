import 'package:json_annotation/json_annotation.dart';

import '../../grade/response/grade_response_dto.dart';

part 'account_response_dto.g.dart';

@JsonSerializable()
class AccountResponseDto {
  int? id;
  String? userId;
  String? userPassword;
  String? name;
  String? email;
  String? telephone;
  String? cellphone;
  String? faxNumber;
  String? birthDate;
  String? workAddress;
  String? workAddressSub;
  String? workAddressZipCode;
  String? workName;
  String? workPositionName;
  String? homeAddress;
  String? homeAddressSub;
  String? homeAddressZipCode;
  String? xCoordinate;
  String? yCoordinate;
  GradeResponseDto? grade;
  GradeResponseDto? firstGrade;
  GradeResponseDto? secondGrade;
  GradeResponseDto? thirdGrade;
  GradeResponseDto? fourthGrade;
  GradeResponseDto? fifthGrade;
  bool? android;
  bool? ios;
  bool? active;
  bool? hidden;
  bool? permission;
  String? clubRi;
  String? memberRi;
  String? nickname;
  String? englishName;
  String? memo;
  String? job;
  String? time;

  AccountResponseDto({
    this.id,
    this.userId,
    this.userPassword,
    this.name,
    this.email,
    this.telephone,
    this.cellphone,
    this.faxNumber,
    this.birthDate,
    this.workAddress,
    this.workAddressSub,
    this.workAddressZipCode,
    this.workName,
    this.workPositionName,
    this.homeAddress,
    this.homeAddressSub,
    this.homeAddressZipCode,
    this.xCoordinate,
    this.yCoordinate,
    this.grade,
    this.firstGrade,
    this.secondGrade,
    this.thirdGrade,
    this.fourthGrade,
    this.fifthGrade,
    this.android,
    this.ios,
    this.active,
    this.hidden,
    this.permission,
    this.clubRi,
    this.memberRi,
    this.nickname,
    this.englishName,
    this.memo,
    this.job,
    this.time,
  });

  factory AccountResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseDtoToJson(this);
}
