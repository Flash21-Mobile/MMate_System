import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:function_system/domain/calendar/entity/calendar.dart';

part 'schedule.freezed.dart';

@freezed
abstract class Schedule with _$Schedule {
  const factory Schedule({
    required int id,
    required Calendar calendar,
    required DateTime time,
    required String title,
    required String content,
  }) = _Schedule;
}