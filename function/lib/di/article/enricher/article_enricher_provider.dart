import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/account/enricher/account_enricher.dart';
import 'package:function_system/data/article/enricher/article_enricher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
ArticleEnricher articleEnricher(Ref ref){
  final accountEnricher = ref.watch(accountEnricherProvider);
  return ArticleEnricher(accountEnricher);
}