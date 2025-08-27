import 'package:function_system/data/calendar/mapper/calendar_mapper.dart';
import 'package:function_system/data/schedule/response/schedule_response_dto.dart';
import 'package:function_system/domain/schedule/entity/new_schedule/new_schedule.dart';
import 'package:function_system/domain/schedule/entity/schedule/schedule.dart';

import '../request/schedule_request_dto.dart';

class ScheduleMapper {
  static Schedule toEntity(ScheduleResponseDto responseDto) {
    return Schedule(
        id: responseDto.id,
        calendar: CalendarMapper.toEntity(responseDto.calendar),
        time: responseDto.time,
        title: responseDto.title,
        content: responseDto.content);
  }

  static ScheduleRequestDto toDto(NewSchedule newSchedule) {
    return ScheduleRequestDto(
        calendar: newSchedule.calendar,
        time: newSchedule.time,
        title: newSchedule.title,
        content: newSchedule.content);
  }
}
