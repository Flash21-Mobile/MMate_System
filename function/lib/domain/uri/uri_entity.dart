import 'dart:typed_data';

import 'package:dio/dio.dart';

class UriEntity {
  final Uint8List data;
  final String extension;

  UriEntity({
    required this.data,
    required this.extension,
  });

  MultipartFile toMultipart() {
    return MultipartFile.fromBytes(
      data,
      filename: 'image_${DateTime.now().millisecondsSinceEpoch}.$extension',
    );
  }
}
