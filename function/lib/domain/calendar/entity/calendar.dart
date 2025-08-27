import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'calendar.freezed.dart';

@freezed
abstract class Calendar with _$Calendar {
  const factory Calendar({
    required int id,
    required String name,
  }) = _Calendar;
}
