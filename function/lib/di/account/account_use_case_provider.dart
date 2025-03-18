import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/account/account_repository_provider.dart';
import 'package:function_system/di/article/article_repository_provider.dart';
import 'package:function_system/di/file/file_repository_provider.dart';
import 'package:function_system/di/login/login_repository_provider.dart';
import 'package:function_system/domain/account/account_use_case.dart';
import 'package:function_system/domain/aricle/article_use_case.dart';

final getAccountsUseCaseProvider = Provider<GetAccountsUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return GetAccountsUseCase(repository);
});

final getAccountDetailUseCaseProvider =
    Provider<GetAccountDetailUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return GetAccountDetailUseCase(repository);
});

final putAccountUseCaseProvider = Provider<PutAccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  final loginRepository = ref.watch(loginRepositoryProvider);
  final fileRepository = ref.watch(fileRepositoryProvider);
  return PutAccountUseCase(repository, loginRepository, fileRepository);
});

final postAccountFavoriteUseCaseProvider =
    Provider<PostAccountFavoriteUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return PostAccountFavoriteUseCase(repository);
});

final deleteAccountFavoriteUseCaseProvider =
    Provider<DeleteAccountFavoriteUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  return DeleteAccountFavoriteUseCase(repository);
});
