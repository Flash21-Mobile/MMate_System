import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:function_system/data/file/response/file_response_dto.dart';
import 'package:function_system/data/file/service/file_service.dart';
import 'package:function_system/data/uri/response/uri_response_dto.dart';
import 'package:function_system/key/shared_preference_key.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'file_repository.dart';
import 'package:image/image.dart' as img;

class FileRepositoryImpl extends FileRepository {
  final FileService service;
  final Dio dio;

  FileRepositoryImpl(this.service, this.dio);

  @override
  Future<List<FileResponseDTO>> getFiles(
    String api,
    int pk,
  ) async {
    final result = await service.getFiles(api, pk);

    return result ?? [];
  }

  @override
  Future<List<FileResponseDTO>> postFile(
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
  Future<List<UriResponseDTO>> getImages(String api, int pk) async {
    try {
      final fileResult = await service.getFiles(api, pk);
      if (fileResult == null) throw MMateException.noFilesFound;

      fileResult.sort((a, b) {
        if (a.order == null && b.order == null) return 0;
        if (a.order == null) return 1; // null은 뒤로
        if (b.order == null) return -1;
        return a.order!.compareTo(b.order!);
      });

      List<Uint8List?> tempList = await Future.wait(fileResult.map((e) async {
        final result = await dio.get('/api/file/${e.id}',
            options: Options(responseType: ResponseType.bytes));
        return result.data;
      }));

      final result = fileResult
          .asMap()
          .entries
          .map((e) => UriResponseDTO(
                id: e.value.id,
                name: e.value.name,
                saveName: e.value.saveName,
                path: e.value.path,
                size: e.value.size,
                type: e.value.type,
                extension: e.value.extension,
                order: e.value.order,
                api: e.value.api,
                pk: e.value.pk,
                image: tempList[e.key],
              ))
          .where((e) => e.image != null)
          .toList();

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UriResponseDTO> getImage(String api, int pk, bool? isFirst) async {
    try {
      final tempResult = await service.getFiles(api, pk);
      if (tempResult == null || tempResult.isEmpty) {
        throw MMateException.noFilesFound;
      }

      tempResult.sort((a, b) {
        if (a.order == null && b.order == null) return 0;
        if (a.order == null) return 1; // null은 뒤로
        if (b.order == null) return -1;
        return a.order!.compareTo(b.order!);
      });

      final currentFile = isFirst == true ? tempResult.first : tempResult.last;

      final result = await dio.get(
        '/api/file/${currentFile.id}',
        options: Options(responseType: ResponseType.bytes),
      );

      return UriResponseDTO(
        id: currentFile.id,
        name: currentFile.name,
        saveName: currentFile.saveName,
        path: currentFile.path,
        size: currentFile.size,
        type: currentFile.type,
        extension: currentFile.extension,
        order: currentFile.order,
        api: currentFile.api,
        pk: currentFile.pk,
        image: result.data,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteFiles(String? api, int? id) async {
    try {
      final result = await service.getFiles(api, id);
      if (result != null) {
        await Future.wait(result.map((e) => service.deleteFiles(e.id)));
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<File>> getResizedImages(List<File> image) async {
    try {
      List<File> images = [];

      // 디바이스의 임시 디렉토리 경로 얻기
      final tempDir = await getTemporaryDirectory();

      for (var file in images) {
        // 파일 읽기
        final imageBytes = await File(file.path).readAsBytes();
        final originalImage = img.decodeImage(imageBytes);

        if (originalImage != null) {
          // 사진 크기 조정: 가로를 1080으로 맞추고 비율 유지
          final resizedImage = img.copyResize(originalImage, width: 1080);

          // 크기를 조정한 이미지를 임시 디렉토리에 저장
          final resizedImagePath =
              '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}_resized.jpg';
          final resizedImageFile = File(resizedImagePath)
            ..writeAsBytesSync(
                img.encodeJpg(resizedImage, quality: 85)); // JPEG 품질 설정

          // MultipartFile 변환
          images.add(resizedImageFile);
        }
      }

      return images;
    } catch (e) {
      rethrow;
    }
  }
}
