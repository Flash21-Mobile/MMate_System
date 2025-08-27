import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:function_system/data/uint_file/response/uint_file_response_dto.dart';

import '../response/file_response_dto.dart';

abstract class FileRepository {
  Future<List<FileResponseDTO>> get(String api, int pk);

  Future<List<FileResponseDTO>> post(
      String api, int pk, List<MultipartFile> files);

  Future delete(String? api, int? id);
}
