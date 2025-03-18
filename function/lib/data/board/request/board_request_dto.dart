import 'package:json_annotation/json_annotation.dart';

part 'board_request_dto.g.dart';

@JsonSerializable()
class BoardRequestDto {
  int? id;
  String? name;

  BoardRequestDto({this.id, this.name});

  factory BoardRequestDto.fromJson(Map<String, dynamic> json) =>
      _$BoardRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BoardRequestDtoToJson(this);
}
