import 'package:function_system/domain/schedule/repository/schedule_repository.dart';

import '../entity/schedule/schedule.dart';

class GetSchedulesUseCase {
  final ScheduleRepository _scheduleRepository;

  GetSchedulesUseCase(this._scheduleRepository);

  Future<List<Schedule>> execute() async {
    try {
      return await _scheduleRepository.get();
    } catch (e) {
      rethrow;
    }
  }
}
