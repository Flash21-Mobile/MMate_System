import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:function_system/data/qr/repository/qr_repository.dart';

class QrRepositoryImpl extends QrRepository {
  final Dio dio;

  QrRepositoryImpl(this.dio);

  @override
  Future<Uint8List> getQrImage(String data) async{
    try {
      final result = await dio.get(
        '/api/qr?size=10&data=$data',
        options: Options(responseType: ResponseType.bytes),
      );

      return result.data;
    } catch (e) {
      rethrow;
    }
  }
}
