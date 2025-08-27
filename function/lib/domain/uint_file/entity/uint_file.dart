import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:function_system/utilities/format/time_format.dart';
import 'package:uuid/uuid.dart';

part 'uint_file.freezed.dart';

@freezed
abstract class UintFile with _$UintFile {
  @override
  final Uint8List data;
  @override
  final String extension;

  const UintFile._({
    required this.data,
    required this.extension,
  });

  const factory UintFile({
    required final Uint8List data,
    required final String extension,
  }) = _UintFile;

  MultipartFile toMultipart() {
    final uuid = Uuid();

    print('fileName: image_${uuid.v4().substring(0, 20)}.$extension');
    return MultipartFile.fromBytes(
      data,
      filename: 'img_${uuid.v4().substring(0, 20)}.$extension',
    );
  }
}
