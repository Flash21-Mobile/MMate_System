import 'package:function_system/domain/coordinate/coordinate_entity.dart';
import 'package:function_system/domain/uri/uri_entity.dart';
import 'package:function_system/utilities/date_format.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/account/account_entity.dart';
import '../../grade/request/grade_response_dto.dart';

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
  String? job;
  String? xCoordinate;
  String? yCoordinate;

  AccountResponseDto({
    this.id,
    this.userId,
    this.userPassword,
    this.name,
    this.email,
    this.telephone,
    this.cellphone,
    this.faxNumber,
    this.signupYear,
    this.graduationYear,
    this.birthDate,
    this.workAddress,
    this.workAddressSub,
    this.workAddressZipCode,
    this.workName,
    this.workPositionName,
    this.homeAddress,
    this.homeAddressSub,
    this.homeAddressZipCode,
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
    this.job,
    this.xCoordinate,
    this.yCoordinate,
  });

  factory AccountResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseDtoToJson(this);

  AccountEntity toEntity({List<UriEntity>? profileImage}) {
    final resultXCoordinate = double.tryParse(xCoordinate ?? '');
    final resultYCoordinate = double.tryParse(yCoordinate ?? '');

    final coordinate = resultXCoordinate != null && resultYCoordinate != null
        ? CoordinateEntity(resultYCoordinate, resultXCoordinate)
        : null;

    return AccountEntity(
      // todo d: 이거 널 불가로 바꿔
      id: id ?? 0,
      name: name ?? '',
      email: email ?? '',
      grade: grade?.toEntity,
      firstGrade: firstGrade?.toEntity,
      secondGrade: secondGrade?.toEntity,
      thirdGrade: thirdGrade?.toEntity,
      fourthGrade: fourthGrade?.toEntity,
      permission: permission ?? false,
      cellphone: cellphone ?? '',
      workName: workName ?? '',
      workAddress: workAddress ?? '',
      workAddressSub: workAddressSub ?? '',
      workPositionName: workPositionName ?? '',
      hidden: hidden ?? true,
      active: active ?? false,
      profileImage: profileImage,
      job: job ?? '',
      homeAddress: homeAddress ?? '',
      homeAddressSub: homeAddressSub ?? '',
      workCellphone: telephone ?? '',
      coordinate: coordinate,

      point: int.tryParse(userId ?? '0') ?? 0,
      birthDate: MMateDateFormat.formatStringToDateTime(birthDate),
      gender: int.tryParse(userPassword ?? '0') ?? 0,
    );
  }
}
