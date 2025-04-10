import '../request/grade_response_dto.dart';
import '../response/grade_request_dto.dart';

abstract class GradeRepository {
  Future<List<GradeResponseDto>> getGrades({
    int? id,
    String? positionName,
    String? name,
  });

  Future<GradeResponseDto> postGrade({
    required String name,
    required String positionName,
    required int order,
    required int groupOrder,
    required bool active,
  });

  Future deleteGrade(int id);
}
