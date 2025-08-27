import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'coordinate.freezed.dart';

@freezed
abstract class Coordinate with _$Coordinate {
  const factory Coordinate({
    required final double lat,
    required final double lng,
  }) = _Coordinate;
}