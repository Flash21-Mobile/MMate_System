import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'new_schedule.freezed.dart';

@freezed
abstract class NewSchedule with _$NewSchedule {
  const factory NewSchedule({
    required int calendar,
    required DateTime time,
    required String title,
    required String content,
  }) = _NewSchedule;
}