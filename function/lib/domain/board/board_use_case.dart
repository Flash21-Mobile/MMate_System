import 'package:function_system/data/board/repository/board_repository.dart';
import 'package:function_system/data/grade/repository/grade_repository.dart';
import 'package:function_system/domain/board/board_entity.dart';
import 'package:function_system/domain/grade/grade_entity.dart';

class GetBoardsUseCase {
  final BoardRepository _boardRepository;

  GetBoardsUseCase(this._boardRepository);

  Future<List<BoardEntity>> execute({String? positionName}) async{
    try {
      final result =await  _boardRepository.getBoards();
      return result.map((e)=>e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
