import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/account/account_repository_provider.dart';
import 'package:function_system/di/account/enricher/account_enricher_provider.dart';
import 'package:function_system/di/article/article_repository_provider.dart';
import 'package:function_system/di/article/enricher/article_enricher_provider.dart';
import 'package:function_system/di/file/file_repository_provider.dart';
import 'package:function_system/domain/article/usecase/delete_article_use_case.dart';

import '../../domain/article/usecase/get_article_detail_use_case.dart';
import '../../domain/article/usecase/get_articles_use_case.dart';
import '../../domain/article/usecase/post_article_use_case.dart';
import '../../domain/article/usecase/put_article_use_case.dart';

final getArticleDetailUseCaseProvider =
    Provider<GetArticleDetailUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  final articleEnricher = ref.watch(articleEnricherProvider);
  return GetArticleDetailUseCase(repository, articleEnricher);
});

final getArticlesUseCaseProvider = Provider<GetArticlesUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  final articleEnricher = ref.watch(articleEnricherProvider);
  return GetArticlesUseCase(repository, articleEnricher);
});

final postArticleUseCaseProvider = Provider<PostArticleUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  final articleEnricher = ref.watch(articleEnricherProvider);
  final fileRepository = ref.watch(fileRepositoryProvider);
  return PostArticleUseCase(repository, articleEnricher, fileRepository);
});

final putArticleUseCaseProvider = Provider<PutArticleUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  final articleEnricher = ref.watch(articleEnricherProvider);
  final fileRepository = ref.watch(fileRepositoryProvider);
  return PutArticleUseCase(repository, articleEnricher, fileRepository);
});

final deleteArticleUseCaseProvider = Provider<DeleteArticleUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return DeleteArticleUseCase(repository);
});
