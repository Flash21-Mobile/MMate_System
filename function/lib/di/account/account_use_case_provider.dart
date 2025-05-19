import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/account/account_repository_provider.dart';
import 'package:function_system/di/article/article_repository_provider.dart';
import 'package:function_system/di/favorite/repository/favorite_repository_provider.dart';
import 'package:function_system/di/file/file_repository_provider.dart';
import 'package:function_system/di/login/login_repository_provider.dart';
import 'package:function_system/domain/account/usecase/account_use_case.dart';
import 'package:function_system/domain/aricle/article_use_case.dart';

import 'enricher/account_enricher_provider.dart';

final getAccountsUseCaseProvider = Provider<GetAccountsUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  final accountEnricher = ref.watch(accountEnricherProvider);
  return GetAccountsUseCase(repository, accountEnricher);
});

final getAccountDetailUseCaseProvider =
    Provider<GetAccountDetailUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  final accountEnricher = ref.watch(accountEnricherProvider);
  return GetAccountDetailUseCase(repository, accountEnricher);
});

final putAccountUseCaseProvider = Provider<PutAccountUseCase>((ref) {
  final repository = ref.watch(accountRepositoryProvider);
  final accountEnricher = ref.watch(accountEnricherProvider);
  final fileRepository = ref.watch(fileRepositoryProvider);
  return PutAccountUseCase(repository, accountEnricher, fileRepository);
});

final postAccountFavoriteUseCaseProvider =
    Provider<PostAccountFavoriteUseCase>((ref) {
  final repository = ref.watch(favoriteRepositoryProvider);
  return PostAccountFavoriteUseCase(repository);
});

final deleteAccountFavoriteUseCaseProvider =
    Provider<DeleteAccountFavoriteUseCase>((ref) {
  final repository = ref.watch(favoriteRepositoryProvider);
  return DeleteAccountFavoriteUseCase(repository);
});
