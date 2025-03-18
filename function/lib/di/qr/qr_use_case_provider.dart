import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/sign/repository/sign_repository_impl.dart';
import 'package:function_system/di/file/file_repository_provider.dart';
import 'package:function_system/di/login/login_repository_provider.dart';
import 'package:function_system/di/qr/qr_repository_provider.dart';
import 'package:function_system/di/sign/sign_repository_provider.dart';
import 'package:function_system/domain/login/login_use_case.dart';
import 'package:function_system/domain/qr/qr_use_case.dart';
import 'package:function_system/domain/sign/sign_use_case.dart';

final qrUseCaseProvider = Provider<QrUseCase>((ref) {
  final repository = ref.watch(qrRepositoryProvider);
  return QrUseCase(repository);
});
