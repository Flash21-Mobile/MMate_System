import 'package:function_system/domain/schedule/entity/new_schedule/new_schedule.dart';

import '../entity/schedule/schedule.dart';

abstract class ScheduleRepository {
  Future<List<Schedule>> get({int? id});
  Future<Schedule> post(NewSchedule newSchedule);
  Future<void> delete(int id);
}