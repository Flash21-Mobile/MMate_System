import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:function_system/data/uri/response/uri_response_dto.dart';

import '../response/file_response_dto.dart';

abstract class FileRepository {
  Future<List<FileResponseDTO>> getFiles(String api, int pk);

  Future<List<FileResponseDTO>> postFile(
      String api, int pk, List<MultipartFile> files);

  Future deleteFiles(String? api, int? id);

  Future<List<UriResponseDTO>> getImages(String api, int pk);

  Future<UriResponseDTO> getImage(String api, int pk, bool? isFirst);

  Future<List<File>> getResizedImages(List<File> image);

  Future<File> saveCard(File file);

  Future<File> loadCard();
}
