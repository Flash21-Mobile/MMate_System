import 'package:function_system/domain/schedule/repository/schedule_repository.dart';

import '../entity/schedule/schedule.dart';

class GetScheduleByIdUseCase {
  final ScheduleRepository _scheduleRepository;

  GetScheduleByIdUseCase(this._scheduleRepository);

  Future<Schedule> execute(int id) async {
    try {
      final result = await _scheduleRepository.get(id: id);

      if (result.isEmpty) {
        throw Exception('No data found');
      } else {
        return result.first;
      }
    } catch (e) {
      rethrow;
    }
  }
}
