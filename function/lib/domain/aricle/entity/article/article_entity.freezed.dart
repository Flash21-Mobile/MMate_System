// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleEntity {
  int get id;
  BoardEntity get board;
  String get title;
  String get content;
  DateTime? get time;
  int get viewCnt;
  AccountEntity get account;

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ArticleEntityCopyWith<ArticleEntity> get copyWith =>
      _$ArticleEntityCopyWithImpl<ArticleEntity>(
          this as ArticleEntity, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ArticleEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.viewCnt, viewCnt) || other.viewCnt == viewCnt) &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, board, title, content, time, viewCnt, account);

  @override
  String toString() {
    return 'ArticleEntity(id: $id, board: $board, title: $title, content: $content, time: $time, viewCnt: $viewCnt, account: $account)';
  }
}

/// @nodoc
abstract mixin class $ArticleEntityCopyWith<$Res> {
  factory $ArticleEntityCopyWith(
          ArticleEntity value, $Res Function(ArticleEntity) _then) =
      _$ArticleEntityCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      BoardEntity board,
      String title,
      String content,
      DateTime? time,
      int viewCnt,
      AccountEntity account});

  $AccountEntityCopyWith<$Res> get account;
}

/// @nodoc
class _$ArticleEntityCopyWithImpl<$Res>
    implements $ArticleEntityCopyWith<$Res> {
  _$ArticleEntityCopyWithImpl(this._self, this._then);

  final ArticleEntity _self;
  final $Res Function(ArticleEntity) _then;

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? board = null,
    Object? title = null,
    Object? content = null,
    Object? time = freezed,
    Object? viewCnt = null,
    Object? account = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      board: null == board
          ? _self.board
          : board // ignore: cast_nullable_to_non_nullable
              as BoardEntity,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      viewCnt: null == viewCnt
          ? _self.viewCnt
          : viewCnt // ignore: cast_nullable_to_non_nullable
              as int,
      account: null == account
          ? _self.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountEntityCopyWith<$Res> get account {
    return $AccountEntityCopyWith<$Res>(_self.account, (value) {
      return _then(_self.copyWith(account: value));
    });
  }
}

/// @nodoc

class _ArticleEntity implements ArticleEntity {
  const _ArticleEntity(
      {required this.id,
      required this.board,
      required this.title,
      required this.content,
      this.time,
      required this.viewCnt,
      required this.account});

  @override
  final int id;
  @override
  final BoardEntity board;
  @override
  final String title;
  @override
  final String content;
  @override
  final DateTime? time;
  @override
  final int viewCnt;
  @override
  final AccountEntity account;

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ArticleEntityCopyWith<_ArticleEntity> get copyWith =>
      __$ArticleEntityCopyWithImpl<_ArticleEntity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ArticleEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.board, board) || other.board == board) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.viewCnt, viewCnt) || other.viewCnt == viewCnt) &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, board, title, content, time, viewCnt, account);

  @override
  String toString() {
    return 'ArticleEntity(id: $id, board: $board, title: $title, content: $content, time: $time, viewCnt: $viewCnt, account: $account)';
  }
}

/// @nodoc
abstract mixin class _$ArticleEntityCopyWith<$Res>
    implements $ArticleEntityCopyWith<$Res> {
  factory _$ArticleEntityCopyWith(
          _ArticleEntity value, $Res Function(_ArticleEntity) _then) =
      __$ArticleEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      BoardEntity board,
      String title,
      String content,
      DateTime? time,
      int viewCnt,
      AccountEntity account});

  @override
  $AccountEntityCopyWith<$Res> get account;
}

/// @nodoc
class __$ArticleEntityCopyWithImpl<$Res>
    implements _$ArticleEntityCopyWith<$Res> {
  __$ArticleEntityCopyWithImpl(this._self, this._then);

  final _ArticleEntity _self;
  final $Res Function(_ArticleEntity) _then;

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? board = null,
    Object? title = null,
    Object? content = null,
    Object? time = freezed,
    Object? viewCnt = null,
    Object? account = null,
  }) {
    return _then(_ArticleEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      board: null == board
          ? _self.board
          : board // ignore: cast_nullable_to_non_nullable
              as BoardEntity,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      time: freezed == time
          ? _self.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      viewCnt: null == viewCnt
          ? _self.viewCnt
          : viewCnt // ignore: cast_nullable_to_non_nullable
              as int,
      account: null == account
          ? _self.account
          : account // ignore: cast_nullable_to_non_nullable
              as AccountEntity,
    ));
  }

  /// Create a copy of ArticleEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountEntityCopyWith<$Res> get account {
    return $AccountEntityCopyWith<$Res>(_self.account, (value) {
      return _then(_self.copyWith(account: value));
    });
  }
}

// dart format on
