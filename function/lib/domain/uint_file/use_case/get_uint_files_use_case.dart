import 'package:function_system/data/uint_file/repository/uint_file_repository.dart';

import '../../../data/file/repository/file_repository.dart';
import '../../uint_file/entity/uint_file.dart';

class GetUintFilesUseCase {
  final UintFileRepository repository;

  GetUintFilesUseCase(this.repository);

  Future<List<UintFile>> execute(
      {required String api, required int id, bool? isFirst}) async {
    try {
      final result = await repository.get(api, id);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}