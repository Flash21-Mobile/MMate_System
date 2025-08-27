import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:function_system/domain/uint_file/entity/uint_file.dart';

import '../../../utilities/exception/exception.dart';
import '../../../utilities/log.dart';
import '../response/uint_file_response_dto.dart';
import '../service/uint_file_service.dart';
import 'uint_file_repository.dart';

class UintFileRepositoryImpl extends UintFileRepository {
  final UintFileService service;
  final Dio dio;

  UintFileRepositoryImpl(this.service, this.dio);

  @override
  Future<List<UintFile>> get(String api, int pk) async {
    try {
      final fileResult = await service.get(api, pk);
      if (fileResult == null) throw MMateException.noFilesFound;

      fileResult.sort((a, b) {
        if (a.order == null && b.order == null) return 0;
        if (a.order == null) return 1;
        if (b.order == null) return -1;
        return a.order!.compareTo(b.order!);
      });

      final tempList = await _runInBatches<Uint8List?>(
        totalCount: fileResult.length,
        batchSize: 4,
        taskBuilder: (indices) {
          return indices.map((i) async {
            final file = fileResult[i];
            try {
              final result = await dio.get<Uint8List>(
                '/api/file/${file.id}',
                options: Options(responseType: ResponseType.bytes),
              );
              return result.data;
            } catch (e) {
              Log.e('❌ 이미지 로드 실패: ${file.id}');
              return null;
            }
          }).toList();
        },
      );

      final result = fileResult.asMap().entries.where((e) {
        return tempList[e.key] != null;
      }).map((e) {
        final response = UintFileResponseDto(
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
        );
        final image = tempList[e.key];

        return response.toEntity(image!);
      }).toList();

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<T>> _runInBatches<T>({
    required List<Future<T>> Function(List<int> batchIndices) taskBuilder,
    required int totalCount,
    int batchSize = 4,
  }) async {
    List<T> results = [];

    for (int i = 0; i < totalCount; i += batchSize) {
      final end = (i + batchSize).clamp(0, totalCount);
      final indices = List.generate(end - i, (index) => i + index);

      final batchResults = await Future.wait(taskBuilder(indices));
      results.addAll(batchResults);
    }

    return results;
  }

  @override
  Future<UintFile> getLast(String api, int pk, bool? isFirst) async {
    try {
      final tempResult = await service.get(api, pk);
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

      final response = UintFileResponseDto(
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
      );

      return response.toEntity(
        result.data,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> post(
    String api,
    int pk,
    List<UintFile> files,
  ) async {
    try {
      final multipartFiles = files.map((e) => e.toMultipart()).toList();

      await service.post(api, pk, multipartFiles);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future delete(String? api, int? id) async {
    try {
      final result = await service.get(api, id);
      if (result != null) {
        await Future.wait(result.map((e) => service.delete(e.id)));
      }
    } catch (e) {
      rethrow;
    }
  }
}
