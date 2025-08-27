import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/account/repository/account_repository.dart';
import 'package:function_system/data/account/repository/account_repository_impl.dart';
import 'package:function_system/data/article/repository/article_repository_impl.dart';
import 'package:function_system/data/board/repository/board_repository_impl.dart';
import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/data/file/repository/file_repository_impl.dart';
import 'package:function_system/di/account/account_service_provider.dart';
import 'package:function_system/di/article/article_service_provider.dart';
import 'package:function_system/data/article/repository/article_repository.dart';
import 'package:function_system/di/utilities/dio_provider.dart';
import 'package:function_system/di/file/file_service_provider.dart';
import 'package:function_system/domain/account/usecase/get_accounts_use_case.dart';

import '../../data/board/repository/board_repository.dart';
import 'board_service_provider.dart';

final boardRepositoryProvider = Provider<BoardRepository>((ref) {
  final service = ref.watch(boardServiceProvider);
  return BoardRepositoryImpl(service);
});
