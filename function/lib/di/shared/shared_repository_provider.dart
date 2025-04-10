import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/shared/repository/shared_repository.dart';
import 'package:function_system/data/shared/repository/shared_repository_impl.dart';

final sharedRepositoryProvider = Provider<SharedRepository>((ref) {
  return SharedRepositoryImpl();
});