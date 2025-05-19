import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/domain/favorite/use_case/delete_favorite_use_case.dart';
import 'package:function_system/domain/favorite/use_case/set_favorite_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/favorite_repository_provider.dart';

part 'favorite_use_case_provider.g.dart';

@riverpod
SetFavoriteUseCase setFavoriteUseCase(Ref ref) {
  final favoriteRepository = ref.read(favoriteRepositoryProvider);
  return SetFavoriteUseCase(favoriteRepository);
}

@riverpod
DeleteFavoriteUseCase deleteFavoriteUseCase(Ref ref) {
  final favoriteRepository = ref.read(favoriteRepositoryProvider);
  return DeleteFavoriteUseCase(favoriteRepository);

}