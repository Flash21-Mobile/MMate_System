import 'package:function_system/domain/grade/entity/grade.dart';

import '../../../data/grade/repository/grade_repository.dart';

class PostGradeUseCase {
  final GradeRepository _gradeRepository;

  PostGradeUseCase(this._gradeRepository);

  Future<Grade> execute({
    required String name,
    required String positionName,
    int order = 0,
    groupOrder = 0,
    active = true,
  }) async {
    try {
      final result = await _gradeRepository.postGrade(
        name: name,
        positionName: positionName,
        order: order,
        groupOrder: groupOrder,
        active: active,
      );

      return result.toEntity();
    } catch (e) {
      rethrow;
    }
  }
}