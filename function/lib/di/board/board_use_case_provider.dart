import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/domain/board/usecase/get_boards_use_case.dart';

import 'board_repository_provider.dart';

final getBoardsUseCaseProvider = Provider<GetBoardsUseCase>((ref) {
  final repository = ref.watch(boardRepositoryProvider);
  return GetBoardsUseCase(repository);
});