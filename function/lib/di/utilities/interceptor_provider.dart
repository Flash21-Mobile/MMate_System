import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/utilities/secure_storage_provider.dart';
import 'package:function_system/utilities/interceptor/zstd_interceptor.dart';

import '../../utilities/interceptor/token_interceptor.dart';
import 'base_url_provider.dart';

final tokenInterceptorProvider = Provider<TokenInterceptor>((ref) {
  final baseUrl = ref.watch(baseUrlProvider);
  final storage = ref.watch(secureStorageProvider);
  return TokenInterceptor(baseUrl, storage);
});

final zstdInterceptorProvider = Provider<ZstdInterceptor>((ref) {
  return ZstdInterceptor();
});
