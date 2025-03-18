import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/article/service/article_service.dart';
import 'package:function_system/di/utilities/dio_provider.dart';

final articleServiceProvider = Provider<ArticleService>((ref) {
  final dio = ref.watch(dioProvider);
  return ArticleService(dio);
});