import 'package:function_system/data/calendar/response/calendar_response_dto.dart';

import '../../../domain/calendar/entity/calendar.dart';

class CalendarMapper {
  static Calendar toEntity(CalendarResponseDto responseDto) {
    return Calendar(id: responseDto.id, name: responseDto.name);
  }
}
