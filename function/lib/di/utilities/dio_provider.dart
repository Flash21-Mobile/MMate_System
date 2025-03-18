import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/utilities/base_url_provider.dart';
import 'package:function_system/di/utilities/interceptor_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final tokenInterceptor = ref.watch(tokenInterceptorProvider);
  final zstdInterceptor = ref.watch(zstdInterceptorProvider);

  final baseUrl = ref.watch(baseUrlProvider);

  final dio = Dio()
    ..options.connectTimeout = const Duration(seconds: 300)
    ..options.receiveTimeout = const Duration(seconds: 300)
    ..options.headers['Content-Type'] = 'application/json'
    ..options.headers['cheat'] = 'showmethemoney'
    ..options.baseUrl = baseUrl
    ..interceptors.add(tokenInterceptor);

  if (kReleaseMode) {
    dio.options.responseType = ResponseType.bytes;
    dio.options.headers['Accept-Encoding'] = 'zstd';
    dio.interceptors.add(zstdInterceptor);
  } else {
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  return dio;
});
