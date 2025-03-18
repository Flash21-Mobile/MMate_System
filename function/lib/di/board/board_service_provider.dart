import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/account/service/account_service.dart';
import 'package:function_system/data/article/service/article_service.dart';
import 'package:function_system/data/board/service/board_service.dart';
import 'package:function_system/data/file/service/file_service.dart';
import 'package:function_system/di/utilities/dio_provider.dart';

final boardServiceProvider = Provider<BoardService>((ref) {
  final dio = ref.watch(dioProvider);
  return BoardService(dio);
});