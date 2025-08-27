import 'package:function_system/domain/schedule/repository/schedule_repository.dart';

class DeleteScheduleUseCase {
  final ScheduleRepository _scheduleRepository;

  DeleteScheduleUseCase(this._scheduleRepository);

  Future<void> execute(int id) async {
    return await _scheduleRepository.delete(id);
  }
}
