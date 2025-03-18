import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/account/service/account_service.dart';
import 'package:function_system/data/article/service/article_service.dart';
import 'package:function_system/di/utilities/dio_provider.dart';

final accountServiceProvider = Provider<AccountService>((ref) {
  final dio = ref.watch(dioProvider);
  return AccountService(dio);
});