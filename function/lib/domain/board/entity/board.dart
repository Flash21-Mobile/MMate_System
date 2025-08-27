import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../board_type.dart';

part 'board.freezed.dart';

@freezed
abstract class Board with _$Board {
  const factory Board({
  required final int id,
    required final String name,
    required final BoardType type,
    required final String content,

  }) = _Board;
}