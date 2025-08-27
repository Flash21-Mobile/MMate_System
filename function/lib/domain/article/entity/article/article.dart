import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../../../account/entity/account/account.dart';
import '../../../board/entity/board.dart';

part 'article.freezed.dart';

@freezed
abstract class Article with _$Article {
  const factory Article({
    required int id,
    required Board board,
    required String title,
    required String content,
    DateTime? time,
    required int viewCnt,
    required Account account,
  }) = _Article;
}