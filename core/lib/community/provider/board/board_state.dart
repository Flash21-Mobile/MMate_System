import 'dart:typed_data';

import 'package:function_system/domain/account/account_entity.dart';
import 'package:function_system/domain/aricle/article_entity.dart';
import 'package:function_system/domain/board/board_entity.dart';

class BoardState {
  final List<BoardEntity>? boards;
  final bool isLoading;
  final String? error;

  BoardState({
    this.boards,
    required this.isLoading,
    this.error,
  });

  factory BoardState.initial() {
    return BoardState(
      boards: null,
      isLoading: false,
      error: null,
    );
  }

  BoardState copyWith({
    List<BoardEntity>? boards,
    bool? isLoading,
    String? error,
  }) {
    return BoardState(
      boards: boards ?? this.boards,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
