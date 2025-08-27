import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:function_system/domain/account/entity/account/account.dart';

part 'geocoder.freezed.dart';

@freezed
abstract class Geocoder with _$Geocoder {
  const factory Geocoder({
    required final Account accountEntity,
    required final double lat,
    required final double lng,
  }) = _Geocoder;
}