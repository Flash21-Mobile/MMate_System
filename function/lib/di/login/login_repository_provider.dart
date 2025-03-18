import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/login/repository/login_repository.dart';
import 'package:function_system/data/login/repository/login_repository_impl.dart';
import 'package:function_system/di/login/login_service_provider.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  final service = ref.watch(loginServiceProvider);
  return LoginRepositoryImpl(service);
});
