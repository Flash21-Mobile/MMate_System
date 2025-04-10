import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/shared/repository/shared_repository.dart';
import 'package:function_system/di/shared/shared_repository_provider.dart';

import '../../domain/shared/shared_use_case.dart';

final getSharedUintUseCaseUseCase = Provider<GetSharedUintUseCase>((ref) {
  final repository = ref.watch(sharedRepositoryProvider);

  return GetSharedUintUseCase(repository);
});

final postSharedUintUseCaseUseCase = Provider<PostSharedUintUseCase>((ref) {
  final repository = ref.watch(sharedRepositoryProvider);

  return PostSharedUintUseCase(repository);
});
