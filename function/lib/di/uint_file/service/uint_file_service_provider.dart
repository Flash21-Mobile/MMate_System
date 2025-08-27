import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/utilities/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:function_system/data/uint_file/service/uint_file_service.dart';

part 'uint_file_service_provider.g.dart';

@riverpod
UintFileService uintFileService(Ref ref) {
  final dio = ref.watch(dioProvider);
  return UintFileService(dio);
}