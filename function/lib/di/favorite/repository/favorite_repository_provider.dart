import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/favorite/data/service/favorite_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favroite_service_provider.g.dart';

@riverpod
FavoriteService favoriteService(Ref ref) {
  final realm = ref.watch(realmProvider);
  return FavoriteService(realm);
}