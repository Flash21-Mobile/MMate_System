import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/account/enricher/account_enricher_provider.dart';
import 'package:function_system/di/login/login_repository_provider.dart';
import 'package:function_system/domain/login/use_case/login_use_case.dart';

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repository = ref.watch(loginRepositoryProvider);
  final accountEnricher = ref.watch(accountEnricherProvider);
  return LoginUseCase(repository, accountEnricher);
});
