// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountEntity {
  int get id;
  String get name;
  String get cellphone;
  String get homeAddress;
  String get homeAddressSub;
  String get homeAddressZipCode;
  GradeEntity? get grade;
  GradeEntity? get firstGrade;
  GradeEntity? get secondGrade;
  GradeEntity? get thirdGrade;
  GradeEntity? get fourthGrade;
  GradeEntity? get fifthGrade;
  bool get android;
  bool get ios;
  bool get hidden;
  bool get permission;
  bool get active;
  bool get isFavorite;
  CoordinateEntity? get coordinate;
  String get email;
  String get telephone;
  String get faxNumber;
  DateTime? get birthDate;
  String get workAddress;
  String get workAddressSub;
  String get workAddressZipCode;
  String get workName;
  String get workPositionName;
  String get clubRi;
  String get memberRi;
  String get nickname;
  String get englishName;
  String get memo;
  String get job;
  DateTime? get time;

  /// Create a copy of AccountEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountEntityCopyWith<AccountEntity> get copyWith =>
      _$AccountEntityCopyWithImpl<AccountEntity>(
          this as AccountEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AccountEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cellphone, cellphone) ||
                other.cellphone == cellphone) &&
            (identical(other.homeAddress, homeAddress) ||
                other.homeAddress == homeAddress) &&
            (identical(other.homeAddressSub, homeAddressSub) ||
                other.homeAddressSub == homeAddressSub) &&
            (identical(other.homeAddressZipCode, homeAddressZipCode) ||
                other.homeAddressZipCode == homeAddressZipCode) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.firstGrade, firstGrade) ||
                other.firstGrade == firstGrade) &&
            (identical(other.secondGrade, secondGrade) ||
                other.secondGrade == secondGrade) &&
            (identical(other.thirdGrade, thirdGrade) ||
                other.thirdGrade == thirdGrade) &&
            (identical(other.fourthGrade, fourthGrade) ||
                other.fourthGrade == fourthGrade) &&
            (identical(other.fifthGrade, fifthGrade) ||
                other.fifthGrade == fifthGrade) &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.faxNumber, faxNumber) ||
                other.faxNumber == faxNumber) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.workAddress, workAddress) ||
                other.workAddress == workAddress) &&
            (identical(other.workAddressSub, workAddressSub) ||
                other.workAddressSub == workAddressSub) &&
            (identical(other.workAddressZipCode, workAddressZipCode) ||
                other.workAddressZipCode == workAddressZipCode) &&
            (identical(other.workName, workName) ||
                other.workName == workName) &&
            (identical(other.workPositionName, workPositionName) ||
                other.workPositionName == workPositionName) &&
            (identical(other.clubRi, clubRi) || other.clubRi == clubRi) &&
            (identical(other.memberRi, memberRi) ||
                other.memberRi == memberRi) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        cellphone,
        homeAddress,
        homeAddressSub,
        homeAddressZipCode,
        grade,
        firstGrade,
        secondGrade,
        thirdGrade,
        fourthGrade,
        fifthGrade,
        android,
        ios,
        hidden,
        permission,
        active,
        isFavorite,
        coordinate,
        email,
        telephone,
        faxNumber,
        birthDate,
        workAddress,
        workAddressSub,
        workAddressZipCode,
        workName,
        workPositionName,
        clubRi,
        memberRi,
        nickname,
        englishName,
        memo,
        job,
        time
      ]);

  @override
  String toString() {
    return 'AccountEntity(id: $id, name: $name, cellphone: $cellphone, homeAddress: $homeAddress, homeAddressSub: $homeAddressSub, homeAddressZipCode: $homeAddressZipCode, grade: $grade, firstGrade: $firstGrade, secondGrade: $secondGrade, thirdGrade: $thirdGrade, fourthGrade: $fourthGrade, fifthGrade: $fifthGrade, android: $android, ios: $ios, hidden: $hidden, permission: $permission, active: $active, isFavorite: $isFavorite, coordinate: $coordinate, email: $email, telephone: $telephone, faxNumber: $faxNumber, birthDate: $birthDate, workAddress: $workAddress, workAddressSub: $workAddressSub, workAddressZipCode: $workAddressZipCode, workName: $workName, workPositionName: $workPositionName, clubRi: $clubRi, memberRi: $memberRi, nickname: $nickname, englishName: $englishName, memo: $memo, job: $job, time: $time)';
  }
}

