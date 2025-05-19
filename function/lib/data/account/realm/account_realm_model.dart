import 'package:function_system/data/grade/realm/grade_realm_model.dart';
import 'package:realm/realm.dart';

import '../../coordinate/coordinate_realm_model.dart';

part 'account_realm_model.realm.dart';

@RealmModel()
class _AccountRealmModel {
  late int accountId;
  late String name;
  late String cellphone;
  late String homeAddress;
  late String? homeAddressSub;
  late String? homeAddressZipCode;
  late _GradeRealmModel? grade;
  late _GradeRealmModel? firstGrade;
  late _GradeRealmModel? secondGrade;
  late _GradeRealmModel? thirdGrade;
  late _GradeRealmModel? fourthGrade;
  late _GradeRealmModel? fifthGrade;
  late bool android;
  late bool ios;
  late bool hidden;
  late bool permission;
  late bool active;
  late _CoordinateRealmModel? coordinate;

  late String email;
  late String telephone;
  late String faxNumber;
  late DateTime? birthDate;
  late String workAddress;
  late String? workAddressSub;
  late String workAddressZipCode;
  late String workName;
  late String workPositionName;
  late String clubRi;
  late String memberRi;
  late String nickname;
  late String englishName;
  late String memo;
  late String job;
  late DateTime? time;
}

@RealmModel(ObjectType.embeddedObject)
class _CoordinateRealmModel {
  late double lat;
  late double lng;
}

@RealmModel(ObjectType.embeddedObject)
class _GradeRealmModel{
  late int gradeId;
  late String name;
  late String positionName;
  late int? order;
  late int? groupOrder;
  late bool active;
}