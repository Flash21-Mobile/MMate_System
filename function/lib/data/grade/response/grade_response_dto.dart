import 'package:function_system/domain/grade/grade_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grade_response_dto.g.dart';

@JsonSerializable()
class GradeResponseDto {
  int? id;
  String? name;
  String? positionName;
  int? order;
  int? groupOrder;
  bool? active;

  GradeResponseDto(
      {this.id,
      this.name,
      this.positionName,
      this.order,
      this.groupOrder,
      this.active});

  factory GradeResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GradeResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GradeResponseDtoToJson(this);

  GradeEntity toEntity() => GradeEntity(
        id: id!,
        name: name ?? '',
        order: order,
        groupOrder: groupOrder,
        active: active ?? true,
        positionName: positionName ?? '',
      );
}
