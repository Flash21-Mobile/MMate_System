import 'package:function_system/data/grade/repository/grade_repository.dart';
import 'package:function_system/domain/grade/grade_entity.dart';

class GetGradesUseCase {
  final GradeRepository _gradeRepository;

  GetGradesUseCase(this._gradeRepository);

  Future<List<GradeEntity>> execute({String? positionName}) async {
    try {
      final result =
          await _gradeRepository.getGrades(positionName: positionName);
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

class GetGradeUseCase {
  final GradeRepository _gradeRepository;

  GetGradeUseCase(this._gradeRepository);

  Future<GradeEntity> execute({int? id}) async {
    try {
      final result = await _gradeRepository.getGrades(id: id);

      return result.map((e) => e.toEntity()).toList().first;
    } catch (e) {
      rethrow;
    }
  }
}

class PostGradeUseCase {
  final GradeRepository _gradeRepository;

  PostGradeUseCase(this._gradeRepository);

  Future<GradeEntity> execute({
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

class DeleteGradeUseCase {
  final GradeRepository _gradeRepository;

  DeleteGradeUseCase(this._gradeRepository);

  Future execute(int id) async {
    try {
      await _gradeRepository.deleteGrade(id);
      return;
    } catch (e) {
      rethrow;
    }
  }
}
