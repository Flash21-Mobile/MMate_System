import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'grade.freezed.dart';

@freezed
abstract class Grade with _$Grade {
  const factory Grade({
    required final int id,
    required final String name,
    required final String positionName,
    required final int? order,
    required final int? groupOrder,
    required final bool active,
  }) = _Grade;
}
