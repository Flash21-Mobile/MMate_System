// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_realm_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
class AccountRealmModel extends _AccountRealmModel
    with RealmEntity, RealmObjectBase, RealmObject {
  AccountRealmModel(
    int id,
    String name,
    String cellphone,
    String homeAddress,
    bool android,
    bool ios,
    bool hidden,
    bool permission,
    bool active,
    String email,
    String telephone,
    String faxNumber,
    String workAddress,
    String workAddressZipCode,
    String workName,
    String workPositionName,
    String clubRi,
    String memberRi,
    String nickname,
    String englishName,
    String memo,
    String job, {
    String? homeAddressSub,
    String? homeAddressZipCode,
    GradeRealmModel? grade,
    GradeRealmModel? firstGrade,
    GradeRealmModel? secondGrade,
    GradeRealmModel? thirdGrade,
    GradeRealmModel? fourthGrade,
    GradeRealmModel? fifthGrade,
    CoordinateRealmModel? coordinate,
    DateTime? birthDate,
    String? workAddressSub,
    DateTime? time,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'cellphone', cellphone);
    RealmObjectBase.set(this, 'homeAddress', homeAddress);
    RealmObjectBase.set(this, 'homeAddressSub', homeAddressSub);
    RealmObjectBase.set(this, 'homeAddressZipCode', homeAddressZipCode);
    RealmObjectBase.set(this, 'grade', grade);
    RealmObjectBase.set(this, 'firstGrade', firstGrade);
    RealmObjectBase.set(this, 'secondGrade', secondGrade);
    RealmObjectBase.set(this, 'thirdGrade', thirdGrade);
    RealmObjectBase.set(this, 'fourthGrade', fourthGrade);
    RealmObjectBase.set(this, 'fifthGrade', fifthGrade);
    RealmObjectBase.set(this, 'android', android);
    RealmObjectBase.set(this, 'ios', ios);
    RealmObjectBase.set(this, 'hidden', hidden);
    RealmObjectBase.set(this, 'permission', permission);
    RealmObjectBase.set(this, 'active', active);
    RealmObjectBase.set(this, 'coordinate', coordinate);
    RealmObjectBase.set(this, 'email', email);
    RealmObjectBase.set(this, 'telephone', telephone);
    RealmObjectBase.set(this, 'faxNumber', faxNumber);
    RealmObjectBase.set(this, 'birthDate', birthDate);
    RealmObjectBase.set(this, 'workAddress', workAddress);
    RealmObjectBase.set(this, 'workAddressSub', workAddressSub);
    RealmObjectBase.set(this, 'workAddressZipCode', workAddressZipCode);
    RealmObjectBase.set(this, 'workName', workName);
    RealmObjectBase.set(this, 'workPositionName', workPositionName);
    RealmObjectBase.set(this, 'clubRi', clubRi);
    RealmObjectBase.set(this, 'memberRi', memberRi);
    RealmObjectBase.set(this, 'nickname', nickname);
    RealmObjectBase.set(this, 'englishName', englishName);
    RealmObjectBase.set(this, 'memo', memo);
    RealmObjectBase.set(this, 'job', job);
    RealmObjectBase.set(this, 'time', time);
  }

  AccountRealmModel._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get cellphone =>
      RealmObjectBase.get<String>(this, 'cellphone') as String;
  @override
  set cellphone(String value) => RealmObjectBase.set(this, 'cellphone', value);

  @override
  String get homeAddress =>
      RealmObjectBase.get<String>(this, 'homeAddress') as String;
  @override
  set homeAddress(String value) =>
      RealmObjectBase.set(this, 'homeAddress', value);

  @override
  String? get homeAddressSub =>
      RealmObjectBase.get<String>(this, 'homeAddressSub') as String?;
  @override
  set homeAddressSub(String? value) =>
      RealmObjectBase.set(this, 'homeAddressSub', value);

  @override
  String? get homeAddressZipCode =>
      RealmObjectBase.get<String>(this, 'homeAddressZipCode') as String?;
  @override
  set homeAddressZipCode(String? value) =>
      RealmObjectBase.set(this, 'homeAddressZipCode', value);

  @override
  GradeRealmModel? get grade =>
      RealmObjectBase.get<GradeRealmModel>(this, 'grade') as GradeRealmModel?;
  @override
  set grade(covariant GradeRealmModel? value) =>
      RealmObjectBase.set(this, 'grade', value);

  @override
  GradeRealmModel? get firstGrade =>
      RealmObjectBase.get<GradeRealmModel>(this, 'firstGrade')
          as GradeRealmModel?;
  @override
  set firstGrade(covariant GradeRealmModel? value) =>
      RealmObjectBase.set(this, 'firstGrade', value);

  @override
  GradeRealmModel? get secondGrade =>
      RealmObjectBase.get<GradeRealmModel>(this, 'secondGrade')
          as GradeRealmModel?;
  @override
  set secondGrade(covariant GradeRealmModel? value) =>
      RealmObjectBase.set(this, 'secondGrade', value);

  @override
  GradeRealmModel? get thirdGrade =>
      RealmObjectBase.get<GradeRealmModel>(this, 'thirdGrade')
          as GradeRealmModel?;
  @override
  set thirdGrade(covariant GradeRealmModel? value) =>
      RealmObjectBase.set(this, 'thirdGrade', value);

  @override
  GradeRealmModel? get fourthGrade =>
      RealmObjectBase.get<GradeRealmModel>(this, 'fourthGrade')
          as GradeRealmModel?;
  @override
  set fourthGrade(covariant GradeRealmModel? value) =>
      RealmObjectBase.set(this, 'fourthGrade', value);

  @override
  GradeRealmModel? get fifthGrade =>
      RealmObjectBase.get<GradeRealmModel>(this, 'fifthGrade')
          as GradeRealmModel?;
  @override
  set fifthGrade(covariant GradeRealmModel? value) =>
      RealmObjectBase.set(this, 'fifthGrade', value);

  @override
  bool get android => RealmObjectBase.get<bool>(this, 'android') as bool;
  @override
  set android(bool value) => RealmObjectBase.set(this, 'android', value);

  @override
  bool get ios => RealmObjectBase.get<bool>(this, 'ios') as bool;
  @override
  set ios(bool value) => RealmObjectBase.set(this, 'ios', value);

  @override
  bool get hidden => RealmObjectBase.get<bool>(this, 'hidden') as bool;
  @override
  set hidden(bool value) => RealmObjectBase.set(this, 'hidden', value);

  @override
  bool get permission => RealmObjectBase.get<bool>(this, 'permission') as bool;
  @override
  set permission(bool value) => RealmObjectBase.set(this, 'permission', value);

  @override
  bool get active => RealmObjectBase.get<bool>(this, 'active') as bool;
  @override
  set active(bool value) => RealmObjectBase.set(this, 'active', value);

  @override
  CoordinateRealmModel? get coordinate =>
      RealmObjectBase.get<CoordinateRealmModel>(this, 'coordinate')
          as CoordinateRealmModel?;
  @override
  set coordinate(covariant CoordinateRealmModel? value) =>
      RealmObjectBase.set(this, 'coordinate', value);

  @override
  String get email => RealmObjectBase.get<String>(this, 'email') as String;
  @override
  set email(String value) => RealmObjectBase.set(this, 'email', value);

  @override
  String get telephone =>
      RealmObjectBase.get<String>(this, 'telephone') as String;
  @override
  set telephone(String value) => RealmObjectBase.set(this, 'telephone', value);

  @override
  String get faxNumber =>
      RealmObjectBase.get<String>(this, 'faxNumber') as String;
  @override
  set faxNumber(String value) => RealmObjectBase.set(this, 'faxNumber', value);

  @override
  DateTime? get birthDate =>
      RealmObjectBase.get<DateTime>(this, 'birthDate') as DateTime?;
  @override
  set birthDate(DateTime? value) =>
      RealmObjectBase.set(this, 'birthDate', value);

  @override
  String get workAddress =>
      RealmObjectBase.get<String>(this, 'workAddress') as String;
  @override
  set workAddress(String value) =>
      RealmObjectBase.set(this, 'workAddress', value);

  @override
  String? get workAddressSub =>
      RealmObjectBase.get<String>(this, 'workAddressSub') as String?;
  @override
  set workAddressSub(String? value) =>
      RealmObjectBase.set(this, 'workAddressSub', value);

  @override
  String get workAddressZipCode =>
      RealmObjectBase.get<String>(this, 'workAddressZipCode') as String;
  @override
  set workAddressZipCode(String value) =>
      RealmObjectBase.set(this, 'workAddressZipCode', value);

  @override
  String get workName =>
      RealmObjectBase.get<String>(this, 'workName') as String;
  @override
  set workName(String value) => RealmObjectBase.set(this, 'workName', value);

  @override
  String get workPositionName =>
      RealmObjectBase.get<String>(this, 'workPositionName') as String;
  @override
  set workPositionName(String value) =>
      RealmObjectBase.set(this, 'workPositionName', value);

  @override
  String get clubRi => RealmObjectBase.get<String>(this, 'clubRi') as String;
  @override
  set clubRi(String value) => RealmObjectBase.set(this, 'clubRi', value);

  @override
  String get memberRi =>
      RealmObjectBase.get<String>(this, 'memberRi') as String;
  @override
  set memberRi(String value) => RealmObjectBase.set(this, 'memberRi', value);

  @override
  String get nickname =>
      RealmObjectBase.get<String>(this, 'nickname') as String;
  @override
  set nickname(String value) => RealmObjectBase.set(this, 'nickname', value);

  @override
  String get englishName =>
      RealmObjectBase.get<String>(this, 'englishName') as String;
  @override
  set englishName(String value) =>
      RealmObjectBase.set(this, 'englishName', value);

  @override
  String get memo => RealmObjectBase.get<String>(this, 'memo') as String;
  @override
  set memo(String value) => RealmObjectBase.set(this, 'memo', value);

  @override
  String get job => RealmObjectBase.get<String>(this, 'job') as String;
  @override
  set job(String value) => RealmObjectBase.set(this, 'job', value);

  @override
  DateTime? get time =>
      RealmObjectBase.get<DateTime>(this, 'time') as DateTime?;
  @override
  set time(DateTime? value) => RealmObjectBase.set(this, 'time', value);

  @override
  Stream<RealmObjectChanges<AccountRealmModel>> get changes =>
      RealmObjectBase.getChanges<AccountRealmModel>(this);

  @override
  Stream<RealmObjectChanges<AccountRealmModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<AccountRealmModel>(this, keyPaths);

  @override
  AccountRealmModel freeze() =>
      RealmObjectBase.freezeObject<AccountRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'cellphone': cellphone.toEJson(),
      'homeAddress': homeAddress.toEJson(),
      'homeAddressSub': homeAddressSub.toEJson(),
      'homeAddressZipCode': homeAddressZipCode.toEJson(),
      'grade': grade.toEJson(),
      'firstGrade': firstGrade.toEJson(),
      'secondGrade': secondGrade.toEJson(),
      'thirdGrade': thirdGrade.toEJson(),
      'fourthGrade': fourthGrade.toEJson(),
      'fifthGrade': fifthGrade.toEJson(),
      'android': android.toEJson(),
      'ios': ios.toEJson(),
      'hidden': hidden.toEJson(),
      'permission': permission.toEJson(),
      'active': active.toEJson(),
      'coordinate': coordinate.toEJson(),
      'email': email.toEJson(),
      'telephone': telephone.toEJson(),
      'faxNumber': faxNumber.toEJson(),
      'birthDate': birthDate.toEJson(),
      'workAddress': workAddress.toEJson(),
      'workAddressSub': workAddressSub.toEJson(),
      'workAddressZipCode': workAddressZipCode.toEJson(),
      'workName': workName.toEJson(),
      'workPositionName': workPositionName.toEJson(),
      'clubRi': clubRi.toEJson(),
      'memberRi': memberRi.toEJson(),
      'nickname': nickname.toEJson(),
      'englishName': englishName.toEJson(),
      'memo': memo.toEJson(),
      'job': job.toEJson(),
      'time': time.toEJson(),
    };
  }

  static EJsonValue _toEJson(AccountRealmModel value) => value.toEJson();
  static AccountRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'cellphone': EJsonValue cellphone,
        'homeAddress': EJsonValue homeAddress,
        'android': EJsonValue android,
        'ios': EJsonValue ios,
        'hidden': EJsonValue hidden,
        'permission': EJsonValue permission,
        'active': EJsonValue active,
        'email': EJsonValue email,
        'telephone': EJsonValue telephone,
        'faxNumber': EJsonValue faxNumber,
        'workAddress': EJsonValue workAddress,
        'workAddressZipCode': EJsonValue workAddressZipCode,
        'workName': EJsonValue workName,
        'workPositionName': EJsonValue workPositionName,
        'clubRi': EJsonValue clubRi,
        'memberRi': EJsonValue memberRi,
        'nickname': EJsonValue nickname,
        'englishName': EJsonValue englishName,
        'memo': EJsonValue memo,
        'job': EJsonValue job,
      } =>
        AccountRealmModel(
          fromEJson(id),
          fromEJson(name),
          fromEJson(cellphone),
          fromEJson(homeAddress),
          fromEJson(android),
          fromEJson(ios),
          fromEJson(hidden),
          fromEJson(permission),
          fromEJson(active),
          fromEJson(email),
          fromEJson(telephone),
          fromEJson(faxNumber),
          fromEJson(workAddress),
          fromEJson(workAddressZipCode),
          fromEJson(workName),
          fromEJson(workPositionName),
          fromEJson(clubRi),
          fromEJson(memberRi),
          fromEJson(nickname),
          fromEJson(englishName),
          fromEJson(memo),
          fromEJson(job),
          homeAddressSub: fromEJson(ejson['homeAddressSub']),
          homeAddressZipCode: fromEJson(ejson['homeAddressZipCode']),
          grade: fromEJson(ejson['grade']),
          firstGrade: fromEJson(ejson['firstGrade']),
          secondGrade: fromEJson(ejson['secondGrade']),
          thirdGrade: fromEJson(ejson['thirdGrade']),
          fourthGrade: fromEJson(ejson['fourthGrade']),
          fifthGrade: fromEJson(ejson['fifthGrade']),
          coordinate: fromEJson(ejson['coordinate']),
          birthDate: fromEJson(ejson['birthDate']),
          workAddressSub: fromEJson(ejson['workAddressSub']),
          time: fromEJson(ejson['time']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(AccountRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, AccountRealmModel, 'AccountRealmModel', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('cellphone', RealmPropertyType.string),
      SchemaProperty('homeAddress', RealmPropertyType.string),
      SchemaProperty('homeAddressSub', RealmPropertyType.string,
          optional: true),
      SchemaProperty('homeAddressZipCode', RealmPropertyType.string,
          optional: true),
      SchemaProperty('grade', RealmPropertyType.object,
          optional: true, linkTarget: 'GradeRealmModel'),
      SchemaProperty('firstGrade', RealmPropertyType.object,
          optional: true, linkTarget: 'GradeRealmModel'),
      SchemaProperty('secondGrade', RealmPropertyType.object,
          optional: true, linkTarget: 'GradeRealmModel'),
      SchemaProperty('thirdGrade', RealmPropertyType.object,
          optional: true, linkTarget: 'GradeRealmModel'),
      SchemaProperty('fourthGrade', RealmPropertyType.object,
          optional: true, linkTarget: 'GradeRealmModel'),
      SchemaProperty('fifthGrade', RealmPropertyType.object,
          optional: true, linkTarget: 'GradeRealmModel'),
      SchemaProperty('android', RealmPropertyType.bool),
      SchemaProperty('ios', RealmPropertyType.bool),
      SchemaProperty('hidden', RealmPropertyType.bool),
      SchemaProperty('permission', RealmPropertyType.bool),
      SchemaProperty('active', RealmPropertyType.bool),
      SchemaProperty('coordinate', RealmPropertyType.object,
          optional: true, linkTarget: 'CoordinateRealmModel'),
      SchemaProperty('email', RealmPropertyType.string),
      SchemaProperty('telephone', RealmPropertyType.string),
      SchemaProperty('faxNumber', RealmPropertyType.string),
      SchemaProperty('birthDate', RealmPropertyType.timestamp, optional: true),
      SchemaProperty('workAddress', RealmPropertyType.string),
      SchemaProperty('workAddressSub', RealmPropertyType.string,
          optional: true),
      SchemaProperty('workAddressZipCode', RealmPropertyType.string),
      SchemaProperty('workName', RealmPropertyType.string),
      SchemaProperty('workPositionName', RealmPropertyType.string),
      SchemaProperty('clubRi', RealmPropertyType.string),
      SchemaProperty('memberRi', RealmPropertyType.string),
      SchemaProperty('nickname', RealmPropertyType.string),
      SchemaProperty('englishName', RealmPropertyType.string),
      SchemaProperty('memo', RealmPropertyType.string),
      SchemaProperty('job', RealmPropertyType.string),
      SchemaProperty('time', RealmPropertyType.timestamp, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class CoordinateRealmModel extends _CoordinateRealmModel
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  CoordinateRealmModel(
    double lat,
    double lng,
  ) {
    RealmObjectBase.set(this, 'lat', lat);
    RealmObjectBase.set(this, 'lng', lng);
  }

  CoordinateRealmModel._();

  @override
  double get lat => RealmObjectBase.get<double>(this, 'lat') as double;
  @override
  set lat(double value) => RealmObjectBase.set(this, 'lat', value);

  @override
  double get lng => RealmObjectBase.get<double>(this, 'lng') as double;
  @override
  set lng(double value) => RealmObjectBase.set(this, 'lng', value);

  @override
  Stream<RealmObjectChanges<CoordinateRealmModel>> get changes =>
      RealmObjectBase.getChanges<CoordinateRealmModel>(this);

  @override
  Stream<RealmObjectChanges<CoordinateRealmModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CoordinateRealmModel>(this, keyPaths);

  @override
  CoordinateRealmModel freeze() =>
      RealmObjectBase.freezeObject<CoordinateRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'lat': lat.toEJson(),
      'lng': lng.toEJson(),
    };
  }

  static EJsonValue _toEJson(CoordinateRealmModel value) => value.toEJson();
  static CoordinateRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'lat': EJsonValue lat,
        'lng': EJsonValue lng,
      } =>
        CoordinateRealmModel(
          fromEJson(lat),
          fromEJson(lng),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CoordinateRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(ObjectType.embeddedObject, CoordinateRealmModel,
        'CoordinateRealmModel', [
      SchemaProperty('lat', RealmPropertyType.double),
      SchemaProperty('lng', RealmPropertyType.double),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class GradeRealmModel extends _GradeRealmModel
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  GradeRealmModel(
    int id,
    String name,
    String positionName,
    bool active, {
    int? order,
    int? groupOrder,
  }) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'positionName', positionName);
    RealmObjectBase.set(this, 'order', order);
    RealmObjectBase.set(this, 'groupOrder', groupOrder);
    RealmObjectBase.set(this, 'active', active);
  }

  GradeRealmModel._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get positionName =>
      RealmObjectBase.get<String>(this, 'positionName') as String;
  @override
  set positionName(String value) =>
      RealmObjectBase.set(this, 'positionName', value);

  @override
  int? get order => RealmObjectBase.get<int>(this, 'order') as int?;
  @override
  set order(int? value) => RealmObjectBase.set(this, 'order', value);

  @override
  int? get groupOrder => RealmObjectBase.get<int>(this, 'groupOrder') as int?;
  @override
  set groupOrder(int? value) => RealmObjectBase.set(this, 'groupOrder', value);

  @override
  bool get active => RealmObjectBase.get<bool>(this, 'active') as bool;
  @override
  set active(bool value) => RealmObjectBase.set(this, 'active', value);

  @override
  Stream<RealmObjectChanges<GradeRealmModel>> get changes =>
      RealmObjectBase.getChanges<GradeRealmModel>(this);

  @override
  Stream<RealmObjectChanges<GradeRealmModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<GradeRealmModel>(this, keyPaths);

  @override
  GradeRealmModel freeze() =>
      RealmObjectBase.freezeObject<GradeRealmModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'id': id.toEJson(),
      'name': name.toEJson(),
      'positionName': positionName.toEJson(),
      'order': order.toEJson(),
      'groupOrder': groupOrder.toEJson(),
      'active': active.toEJson(),
    };
  }

  static EJsonValue _toEJson(GradeRealmModel value) => value.toEJson();
  static GradeRealmModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'id': EJsonValue id,
        'name': EJsonValue name,
        'positionName': EJsonValue positionName,
        'active': EJsonValue active,
      } =>
        GradeRealmModel(
          fromEJson(id),
          fromEJson(name),
          fromEJson(positionName),
          fromEJson(active),
          order: fromEJson(ejson['order']),
          groupOrder: fromEJson(ejson['groupOrder']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(GradeRealmModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.embeddedObject, GradeRealmModel, 'GradeRealmModel', [
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('positionName', RealmPropertyType.string),
      SchemaProperty('order', RealmPropertyType.int, optional: true),
      SchemaProperty('groupOrder', RealmPropertyType.int, optional: true),
      SchemaProperty('active', RealmPropertyType.bool),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
