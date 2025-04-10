import 'dart:typed_data';

import 'package:function_system/data/shared/repository/shared_repository.dart';

class GetSharedUintUseCase {
  final SharedRepository repository;

  GetSharedUintUseCase(this.repository);

  Future<Uint8List> execute(String id) async {
    try {
      final result = await repository.loadUint(id);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}

class PostSharedUintUseCase {
  final SharedRepository _repository;

  PostSharedUintUseCase(this._repository);

  Future<Uint8List> execute(String id, Uint8List bytes) async {
    try {
      final fileResult = await _repository.saveUint(bytes, id);

      return fileResult;
    } catch (e) {
      rethrow;
    }
  }
}
