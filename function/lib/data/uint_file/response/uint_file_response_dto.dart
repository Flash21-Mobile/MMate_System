import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:function_system/domain/uint_file/entity/uint_file.dart';
import 'package:function_system/utilities/exception/exception.dart';

part 'uint_file_response_dto.g.dart';

@JsonSerializable()
class UintFileResponseDto {
  int? id;
  String? name;
  String? saveName;
  String? path;
  int? size;
  String? type;
  String? extension;
  int? order;
  String? api;
  int? pk;

  UintFileResponseDto({
    this.id,
    this.name,
    this.saveName,
    this.path,
    this.size,
    this.type,
    this.extension,
    this.order,
    this.api,
    this.pk,
  });

  UintFile toEntity(Uint8List image) {
    return UintFile(
      data: image,
      extension: extension ?? '',
    );
  }

  factory UintFileResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UintFileResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UintFileResponseDtoToJson(this);
}
