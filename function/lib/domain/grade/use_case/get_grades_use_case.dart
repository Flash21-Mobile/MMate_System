import '../../../data/grade/repository/grade_repository.dart';
import '../entity/grade.dart';

class GetGradesUseCase {
  final GradeRepository _gradeRepository;

  GetGradesUseCase(this._gradeRepository);

  Future<List<Grade>> execute({
    String? positionName,
    int? groupOrder,
  }) async {
    try {
      final result = await _gradeRepository.getGrades(
        positionName: positionName,
        groupOrder: groupOrder,
      );
      result.sort((a, b) {
        if (a.order == null && b.order == null) return 0; // 둘 다 null이면 변경 없음
        if (a.order == null) return 1; // a가 null이면 뒤로
        if (b.order == null) return -1; // b가 null이면 앞으로
        return a.order!.compareTo(b.order!); // 숫자 비교
      });

      return result.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}