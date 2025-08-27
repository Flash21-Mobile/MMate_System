import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:function_system/data/file/response/file_response_dto.dart';
import 'package:function_system/data/file/service/file_service.dart';
import 'package:function_system/data/uint_file/response/uint_file_response_dto.dart';
import 'package:function_system/key/shared_preference_key.dart';
import 'package:function_system/utilities/exception/exception.dart';
import 'package:function_system/utilities/log.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file_repository.dart';
import 'package:image/image.dart' as img;

class FileRepositoryImpl extends FileRepository {
  final FileService service;
  final Dio dio;

  FileRepositoryImpl(this.service, this.dio);

  @override
  Future<List<FileResponseDTO>> get(
    String api,
    int pk,
  ) async {
    final result = await service.getFiles(api, pk);

    return result ?? [];
  }

  @override
  Future<List<FileResponseDTO>> post(
    String api,
    int pk,
    List<MultipartFile> files,
  ) async {
    try {

      final result = await service.postFile(api, pk, files);
      return result ?? [];
    } catch (e) {
      rethrow;
    }
  }


  @override
  Future delete(String? api, int? id) async {
    try {
      final result = await service.getFiles(api, id);
      if (result != null) {
        await Future.wait(result.map((e) => service.deleteFiles(e.id)));
      }
    } catch (e) {
      rethrow;
    }
  }
}
