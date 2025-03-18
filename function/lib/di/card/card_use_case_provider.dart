import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/file/file_repository_provider.dart';
import 'package:function_system/di/utilities/my_id_provider.dart';
import 'package:function_system/di/uri/uri_repository_provider.dart';
import 'package:function_system/domain/card/card_use_case.dart';

final getCardUseCaseProvider = Provider<GetCardUseCase>((ref) {
  final repository = ref.watch(fileRepositoryProvider);
  final myId = ref.watch(myIdProvider);
  return GetCardUseCase(repository, myId);
});

final postCardUseCaseProvider = Provider<PostCardUseCase>((ref) {
  final repository = ref.watch(fileRepositoryProvider);
  final uriRepository = ref.watch(uriRepositoryProvider);
  final myId = ref.watch(myIdProvider);
  return PostCardUseCase(repository, uriRepository, myId);
});
