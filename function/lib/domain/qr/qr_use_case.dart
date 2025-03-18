import 'dart:typed_data';

import 'package:function_system/data/qr/repository/qr_repository.dart';

class QrUseCase {
  final QrRepository repository;

  QrUseCase(this.repository);

  Future<Uint8List> execute(String data) async {
    try {
      final result = await repository.getQrImage(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
