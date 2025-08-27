import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/fcm/fcm_repository_provider.dart';
import 'package:function_system/di/login/login_repository_provider.dart';
import 'package:function_system/di/sign/sign_repository_provider.dart';

import '../../domain/sign/sign_in_use_case.dart';

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
  final repository = ref.watch(signRepositoryProvider);
  final loginRepository = ref.watch(loginRepositoryProvider);
  final fcmRepository = ref.watch(fcmRepositoryProvider);
  return SignInUseCase(
    repository,
    loginRepository,
    fcmRepository,
  );
});
