import 'package:function_system/domain/board/board_entity.dart';

class BoardState {
  final List<BoardEntity>? data;
  final bool isLoading;
  final String? error;

  BoardState({
    this.data,
    required this.isLoading,
    this.error,
  });

  factory BoardState.initial() {
    return BoardState(
      data: null,
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
      data: boards ?? this.data,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
