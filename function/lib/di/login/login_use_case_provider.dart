import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/sign/repository/sign_repository_impl.dart';
import 'package:function_system/di/file/file_repository_provider.dart';
import 'package:function_system/di/login/login_repository_provider.dart';
import 'package:function_system/di/sign/sign_repository_provider.dart';
import 'package:function_system/domain/login/login_use_case.dart';
import 'package:function_system/domain/sign/sign_use_case.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(loginRepositoryProvider);
  final fileRepository = ref.watch(fileRepositoryProvider);
  return LoginUseCase(repository, fileRepository);
});
