import 'package:function_system/domain/grade/grade_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grade_request_dto.g.dart';

@JsonSerializable()
class GradeRequestDto {
  String name;
  String positionName;
  int order;
  int groupOrder;
  bool active;

  GradeRequestDto({
    required this.name,
    required this.positionName,
    required this.order,
    required this.groupOrder,
    required this.active,
  });

  factory GradeRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GradeRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GradeRequestDtoToJson(this);
}
