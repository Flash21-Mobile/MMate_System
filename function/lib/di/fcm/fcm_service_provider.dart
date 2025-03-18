import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/article/service/article_service.dart';
import 'package:function_system/data/fcm/service/fcm_service.dart';
import 'package:function_system/di/utilities/dio_provider.dart';

final fcmServiceProvider = Provider<FcmService>((ref) {
  final dio = ref.watch(dioProvider);
  return FcmService(dio);
});