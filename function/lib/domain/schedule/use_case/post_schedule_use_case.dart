import 'package:function_system/domain/schedule/entity/new_schedule/new_schedule.dart';
import 'package:function_system/domain/schedule/repository/schedule_repository.dart';

import '../entity/schedule/schedule.dart';

class PostScheduleUseCase {
  final ScheduleRepository _scheduleRepository;

  PostScheduleUseCase(this._scheduleRepository);

  Future<Schedule> post(NewSchedule newSchedule) async {
    return await _scheduleRepository.post(newSchedule);
  }
}
