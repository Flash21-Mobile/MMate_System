import 'package:function_system/data/board/repository/board_repository.dart';
import 'package:function_system/data/board/response/board_response_dto.dart';
import 'package:function_system/data/grade/repository/grade_repository.dart';
import 'package:function_system/domain/board/entity/board.dart';
import 'package:function_system/domain/grade/entity/grade.dart';

class GetBoardsUseCase {
  final BoardRepository _boardRepository;

  GetBoardsUseCase(this._boardRepository);

  Future<List<Board>> execute({String? positionName}) async {
    try {
      final result = await _boardRepository.getBoards();
      return result.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
