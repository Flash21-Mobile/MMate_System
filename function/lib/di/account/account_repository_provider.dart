import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/account/repository/account_repository.dart';
import 'package:function_system/data/account/repository/account_repository_impl.dart';
import 'package:function_system/data/article/repository/article_repository_impl.dart';
import 'package:function_system/di/account/account_service_provider.dart';
import 'package:function_system/di/article/article_service_provider.dart';
import 'package:function_system/data/article/repository/article_repository.dart';
import 'package:function_system/domain/account/usecase/account_use_case.dart';

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  final service = ref.watch(accountServiceProvider);
  return AccountRepositoryImpl(service);
});
