import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/uri/uri_repository_provider.dart';
import 'package:function_system/domain/uri/uri_use_case.dart';

final uriPickImagesUseCaseProvider = Provider<UriPickImagesUseCase>((ref) {
  final repository = ref.watch(uriRepositoryProvider);
  return UriPickImagesUseCase(repository);
});

final uriPickImageUseCaseProvider = Provider<UriPickImageUseCase>((ref) {
  final repository = ref.watch(uriRepositoryProvider);
  return UriPickImageUseCase(repository);
});
