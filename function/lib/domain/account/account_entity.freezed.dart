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
  String get email;
  GradeEntity? get grade;
  GradeEntity? get firstGrade;
  GradeEntity? get secondGrade;
  GradeEntity? get thirdGrade;
  GradeEntity? get fourthGrade;
  bool get isFavorite;
  bool get permission;
  String get cellphone;
  String get homeAddress;
  String get homeAddressSub;
  String get workName;
  String get workPositionName;
  String get workCellphone;
  String get workAddress;
  String get workAddressSub;
  bool get hidden;
  bool get active;
  String get job;
  List<UriEntity>? get profileImage;
  CoordinateEntity? get coordinate;
  DateTime? get birthDate;
  int get point;
  int get gender;

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
            (identical(other.email, email) || other.email == email) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.firstGrade, firstGrade) ||
                other.firstGrade == firstGrade) &&
            (identical(other.secondGrade, secondGrade) ||
                other.secondGrade == secondGrade) &&
            (identical(other.thirdGrade, thirdGrade) ||
                other.thirdGrade == thirdGrade) &&
            (identical(other.fourthGrade, fourthGrade) ||
                other.fourthGrade == fourthGrade) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.cellphone, cellphone) ||
                other.cellphone == cellphone) &&
            (identical(other.homeAddress, homeAddress) ||
                other.homeAddress == homeAddress) &&
            (identical(other.homeAddressSub, homeAddressSub) ||
                other.homeAddressSub == homeAddressSub) &&
            (identical(other.workName, workName) ||
                other.workName == workName) &&
            (identical(other.workPositionName, workPositionName) ||
                other.workPositionName == workPositionName) &&
            (identical(other.workCellphone, workCellphone) ||
                other.workCellphone == workCellphone) &&
            (identical(other.workAddress, workAddress) ||
                other.workAddress == workAddress) &&
            (identical(other.workAddressSub, workAddressSub) ||
                other.workAddressSub == workAddressSub) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.job, job) || other.job == job) &&
            const DeepCollectionEquality()
                .equals(other.profileImage, profileImage) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        grade,
        firstGrade,
        secondGrade,
        thirdGrade,
        fourthGrade,
        isFavorite,
        permission,
        cellphone,
        homeAddress,
        homeAddressSub,
        workName,
        workPositionName,
        workCellphone,
        workAddress,
        workAddressSub,
        hidden,
        active,
        job,
        const DeepCollectionEquality().hash(profileImage),
        coordinate,
        birthDate,
        point,
        gender
      ]);

  @override
  String toString() {
    return 'AccountEntity(id: $id, name: $name, email: $email, grade: $grade, firstGrade: $firstGrade, secondGrade: $secondGrade, thirdGrade: $thirdGrade, fourthGrade: $fourthGrade, isFavorite: $isFavorite, permission: $permission, cellphone: $cellphone, homeAddress: $homeAddress, homeAddressSub: $homeAddressSub, workName: $workName, workPositionName: $workPositionName, workCellphone: $workCellphone, workAddress: $workAddress, workAddressSub: $workAddressSub, hidden: $hidden, active: $active, job: $job, profileImage: $profileImage, coordinate: $coordinate, birthDate: $birthDate, point: $point, gender: $gender)';
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
      String email,
      GradeEntity? grade,
      GradeEntity? firstGrade,
      GradeEntity? secondGrade,
      GradeEntity? thirdGrade,
      GradeEntity? fourthGrade,
      bool isFavorite,
      bool permission,
      String cellphone,
      String homeAddress,
      String homeAddressSub,
      String workName,
      String workPositionName,
      String workCellphone,
      String workAddress,
      String workAddressSub,
      bool hidden,
      bool active,
      String job,
      List<UriEntity>? profileImage,
      CoordinateEntity? coordinate,
      DateTime? birthDate,
      int point,
      int gender});
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
    Object? email = null,
    Object? grade = freezed,
    Object? firstGrade = freezed,
    Object? secondGrade = freezed,
    Object? thirdGrade = freezed,
    Object? fourthGrade = freezed,
    Object? isFavorite = null,
    Object? permission = null,
    Object? cellphone = null,
    Object? homeAddress = null,
    Object? homeAddressSub = null,
    Object? workName = null,
    Object? workPositionName = null,
    Object? workCellphone = null,
    Object? workAddress = null,
    Object? workAddressSub = null,
    Object? hidden = null,
    Object? active = null,
    Object? job = null,
    Object? profileImage = freezed,
    Object? coordinate = freezed,
    Object? birthDate = freezed,
    Object? point = null,
    Object? gender = null,
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
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
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
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as bool,
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
      workName: null == workName
          ? _self.workName
          : workName // ignore: cast_nullable_to_non_nullable
              as String,
      workPositionName: null == workPositionName
          ? _self.workPositionName
          : workPositionName // ignore: cast_nullable_to_non_nullable
              as String,
      workCellphone: null == workCellphone
          ? _self.workCellphone
          : workCellphone // ignore: cast_nullable_to_non_nullable
              as String,
      workAddress: null == workAddress
          ? _self.workAddress
          : workAddress // ignore: cast_nullable_to_non_nullable
              as String,
      workAddressSub: null == workAddressSub
          ? _self.workAddressSub
          : workAddressSub // ignore: cast_nullable_to_non_nullable
              as String,
      hidden: null == hidden
          ? _self.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      job: null == job
          ? _self.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as List<UriEntity>?,
      coordinate: freezed == coordinate
          ? _self.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as CoordinateEntity?,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _AccountEntity implements AccountEntity {
  const _AccountEntity(
      {required this.id,
      required this.name,
      required this.email,
      this.grade,
      this.firstGrade,
      this.secondGrade,
      this.thirdGrade,
      this.fourthGrade,
      this.isFavorite = false,
      this.permission = false,
      required this.cellphone,
      required this.homeAddress,
      required this.homeAddressSub,
      required this.workName,
      required this.workPositionName,
      required this.workCellphone,
      required this.workAddress,
      required this.workAddressSub,
      required this.hidden,
      required this.active,
      required this.job,
      final List<UriEntity>? profileImage,
      this.coordinate,
      required this.birthDate,
      required this.point,
      required this.gender})
      : _profileImage = profileImage;

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
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
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final bool permission;
  @override
  final String cellphone;
  @override
  final String homeAddress;
  @override
  final String homeAddressSub;
  @override
  final String workName;
  @override
  final String workPositionName;
  @override
  final String workCellphone;
  @override
  final String workAddress;
  @override
  final String workAddressSub;
  @override
  final bool hidden;
  @override
  final bool active;
  @override
  final String job;
  final List<UriEntity>? _profileImage;
  @override
  List<UriEntity>? get profileImage {
    final value = _profileImage;
    if (value == null) return null;
    if (_profileImage is EqualUnmodifiableListView) return _profileImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final CoordinateEntity? coordinate;
  @override
  final DateTime? birthDate;
  @override
  final int point;
  @override
  final int gender;

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
            (identical(other.email, email) || other.email == email) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.firstGrade, firstGrade) ||
                other.firstGrade == firstGrade) &&
            (identical(other.secondGrade, secondGrade) ||
                other.secondGrade == secondGrade) &&
            (identical(other.thirdGrade, thirdGrade) ||
                other.thirdGrade == thirdGrade) &&
            (identical(other.fourthGrade, fourthGrade) ||
                other.fourthGrade == fourthGrade) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.cellphone, cellphone) ||
                other.cellphone == cellphone) &&
            (identical(other.homeAddress, homeAddress) ||
                other.homeAddress == homeAddress) &&
            (identical(other.homeAddressSub, homeAddressSub) ||
                other.homeAddressSub == homeAddressSub) &&
            (identical(other.workName, workName) ||
                other.workName == workName) &&
            (identical(other.workPositionName, workPositionName) ||
                other.workPositionName == workPositionName) &&
            (identical(other.workCellphone, workCellphone) ||
                other.workCellphone == workCellphone) &&
            (identical(other.workAddress, workAddress) ||
                other.workAddress == workAddress) &&
            (identical(other.workAddressSub, workAddressSub) ||
                other.workAddressSub == workAddressSub) &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.job, job) || other.job == job) &&
            const DeepCollectionEquality()
                .equals(other._profileImage, _profileImage) &&
            (identical(other.coordinate, coordinate) ||
                other.coordinate == coordinate) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        email,
        grade,
        firstGrade,
        secondGrade,
        thirdGrade,
        fourthGrade,
        isFavorite,
        permission,
        cellphone,
        homeAddress,
        homeAddressSub,
        workName,
        workPositionName,
        workCellphone,
        workAddress,
        workAddressSub,
        hidden,
        active,
        job,
        const DeepCollectionEquality().hash(_profileImage),
        coordinate,
        birthDate,
        point,
        gender
      ]);

  @override
  String toString() {
    return 'AccountEntity(id: $id, name: $name, email: $email, grade: $grade, firstGrade: $firstGrade, secondGrade: $secondGrade, thirdGrade: $thirdGrade, fourthGrade: $fourthGrade, isFavorite: $isFavorite, permission: $permission, cellphone: $cellphone, homeAddress: $homeAddress, homeAddressSub: $homeAddressSub, workName: $workName, workPositionName: $workPositionName, workCellphone: $workCellphone, workAddress: $workAddress, workAddressSub: $workAddressSub, hidden: $hidden, active: $active, job: $job, profileImage: $profileImage, coordinate: $coordinate, birthDate: $birthDate, point: $point, gender: $gender)';
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
      String email,
      GradeEntity? grade,
      GradeEntity? firstGrade,
      GradeEntity? secondGrade,
      GradeEntity? thirdGrade,
      GradeEntity? fourthGrade,
      bool isFavorite,
      bool permission,
      String cellphone,
      String homeAddress,
      String homeAddressSub,
      String workName,
      String workPositionName,
      String workCellphone,
      String workAddress,
      String workAddressSub,
      bool hidden,
      bool active,
      String job,
      List<UriEntity>? profileImage,
      CoordinateEntity? coordinate,
      DateTime? birthDate,
      int point,
      int gender});
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
    Object? email = null,
    Object? grade = freezed,
    Object? firstGrade = freezed,
    Object? secondGrade = freezed,
    Object? thirdGrade = freezed,
    Object? fourthGrade = freezed,
    Object? isFavorite = null,
    Object? permission = null,
    Object? cellphone = null,
    Object? homeAddress = null,
    Object? homeAddressSub = null,
    Object? workName = null,
    Object? workPositionName = null,
    Object? workCellphone = null,
    Object? workAddress = null,
    Object? workAddressSub = null,
    Object? hidden = null,
    Object? active = null,
    Object? job = null,
    Object? profileImage = freezed,
    Object? coordinate = freezed,
    Object? birthDate = freezed,
    Object? point = null,
    Object? gender = null,
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
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
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
      isFavorite: null == isFavorite
          ? _self.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      permission: null == permission
          ? _self.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as bool,
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
      workName: null == workName
          ? _self.workName
          : workName // ignore: cast_nullable_to_non_nullable
              as String,
      workPositionName: null == workPositionName
          ? _self.workPositionName
          : workPositionName // ignore: cast_nullable_to_non_nullable
              as String,
      workCellphone: null == workCellphone
          ? _self.workCellphone
          : workCellphone // ignore: cast_nullable_to_non_nullable
              as String,
      workAddress: null == workAddress
          ? _self.workAddress
          : workAddress // ignore: cast_nullable_to_non_nullable
              as String,
      workAddressSub: null == workAddressSub
          ? _self.workAddressSub
          : workAddressSub // ignore: cast_nullable_to_non_nullable
              as String,
      hidden: null == hidden
          ? _self.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      job: null == job
          ? _self.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: freezed == profileImage
          ? _self._profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as List<UriEntity>?,
      coordinate: freezed == coordinate
          ? _self.coordinate
          : coordinate // ignore: cast_nullable_to_non_nullable
              as CoordinateEntity?,
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      point: null == point
          ? _self.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
