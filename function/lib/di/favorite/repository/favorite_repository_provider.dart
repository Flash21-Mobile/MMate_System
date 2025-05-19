import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/favorite/data/repository/favorite_repository.dart';
import 'package:function_system/data/favorite/data/repository/favorite_repository_impl.dart';
import 'package:function_system/data/favorite/data/service/favorite_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../service/favorite_service_provider.dart';

part 'favorite_repository_provider.g.dart';

@riverpod
FavoriteRepository favoriteRepository(Ref ref) {
  final favoriteService = ref.watch(favoriteServiceProvider);
  return FavoriteRepositoryImpl(favoriteService);
}