/// @nodoc
abstract mixin class $AccountEntityCopyWith<$Res> {
  factory $AccountEntityCopyWith(
          AccountEntity value, $Res Function(AccountEntity) _then) =
      _$AccountEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String cellphone,
      String homeAddress,
      String homeAddressSub,
      String homeAddressZipCode,
      GradeEntity? grade,
      GradeEntity? firstGrade,
      GradeEntity? secondGrade,
      GradeEntity? thirdGrade,
      GradeEntity? fourthGrade,
      GradeEntity? fifthGrade,
      bool android,
      bool ios,
      bool hidden,
      bool permission,
      bool active,
      bool isFavorite,
      CoordinateEntity? coordinate,
      String email,
      String telephone,
      String faxNumber,
      DateTime? birthDate,
      String workAddress,
      String workAddressSub,
      String workAddressZipCode,
      String workName,
      String workPositionName,
      String clubRi,
      String memberRi,
      String nickname,
      String englishName,
      String memo,
      String job,
      DateTime? time});
}

/// @nodoc
class _$AccountEntityCopyWithImpl<$Res>
    implements $AccountEntityCopyWith<$Res> {
  _$AccountEntityCopyWithImpl(this._self, this._then);

  final AccountEntity _self;
  final $Res Function(AccountEntity) _then;

  /// Create a copy of AccountEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cellphone = null,
    Object? homeAddress = null,
    Object? homeAddressSub = null,
    Object? homeAddressZipCode = null,
    Object? grade = freezed,
    Object? firstGrade = freezed,
    Object? secondGrade = freezed,
    Object? thirdGrade = freezed,
    Object? fourthGrade = freezed,
    Object? fifthGrade = freezed,
    Object? android = null,
    Object? ios = null,
    Object? hidden = null,
    Object? permission = null,
    Object? active = null,
    Object? isFavorite = null,
    Object? coordinate = freezed,
    Object? email = null,
    Object? telephone = null,
    Object? faxNumber = null,
    Object? birthDate = freezed,
    Object? workAddress = null,
    Object? workAddressSub = null,
    Object? workAddressZipCode = null,
    Object? workName = null,
    Object? workPositionName = null,
    Object? clubRi = null,
    Object? memberRi = null,
    Object? nickname = null,
    Object? englishName = null,
    Object? memo = null,
    Object? job = null,
    Object? time = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cellphone: null == cellphone
          ? _self.cellphone
          : cellphone // ignore: cast_nullable_to_non_nullable
              as String,
      homeAddress: null == homeAddress
          ? _self.homeAddress
          : homeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      homeAddressSub: null == homeAddressSub
          ? _self.homeAddressSub
          : homeAddressSub // ignore: cast_nullable_to_non_nullable
              as String,
      homeAddressZipCode: null == homeAddressZipCode
          ? _self.homeAddressZipCode
          : homeAddressZipCode // ignore: cast_nullable_to_non_nullable
              as String,
      grade: freezed == grade
          ? _self.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      firstGrade: freezed == firstGrade
          ? _self.firstGrade
          : firstGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      secondGrade: freezed == secondGrade
          ? _self.secondGrade
          : secondGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      thirdGrade: freezed == thirdGrade
          ? _self.thirdGrade
          : thirdGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      fourthGrade: freezed == fourthGrade
          ? _self.fourthGrade
          : fourthGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      fifthGrade: freezed == fifthGrade
          ? _self.fifthGrade
          : fifthGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      android: null == android
          ? _self.android
          : android // ignore: cast_nullable_to_non_nullable
              as bool,
      ios: null == ios
          ? _self.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as bool,
      hidden: null == hidden
          ? _self.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      coordinate: freezed == coordinate
          ? _self.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as CoordinateEntity?,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _self.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      faxNumber: null == faxNumber
          ? _self.faxNumber
          : faxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workAddress: null == workAddress
          ? _self.workAddress
          : workAddress // ignore: cast_nullable_to_non_nullable
              as String,
      workAddressSub: null == workAddressSub
          ? _self.workAddressSub
          : workAddressSub // ignore: cast_nullable_to_non_nullable
              as String,
      workAddressZipCode: null == workAddressZipCode
          ? _self.workAddressZipCode
          : workAddressZipCode // ignore: cast_nullable_to_non_nullable
              as String,
      workName: null == workName
          ? _self.workName
          : workName // ignore: cast_nullable_to_non_nullable
              as String,
      workPositionName: null == workPositionName
          ? _self.workPositionName
          : workPositionName // ignore: cast_nullable_to_non_nullable
              as String,
      clubRi: null == clubRi
          ? _self.clubRi
          : clubRi // ignore: cast_nullable_to_non_nullable
              as String,
      memberRi: null == memberRi
          ? _self.memberRi
          : memberRi // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _self.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _self.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _self.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _AccountEntity implements AccountEntity {
  const _AccountEntity(
      {required this.id,
      required this.name,
      required this.cellphone,
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
      required this.hidden,
      required this.permission,
      required this.active,
      required this.isFavorite,
      required this.coordinate,
      required this.email,
      required this.telephone,
      required this.faxNumber,
      required this.birthDate,
      required this.workAddress,
      required this.workAddressSub,
      required this.workAddressZipCode,
      required this.workName,
      required this.workPositionName,
      required this.clubRi,
      required this.memberRi,
      required this.nickname,
      required this.englishName,
      required this.memo,
      required this.job,
      required this.time});

  @override
  final int id;
  @override
  final String name;
  @override
  final String cellphone;
  @override
  final String homeAddress;
  @override
  final String homeAddressSub;
  @override
  final String homeAddressZipCode;
  @override
  final GradeEntity? grade;
  @override
  final GradeEntity? firstGrade;
  @override
  final GradeEntity? secondGrade;
  @override
  final GradeEntity? thirdGrade;
  @override
  final GradeEntity? fourthGrade;
  @override
  final GradeEntity? fifthGrade;
  @override
  final bool android;
  @override
  final bool ios;
  @override
  final bool hidden;
  @override
  final bool permission;
  @override
  final bool active;
  @override
  final bool isFavorite;
  @override
  final CoordinateEntity? coordinate;
  @override
  final String email;
  @override
  final String telephone;
  @override
  final String faxNumber;
  @override
  final DateTime? birthDate;
  @override
  final String workAddress;
  @override
  final String workAddressSub;
  @override
  final String workAddressZipCode;
  @override
  final String workName;
  @override
  final String workPositionName;
  @override
  final String clubRi;
  @override
  final String memberRi;
  @override
  final String nickname;
  @override
  final String englishName;
  @override
  final String memo;
  @override
  final String job;
  @override
  final DateTime? time;

  /// Create a copy of AccountEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountEntityCopyWith<_AccountEntity> get copyWith =>
      __$AccountEntityCopyWithImpl<_AccountEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AccountEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.cellphone, cellphone) ||
                other.cellphone == cellphone) &&
            (identical(other.homeAddress, homeAddress) ||
                other.homeAddress == homeAddress) &&
            (identical(other.homeAddressSub, homeAddressSub) ||
                other.homeAddressSub == homeAddressSub) &&
            (identical(other.homeAddressZipCode, homeAddressZipCode) ||
                other.homeAddressZipCode == homeAddressZipCode) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.firstGrade, firstGrade) ||
                other.firstGrade == firstGrade) &&
            (identical(other.secondGrade, secondGrade) ||
                other.secondGrade == secondGrade) &&
            (identical(other.thirdGrade, thirdGrade) ||
                other.thirdGrade == thirdGrade) &&
            (identical(other.fourthGrade, fourthGrade) ||
                other.fourthGrade == fourthGrade) &&
            (identical(other.fifthGrade, fifthGrade) ||
                other.fifthGrade == fifthGrade) &&
            (identical(other.android, android) || other.android == android) &&
            (identical(other.ios, ios) || other.ios == ios) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.faxNumber, faxNumber) ||
                other.faxNumber == faxNumber) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.workAddress, workAddress) ||
                other.workAddress == workAddress) &&
            (identical(other.workAddressSub, workAddressSub) ||
                other.workAddressSub == workAddressSub) &&
            (identical(other.workAddressZipCode, workAddressZipCode) ||
                other.workAddressZipCode == workAddressZipCode) &&
            (identical(other.workName, workName) ||
                other.workName == workName) &&
            (identical(other.workPositionName, workPositionName) ||
                other.workPositionName == workPositionName) &&
            (identical(other.clubRi, clubRi) || other.clubRi == clubRi) &&
            (identical(other.memberRi, memberRi) ||
                other.memberRi == memberRi) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.englishName, englishName) ||
                other.englishName == englishName) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.time, time) || other.time == time));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        cellphone,
        homeAddress,
        homeAddressSub,
        homeAddressZipCode,
        grade,
        firstGrade,
        secondGrade,
        thirdGrade,
        fourthGrade,
        fifthGrade,
        android,
        ios,
        hidden,
        permission,
        active,
        isFavorite,
        coordinate,
        email,
        telephone,
        faxNumber,
        birthDate,
        workAddress,
        workAddressSub,
        workAddressZipCode,
        workName,
        workPositionName,
        clubRi,
        memberRi,
        nickname,
        englishName,
        memo,
        job,
        time
      ]);

  @override
  String toString() {
    return 'AccountEntity(id: $id, name: $name, cellphone: $cellphone, homeAddress: $homeAddress, homeAddressSub: $homeAddressSub, homeAddressZipCode: $homeAddressZipCode, grade: $grade, firstGrade: $firstGrade, secondGrade: $secondGrade, thirdGrade: $thirdGrade, fourthGrade: $fourthGrade, fifthGrade: $fifthGrade, android: $android, ios: $ios, hidden: $hidden, permission: $permission, active: $active, isFavorite: $isFavorite, coordinate: $coordinate, email: $email, telephone: $telephone, faxNumber: $faxNumber, birthDate: $birthDate, workAddress: $workAddress, workAddressSub: $workAddressSub, workAddressZipCode: $workAddressZipCode, workName: $workName, workPositionName: $workPositionName, clubRi: $clubRi, memberRi: $memberRi, nickname: $nickname, englishName: $englishName, memo: $memo, job: $job, time: $time)';
  }
}

