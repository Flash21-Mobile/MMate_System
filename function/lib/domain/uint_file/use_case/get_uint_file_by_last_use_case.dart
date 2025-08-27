import 'package:function_system/data/uint_file/repository/uint_file_repository.dart';

import '../../../data/file/repository/file_repository.dart';
import '../../uint_file/entity/uint_file.dart';

class GetUintFileByLastUseCase {
  final UintFileRepository repository;

  GetUintFileByLastUseCase(this.repository);

  Future<UintFile> execute(
      {required String api, required int id, bool? isFirst}) async {
    try {
      return await repository.getLast(api, id, isFirst);
    } catch (e) {
      rethrow;
    }
  }
}