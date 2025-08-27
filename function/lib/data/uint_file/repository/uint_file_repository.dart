import 'package:function_system/domain/uint_file/entity/uint_file.dart';

import '../response/uint_file_response_dto.dart';

abstract class UintFileRepository {
  Future<List<UintFile>> get(String api, int pk);

  Future<UintFile> getLast(String api, int pk, bool? isFirst);

  Future<void> post(
      String api, int pk, List<UintFile> files);

  Future delete(String? api, int? id);
}