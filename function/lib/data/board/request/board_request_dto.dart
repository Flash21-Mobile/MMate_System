import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_request_dto.freezed.dart';

part 'board_request_dto.g.dart';

@freezed
abstract class BoardRequestDto with _$BoardRequestDto {
  factory BoardRequestDto({
    String? name,
    String? type,
    String? content,
  }) = _BoardRequestDto;

  factory BoardRequestDto.fromJson(Map<String, dynamic> json) =>
      _$BoardRequestDtoFromJson(json);
}
