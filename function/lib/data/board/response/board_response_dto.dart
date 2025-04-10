import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:function_system/domain/board/board_entity.dart';
import 'package:function_system/domain/board/board_type.dart';

part 'board_response_dto.g.dart';

@JsonSerializable()
class BoardResponseDto {
  final int? id;
  final String? name;
  final String? type;
  final String? content;

  const BoardResponseDto({
    this.id,
    this.name,
    this.type,
    this.content,
  });

  factory BoardResponseDto.fromJson(Map<String, dynamic> json) =>
      _$BoardResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BoardResponseDtoToJson(this);

  BoardEntity toEntity() {
    return BoardEntity(
      id: id ?? 0,
      name: name ?? '',
      type: BoardType.getType(type ?? ''),
      content: content ?? '',
    );
  }
}
