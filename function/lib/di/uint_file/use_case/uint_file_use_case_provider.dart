import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/domain/uint_file/use_case/get_uint_file_by_last_use_case.dart';
import 'package:function_system/domain/uint_file/use_case/get_uint_files_use_case.dart';

import '../repository/uint_file_repository_provider.dart';

final getUintFilesUseCaseProvider = Provider<GetUintFilesUseCase>((ref) {
  final repository = ref.watch(uintFileRepositoryProvider);
  return GetUintFilesUseCase(repository);
});

final getUintFileByLastUseCaseProvider = Provider<GetUintFileByLastUseCase>((ref) {
  final repository = ref.watch(uintFileRepositoryProvider);
  return GetUintFileByLastUseCase(repository);
});