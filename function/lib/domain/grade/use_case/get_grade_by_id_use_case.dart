import 'package:function_system/domain/grade/entity/grade.dart';

import '../../../data/grade/repository/grade_repository.dart';

class GetGradeByIdUseCase {
  final GradeRepository _gradeRepository;

  GetGradeByIdUseCase(this._gradeRepository);

  Future<Grade> execute({int? id}) async {
    try {
      final result = await _gradeRepository.getGrades(id: id);

      return result.map((e) => e.toEntity()).toList().first;
    } catch (e) {
      rethrow;
    }
  }
}