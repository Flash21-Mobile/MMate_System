import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../response/grade_response_dto.dart';
import '../request/grade_request_dto.dart';

part 'grade_service.g.dart';

@RestApi()
abstract class GradeService {
  factory GradeService(Dio dio, {String baseUrl}) = _GradeService;

  @GET('/api/grade')
  Future<List<GradeResponseDto>?> getGrades(
    @Query('id') int? id,
    @Query('positionName') String? positionName,
    @Query('name') String? name,
  );

  @POST('/api/grade')
  Future<GradeResponseDto> postGrade(
    @Body() GradeRequestDto data,
  );

  @DELETE('/api/grade/{id}')
  Future deleteGrade(
    @Path('id') int id,
  );
}
