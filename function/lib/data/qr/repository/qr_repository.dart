import 'dart:typed_data';

abstract class QrRepository {
  Future<Uint8List> getQrImage(String data);
}