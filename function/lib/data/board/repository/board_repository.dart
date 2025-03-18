import 'package:function_system/data/board/response/board_response_dto.dart';

abstract class BoardRepository {
  Future<List<BoardResponseDto>> getBoards();
}
