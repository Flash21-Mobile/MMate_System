import 'package:dio/dio.dart';
import 'package:function_system/data/board/response/board_response_dto.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'board_service.g.dart';

@RestApi()
abstract class BoardService {
  factory BoardService(Dio dio, {String baseUrl}) = _BoardService;

  @GET('/api/board')
  Future<List<BoardResponseDto>?> getBoards();
}
