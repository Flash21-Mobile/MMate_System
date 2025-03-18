import 'package:function_system/data/board/repository/board_repository.dart';
import 'package:function_system/data/board/response/board_response_dto.dart';
import 'package:function_system/data/board/service/board_service.dart';

class BoardRepositoryImpl extends BoardRepository {
  final BoardService service;

  BoardRepositoryImpl(this.service);

  @override
  Future<List<BoardResponseDto>> getBoards() async {
    final result = await service.getBoards();

    return result ?? [];
  }
}
