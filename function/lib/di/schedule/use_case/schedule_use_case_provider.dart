import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/domain/schedule/use_case/get_schedules_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../domain/schedule/use_case/delete_schedule_use_case.dart';
import '../../../domain/schedule/use_case/get_schedule_by_id_use_case.dart';
import '../../../domain/schedule/use_case/post_schedule_use_case.dart';
import '../repository/schedule_repository_provider.dart';

part 'schedule_use_case_provider.g.dart';

@riverpod
GetSchedulesUseCase getSchedulesUseCase(Ref ref) {
  final repository = ref.watch(scheduleRepositoryProvider);
  return GetSchedulesUseCase(repository);
}

@riverpod
GetScheduleByIdUseCase getScheduleByIdUseCase(Ref ref) {
  final repository = ref.watch(scheduleRepositoryProvider);
  return GetScheduleByIdUseCase(repository);
}

@riverpod
PostScheduleUseCase postScheduleUseCase(Ref ref) {
  final repository = ref.watch(scheduleRepositoryProvider);
  return PostScheduleUseCase(repository);
}

@riverpod
DeleteScheduleUseCase deleteScheduleUseCase(Ref ref) {
  final repository = ref.watch(scheduleRepositoryProvider);
  return DeleteScheduleUseCase(repository);
}
