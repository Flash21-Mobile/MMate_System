import 'dart:typed_data';

import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/domain/file/file_entity.dart';
import 'package:function_system/domain/uri/uri_entity.dart';

class GetFilesUseCase {
  final FileRepository repository;

  GetFilesUseCase(this.repository);

  Future<List<FileEntity>> execute({
    required String api,
    required int id,
  }) async {
    try {
      final result = await repository.getFiles(api, id);
      return result.map((e) => e.toEntity).toList();
    } catch (e) {
      rethrow;
    }
  }
}

class GetUintUseCase {
  final FileRepository repository;

  GetUintUseCase(this.repository);

  Future<UriEntity> execute(
      {required String api, required int id, bool? isFirst}) async {
    try {
      final result = await repository.getImage(api, id, isFirst);
      return result.toEntity;
    } catch (e) {
      rethrow;
    }
  }
}

class GetUintListUseCase {
  final FileRepository repository;

  GetUintListUseCase(this.repository);

  Future<List<UriEntity>> execute(
      {required String api, required int id, bool? isFirst}) async {
    try {
      final result = await repository.getImages(api, id);
      return result
          .where((e) => e.image != null)
          .map((e) => e.toEntity)
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
