import 'package:json_annotation/json_annotation.dart';

part 'account_request_dto.g.dart';

@JsonSerializable()
class AccountRequestDto {
  // todo d: request에 맞게 수정하기
  String? userId;
  String? userPassword;
  String? name;
  String? email;
  String? telephone;
  String? cellphone;
  String? faxNumber;
  int? signupYear;
  int? graduationYear;
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
  String job;

  AccountRequestDto(
      {required this.active,
      required this.android,
      required this.birthDate,
      required this.cellphone,
      required this.email,
      required this.faxNumber,
      required this.fifthGrade,
      required this.firstGrade,
      required this.fourthGrade,
      required this.grade,
      required this.graduationYear,
      required this.homeAddress,
      required this.homeAddressSub,
      required this.homeAddressZipCode,
      required this.ios,
      required this.name,
      required this.permission,
      required this.secondGrade,
      required this.signupYear,
      required this.telephone,
      required this.thirdGrade,
      required this.userId,
      required this.userPassword,
      required this.workAddress,
      required this.workAddressSub,
      required this.workAddressZipCode,
      required this.workName,
      required this.workPositionName,
      required this.hidden,
      required this.job});

  factory AccountRequestDto.fromJson(Map<String, dynamic> json) =>
      _$AccountRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountRequestDtoToJson(this);
}
