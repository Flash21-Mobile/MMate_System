import 'package:dio/dio.dart';
import 'package:function_system/data/grade/repository/grade_repository.dart';
import 'package:function_system/data/grade/service/grade_service.dart';

import '../response/grade_response_dto.dart';
import '../request/grade_request_dto.dart';

class GradeRepositoryImpl extends GradeRepository {
  final GradeService service;
  final Dio dio;

  GradeRepositoryImpl(this.service, this.dio);

  @override
  Future<List<GradeResponseDto>> getGrades({
    int? id,
    String? positionName,
    String? name,
  }) async {
    try {
      final result = await service.getGrades(
        id,
        positionName,
        name,
      );
      return result ?? [];
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<GradeResponseDto> postGrade({
    required String name,
    required String positionName,
    required int order,
    required int groupOrder,
    required bool active,
  }) async {
    try {
      final result = await service.postGrade(
        GradeRequestDto(
          name: name,
          positionName: positionName,
          order: order,
          groupOrder: groupOrder,
          active: active,
        ),
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteGrade(int id) async {
    try {
      await service.deleteGrade(id);
      return;
    } catch (e) {
      print('여기서 난다요 ${e}');
      rethrow;
    }
  }
}
