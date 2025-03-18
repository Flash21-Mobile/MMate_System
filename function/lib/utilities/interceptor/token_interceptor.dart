import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:function_system/key/constants_key.dart';

import '../../key/secure_storage_key.dart';

class TokenInterceptor extends Interceptor {
  final String baseUrl;
  final FlutterSecureStorage storage;

  TokenInterceptor(
    this.baseUrl,
    this.storage,
  );

  // 1) 요청 보낼때
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['Authorization'] == null && options.path != '/signin') {
      var accessToken = await storage.read(key: SecureStorageKey.token);
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
        print('onRequest hello: $accessToken');
      }
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    print('[ERR] [${err.requestOptions.method}] ${err.requestOptions.uri}');

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/refresh';

    if (isStatus401 && !isPathRefresh) {
      final token = await storage.read(key: SecureStorageKey.token);

      if (token == null) {
        return handler.reject(err);
      }

      final dio = Dio();

      try {
        // refresh 토큰
        final res = await dio.post(
          '$baseUrl/refresh',
          options: Options(headers: {'Authorization': 'Bearer $token'}),
        );
        final refreshedToken = res.data['token'];

        final options = err.requestOptions;

        // 토큰 변경하기
        options.headers.addAll({'authorization': 'Bearer $refreshedToken'});
        await storage.write(key: SecureStorageKey.token, value: refreshedToken);

        // 요청 재전송
        final response = await dio.fetch(options);

        return handler.resolve(response);
      } on DioException catch (e) {
        return handler.next(e);
      }
    }
    return handler.next(err);
  }
}
