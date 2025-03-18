import '../response/grade_response_dto.dart';

abstract class GradeRepository {
  Future<List<GradeResponseDto>> getGrades(String? positionName);
}
