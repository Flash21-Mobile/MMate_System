import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/sign/repository/sign_repository.dart';
import 'package:function_system/data/sign/repository/sign_repository_impl.dart';
import 'package:function_system/di/sign/sign_service_provider.dart';
import 'package:function_system/di/utilities/secure_storage_provider.dart';

final signRepositoryProvider = Provider<SignRepository>((ref) {
  final secureStorage = ref.watch(secureStorageProvider);
  final service = ref.watch(signServiceProvider);
  return SignRepositoryImpl(secureStorage, service);
});