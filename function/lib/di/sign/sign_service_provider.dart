import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/sign/service/sign_service.dart';
import 'package:function_system/di/utilities/dio_provider.dart';

final signServiceProvider = Provider<SignService>((ref) {
  final dio = ref.watch(dioProvider);
  return SignService(dio);
});
