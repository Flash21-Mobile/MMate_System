import 'package:function_system/data/schedule/mapper/schedule_mapper.dart';
import 'package:function_system/domain/schedule/entity/new_schedule/new_schedule.dart';
import 'package:function_system/domain/schedule/repository/schedule_repository.dart';

import '../../../domain/schedule/entity/schedule/schedule.dart';
import '../service/schedule_service.dart';

class ScheduleRepositoryImpl extends ScheduleRepository {
  final ScheduleService service;

  ScheduleRepositoryImpl(this.service);

  @override
  Future<List<Schedule>> get({int? id}) async {
    return await service.get(id).then((value) {
      return value.map((e) => ScheduleMapper.toEntity(e)).toList();
    });
  }

  @override
  Future<void> delete(int id) async {
    return await service.delete(id);
  }

  @override
  Future<Schedule> post(NewSchedule newSchedule) async {
    final data = ScheduleMapper.toDto(newSchedule);

    return await service.post(data).then((value) {
      return ScheduleMapper.toEntity(value);
    });
  }
}
