import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:function_system/data/file/repository/file_repository.dart';
import 'package:function_system/data/login/repository/login_repository.dart';
import 'package:function_system/data/uri/repository/uri_repository.dart';
import 'package:function_system/domain/file/file_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';

class GetCardUseCase {
  final FileRepository repository;
  final int myId;

  GetCardUseCase(this.repository, this.myId);

  Future<File> execute() async {
    try {
      final result = await repository.loadCard();

      return result;
    } catch (e) {
      rethrow;
    }
  }
}

class PostCardUseCase {
  final FileRepository repository;
  final UriRepository uriRepository;
  final int myId;

  PostCardUseCase(this.repository, this.uriRepository, this.myId);

  Future<File> execute() async {
    try {
      final uriResult = await uriRepository.pickSingleImage();
      if (uriResult == null) {
        throw MmateException.noFilesSelected;
      }

      // todo c: 이거 분리하기 레포지토리
      await repository.saveCard(File(uriResult));

      final fileResult = await repository.loadCard();

      return fileResult;
    } catch (e) {
      rethrow;
    }
  }
}
