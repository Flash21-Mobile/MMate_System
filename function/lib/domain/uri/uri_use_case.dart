import 'dart:io';

import 'package:function_system/data/uri/repository/uri_repository.dart';
import 'package:function_system/domain/uri/uri_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:path/path.dart' as p;

class UriPickImageUseCase {
  final UriRepository repository;

  UriPickImageUseCase(this.repository);

  Future<UriEntity> execute() async {
    try {
      final result = await repository.pickSingleImage();
      if (result == null) throw MmateException.noFilesSelected;

      String extension = p.extension(result).replaceFirst('.', '');

      return UriEntity(
          data: File(result).readAsBytesSync(), extension: extension);
    } catch (e) {
      rethrow;
    }
  }
}

class UriPickImagesUseCase {
  final UriRepository repository;

  UriPickImagesUseCase(this.repository);

  Future<List<UriEntity>> execute() async {
    try {
      final temp = await repository.pickMultipleImages();
      if (temp.isNotEmpty) {
        final result = temp.map((e) => File(e)).toList();
        return result.map((e) => UriEntity(
              data: e.readAsBytesSync(),
              extension: p.extension(e.path).replaceFirst('.', ''),
            )).toList();
      }

      throw 'not pick file';
    } catch (e) {
      rethrow;
    }
  }
}

class UriPickFileUseCase {
  final UriRepository repository;

  UriPickFileUseCase(this.repository);

  Future<File> execute() async {
    try {
      final temp = await repository.pickFile();
      if (temp != null) {
        final result = File(temp);
        return result;
      }

      throw 'not pick file';
    } catch (e) {
      rethrow;
    }
  }
}
