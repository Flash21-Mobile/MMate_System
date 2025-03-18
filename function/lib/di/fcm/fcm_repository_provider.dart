import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/account/repository/account_repository.dart';
import 'package:function_system/data/article/repository/article_repository_impl.dart';
import 'package:function_system/data/fcm/repository/fcm_repository.dart';
import 'package:function_system/data/fcm/repository/fcm_repository_impl.dart';
import 'package:function_system/di/article/article_service_provider.dart';
import 'package:function_system/data/article/repository/article_repository.dart';
import 'package:function_system/di/fcm/fcm_service_provider.dart';
import 'package:function_system/domain/account/account_use_case.dart';

final fcmRepositoryProvider = Provider<FcmRepository>((ref) {
  final service = ref.watch(fcmServiceProvider);
  return FcmRepositoryImpl(service);
});
