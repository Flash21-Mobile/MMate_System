import 'dart:typed_data';

import 'package:function_system/domain/account/account_entity.dart';
import 'package:function_system/domain/aricle/article_entity.dart';

class ArticleState {
  final List<ArticleEntity>? articles;
  final bool isLoading;
  final String? error;

  ArticleState({
    this.articles,
    required this.isLoading,
    this.error,
  });

  factory ArticleState.initial() {
    return ArticleState(
      articles: null,
      isLoading: false,
      error: null,
    );
  }

  ArticleState copyWith({
    List<ArticleEntity>? articles,
    bool? isLoading,
    String? error,
  }) {
    return ArticleState(
      articles: articles ?? this.articles,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
