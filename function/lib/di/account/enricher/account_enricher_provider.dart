import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/data/account/enricher/account_enricher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../favorite/repository/favorite_repository_provider.dart';

part 'account_enricher_provider.g.dart';

@riverpod
AccountEnricher accountEnricher(Ref ref){
  final favoriteRepository= ref.watch(favoriteRepositoryProvider);
  return AccountEnricher(favoriteRepository);
}