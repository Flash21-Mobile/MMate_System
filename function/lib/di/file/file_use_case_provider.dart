import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/file/file_use_case.dart';
import 'file_repository_provider.dart';

final getFilesUseCaseProvider = Provider<GetFilesUseCase>((ref) {
  final repository = ref.watch(fileRepositoryProvider);
  return GetFilesUseCase(repository);
});

final getUintUseCaseProvider = Provider<GetUintUseCase>((ref) {
  final repository = ref.watch(fileRepositoryProvider);
  return GetUintUseCase(repository);
});

final getUintListUseCaseProvider = Provider<GetUintListUseCase>((ref) {
  final repository = ref.watch(fileRepositoryProvider);
  return GetUintListUseCase(repository);
});