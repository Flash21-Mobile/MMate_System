import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/article/article_repository_provider.dart';
import 'package:function_system/di/file/file_repository_provider.dart';
import 'package:function_system/domain/aricle/article_use_case.dart';

final getArticleDetailUseCaseProvider =
    Provider<GetArticleDetailUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return GetArticleDetailUseCase(repository);
});

final getArticlesUseCaseProvider = Provider<GetArticlesUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return GetArticlesUseCase(repository);
});

final postArticleUseCaseProvider = Provider<PostArticleUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  final fileRepository = ref.watch(fileRepositoryProvider);
  return PostArticleUseCase(repository, fileRepository);
});

final putArticleUseCaseProvider = Provider<PutArticleUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return PutArticleUseCase(repository);
});

final deleteArticleUseCaseProvider = Provider<DeleteArticleUseCase>((ref) {
  final repository = ref.watch(articleRepositoryProvider);
  return DeleteArticleUseCase(repository);
});
