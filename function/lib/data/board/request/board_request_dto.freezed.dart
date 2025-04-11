// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_request_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoardRequestDto {
  String? get name;
  String? get type;
  String? get content;

  /// Create a copy of BoardRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BoardRequestDtoCopyWith<BoardRequestDto> get copyWith =>
      _$BoardRequestDtoCopyWithImpl<BoardRequestDto>(
          this as BoardRequestDto, _$identity);

  /// Serializes this BoardRequestDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoardRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, content);

  @override
  String toString() {
    return 'BoardRequestDto(name: $name, type: $type, content: $content)';
  }
}

/// @nodoc
abstract mixin class $BoardRequestDtoCopyWith<$Res> {
  factory $BoardRequestDtoCopyWith(
          BoardRequestDto value, $Res Function(BoardRequestDto) _then) =
      _$BoardRequestDtoCopyWithImpl;
  @useResult
  $Res call({String? name, String? type, String? content});
}

/// @nodoc
class _$BoardRequestDtoCopyWithImpl<$Res>
    implements $BoardRequestDtoCopyWith<$Res> {
  _$BoardRequestDtoCopyWithImpl(this._self, this._then);

  final BoardRequestDto _self;
  final $Res Function(BoardRequestDto) _then;

  /// Create a copy of BoardRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? content = freezed,
  }) {
    return _then(_self.copyWith(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BoardRequestDto implements BoardRequestDto {
  _BoardRequestDto({this.name, this.type, this.content});
  factory _BoardRequestDto.fromJson(Map<String, dynamic> json) =>
      _$BoardRequestDtoFromJson(json);

  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? content;

  /// Create a copy of BoardRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BoardRequestDtoCopyWith<_BoardRequestDto> get copyWith =>
      __$BoardRequestDtoCopyWithImpl<_BoardRequestDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BoardRequestDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BoardRequestDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, type, content);

  @override
  String toString() {
    return 'BoardRequestDto(name: $name, type: $type, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$BoardRequestDtoCopyWith<$Res>
    implements $BoardRequestDtoCopyWith<$Res> {
  factory _$BoardRequestDtoCopyWith(
          _BoardRequestDto value, $Res Function(_BoardRequestDto) _then) =
      __$BoardRequestDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String? name, String? type, String? content});
}

/// @nodoc
class __$BoardRequestDtoCopyWithImpl<$Res>
    implements _$BoardRequestDtoCopyWith<$Res> {
  __$BoardRequestDtoCopyWithImpl(this._self, this._then);

  final _BoardRequestDto _self;
  final $Res Function(_BoardRequestDto) _then;

  /// Create a copy of BoardRequestDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = freezed,
    Object? type = freezed,
    Object? content = freezed,
  }) {
    return _then(_BoardRequestDto(
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
