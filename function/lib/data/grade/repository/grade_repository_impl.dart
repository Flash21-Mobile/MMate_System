import 'package:dio/dio.dart';
import 'package:function_system/data/grade/repository/grade_repository.dart';
import 'package:function_system/data/grade/service/grade_service.dart';

import '../response/grade_response_dto.dart';

class GradeRepositoryImpl extends GradeRepository {
  final GradeService service;
  final Dio dio;

  GradeRepositoryImpl(this.service, this.dio);

  @override
  Future<List<GradeResponseDto>> getGrades(
    String? positionName,
  ) async {
    try {
      final result = await service.getGrades(positionName);
      return result ?? [];
    } catch (e) {
      rethrow;
    }
  }
}
