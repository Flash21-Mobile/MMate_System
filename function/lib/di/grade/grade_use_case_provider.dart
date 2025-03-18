import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/grade/grade_repository_provider.dart';
import 'package:function_system/domain/grade/grade_use_case.dart';
import '../../domain/file/file_use_case.dart';

final getGradesUseCaseProvider = Provider<GetGradesUseCase>((ref) {
  final repository = ref.watch(gradeRepositoryProvider);
  return GetGradesUseCase(repository);
});
