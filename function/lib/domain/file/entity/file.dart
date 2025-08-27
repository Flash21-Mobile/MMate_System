import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'file.freezed.dart';

@freezed
abstract class File with _$File {
  const factory File({
    required final int id,
    required final String name,
    required final String path,
    required final String extension,
    required final int? order,
    required final String api,
    required final int? pk,
  }) = _File;
}