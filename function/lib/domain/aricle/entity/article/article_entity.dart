import 'package:function_system/domain/account/base/base_account_entity.dart';
import 'package:function_system/domain/board/board_entity.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../account/entity/account/account_entity.dart';

part 'article_entity.freezed.dart';

@freezed
abstract class ArticleEntity with _$ArticleEntity {
  const factory ArticleEntity({
    required int id,
    required BoardEntity board,
    required String title,
    required String content,
    DateTime? time,
    @Default([]) List<String> images,
    required int viewCnt,
    required AccountEntity account,
  }) = _ArticleEntity;
}
