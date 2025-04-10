import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/grade/grade_repository_provider.dart';
import 'package:function_system/domain/grade/grade_use_case.dart';

final getGradesUseCaseProvider = Provider<GetGradesUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return GetGradesUseCase(repository);
});

final getGradeUseCaseProvider = Provider<GetGradeUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return GetGradeUseCase(repository);
});

final postGradeUseCaseProvider = Provider<PostGradeUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return PostGradeUseCase(repository);
});

final deleteGradeUseCaseProvider = Provider<DeleteGradeUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return DeleteGradeUseCase(repository);
});
