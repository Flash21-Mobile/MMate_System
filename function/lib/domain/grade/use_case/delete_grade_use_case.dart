import '../../../data/grade/repository/grade_repository.dart';

class DeleteGradeUseCase {
  final GradeRepository _gradeRepository;

  DeleteGradeUseCase(this._gradeRepository);

  Future<void> execute(int id) async {
    try {
      await _gradeRepository.deleteGrade(id);
      return;
    } catch (e) {
      rethrow;
    }
  }
}