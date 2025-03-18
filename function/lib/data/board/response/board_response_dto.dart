import 'package:function_system/domain/board/board_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'board_response_dto.g.dart';

@JsonSerializable()
class BoardResponseDto {
  int? id;
  String? name;

  BoardResponseDto({this.id, this.name,});

  factory BoardResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BoardResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BoardResponseDtoToJson(this);

  BoardEntity toEntity() {
    return BoardEntity(id: id??0, name: name??'', firstInfo: BoardType.announcement);
  }
}
