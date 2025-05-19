import 'package:json_annotation/json_annotation.dart';

part 'account_request_dto.g.dart';

@JsonSerializable()
class AccountRequestDto {
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
  int? grade;
  int? firstGrade;
  int? secondGrade;
  int? thirdGrade;
  int? fourthGrade;
  int? fifthGrade;
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


  AccountRequestDto({
    required this.userId,
    required this.userPassword,
    required this.name,
    required this.email,
    required this.telephone,
    required this.cellphone,
    required this.faxNumber,
    required this.birthDate,
    required this.workAddress,
    required this.workAddressSub,
    required this.workAddressZipCode,
    required this.workName,
    required this.workPositionName,
    required this.homeAddress,
    required this.homeAddressSub,
    required this.homeAddressZipCode,
    required this.grade,
    required this.firstGrade,
    required this.secondGrade,
    required this.thirdGrade,
    required this.fourthGrade,
    required this.fifthGrade,
    required this.android,
    required this.ios,
    required this.active,
    required this.hidden,
    required this.permission,
    required this.clubRi,
    required this.memberRi,
    required this.nickname,
    required this.englishName,
    required this.memo,
    required this.job,
    required this.time,
  });

  factory AccountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AccountRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRequestDtoToJson(this);
}
