import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/uint_file/repository/uint_file_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/uint_file/repository/uint_file_repository_impl.dart';
import '../../utilities/dio_provider.dart';
import '../service/uint_file_service_provider.dart';

part 'uint_file_repository_provider.g.dart';

@riverpod
UintFileRepository uintFileRepository(Ref ref) {
  final service = ref.watch(uintFileServiceProvider);
  final dio = ref.watch(dioProvider);
  return UintFileRepositoryImpl(service, dio);
}