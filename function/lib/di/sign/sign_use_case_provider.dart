import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/sign/repository/sign_repository_impl.dart';
import 'package:function_system/di/fcm/fcm_repository_provider.dart';
import 'package:function_system/di/login/login_repository_provider.dart';
import 'package:function_system/di/sign/sign_repository_provider.dart';
import 'package:function_system/domain/sign/sign_use_case.dart';

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

final signInWithNameUseCaseProvider = Provider<SignInWithNameUseCase>((ref) {
  final repository = ref.watch(signRepositoryProvider);
  final loginRepository = ref.watch(loginRepositoryProvider);
  final fcmRepository = ref.watch(fcmRepositoryProvider);
  return SignInWithNameUseCase(
    repository,
    loginRepository,
    fcmRepository,
  );
});
