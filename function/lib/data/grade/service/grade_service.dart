import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../response/grade_response_dto.dart';

part 'grade_service.g.dart';

@RestApi()
abstract class GradeService {
  factory GradeService(Dio dio, {String baseUrl}) = _GradeService;

  @GET('/api/grade')
  Future<List<GradeResponseDto>?> getGrades(
    @Query('positionName') String? positionName,
  );
}
