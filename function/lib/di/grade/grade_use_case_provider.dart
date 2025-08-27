import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/grade/grade_repository_provider.dart';
import 'package:function_system/domain/grade/use_case/get_grade_by_id_use_case.dart';

import '../../domain/grade/use_case/delete_grade_use_case.dart';
import '../../domain/grade/use_case/get_grades_use_case.dart';
import '../../domain/grade/use_case/post_grade_use_case.dart';

final getGradesUseCaseProvider = Provider<GetGradesUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return GetGradesUseCase(repository);
});

final getGradeUseCaseProvider = Provider<GetGradeByIdUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return GetGradeByIdUseCase(repository);
});

final postGradeUseCaseProvider = Provider<PostGradeUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return PostGradeUseCase(repository);
});

final deleteGradeUseCaseProvider = Provider<DeleteGradeUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return DeleteGradeUseCase(repository);
});