/// @nodoc
abstract mixin class _$AccountEntityCopyWith<$Res>
    implements $AccountEntityCopyWith<$Res> {
  factory _$AccountEntityCopyWith(
          _AccountEntity value, $Res Function(_AccountEntity) _then) =
      __$AccountEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String cellphone,
      String homeAddress,
      String homeAddressSub,
      String homeAddressZipCode,
      GradeEntity? grade,
      GradeEntity? firstGrade,
      GradeEntity? secondGrade,
      GradeEntity? thirdGrade,
      GradeEntity? fourthGrade,
      GradeEntity? fifthGrade,
      bool android,
      bool ios,
      bool hidden,
      bool permission,
      bool active,
      bool isFavorite,
      CoordinateEntity? coordinate,
      String email,
      String telephone,
      String faxNumber,
      DateTime? birthDate,
      String workAddress,
      String workAddressSub,
      String workAddressZipCode,
      String workName,
      String workPositionName,
      String clubRi,
      String memberRi,
      String nickname,
      String englishName,
      String memo,
      String job,
      DateTime? time});
}

/// @nodoc
class __$AccountEntityCopyWithImpl<$Res>
    implements _$AccountEntityCopyWith<$Res> {
  __$AccountEntityCopyWithImpl(this._self, this._then);

  final _AccountEntity _self;
  final $Res Function(_AccountEntity) _then;

  /// Create a copy of AccountEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? cellphone = null,
    Object? homeAddress = null,
    Object? homeAddressSub = null,
    Object? homeAddressZipCode = null,
    Object? grade = freezed,
    Object? firstGrade = freezed,
    Object? secondGrade = freezed,
    Object? thirdGrade = freezed,
    Object? fourthGrade = freezed,
    Object? fifthGrade = freezed,
    Object? android = null,
    Object? ios = null,
    Object? hidden = null,
    Object? permission = null,
    Object? active = null,
    Object? isFavorite = null,
    Object? coordinate = freezed,
    Object? email = null,
    Object? telephone = null,
    Object? faxNumber = null,
    Object? birthDate = freezed,
    Object? workAddress = null,
    Object? workAddressSub = null,
    Object? workAddressZipCode = null,
    Object? workName = null,
    Object? workPositionName = null,
    Object? clubRi = null,
    Object? memberRi = null,
    Object? nickname = null,
    Object? englishName = null,
    Object? memo = null,
    Object? job = null,
    Object? time = freezed,
  }) {
    return _then(_AccountEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cellphone: null == cellphone
          ? _self.cellphone
          : cellphone // ignore: cast_nullable_to_non_nullable
              as String,
      homeAddress: null == homeAddress
          ? _self.homeAddress
          : homeAddress // ignore: cast_nullable_to_non_nullable
              as String,
      homeAddressSub: null == homeAddressSub
          ? _self.homeAddressSub
          : homeAddressSub // ignore: cast_nullable_to_non_nullable
              as String,
      homeAddressZipCode: null == homeAddressZipCode
          ? _self.homeAddressZipCode
          : homeAddressZipCode // ignore: cast_nullable_to_non_nullable
              as String,
      grade: freezed == grade
          ? _self.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      firstGrade: freezed == firstGrade
          ? _self.firstGrade
          : firstGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      secondGrade: freezed == secondGrade
          ? _self.secondGrade
          : secondGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      thirdGrade: freezed == thirdGrade
          ? _self.thirdGrade
          : thirdGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      fourthGrade: freezed == fourthGrade
          ? _self.fourthGrade
          : fourthGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      fifthGrade: freezed == fifthGrade
          ? _self.fifthGrade
          : fifthGrade // ignore: cast_nullable_to_non_nullable
              as GradeEntity?,
      android: null == android
          ? _self.android
          : android // ignore: cast_nullable_to_non_nullable
              as bool,
      ios: null == ios
          ? _self.ios
          : ios // ignore: cast_nullable_to_non_nullable
              as bool,
      hidden: null == hidden
          ? _self.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      coordinate: freezed == coordinate
          ? _self.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as CoordinateEntity?,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      telephone: null == telephone
          ? _self.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as String,
      faxNumber: null == faxNumber
          ? _self.faxNumber
          : faxNumber // ignore: cast_nullable_to_non_nullable
              as String,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      workAddress: null == workAddress
          ? _self.workAddress
          : workAddress // ignore: cast_nullable_to_non_nullable
              as String,
      workAddressSub: null == workAddressSub
          ? _self.workAddressSub
          : workAddressSub // ignore: cast_nullable_to_non_nullable
              as String,
      workAddressZipCode: null == workAddressZipCode
          ? _self.workAddressZipCode
          : workAddressZipCode // ignore: cast_nullable_to_non_nullable
              as String,
      workName: null == workName
          ? _self.workName
          : workName // ignore: cast_nullable_to_non_nullable
              as String,
      workPositionName: null == workPositionName
          ? _self.workPositionName
          : workPositionName // ignore: cast_nullable_to_non_nullable
              as String,
      clubRi: null == clubRi
          ? _self.clubRi
          : clubRi // ignore: cast_nullable_to_non_nullable
              as String,
      memberRi: null == memberRi
          ? _self.memberRi
          : memberRi // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      englishName: null == englishName
          ? _self.englishName
          : englishName // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _self.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _self.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
