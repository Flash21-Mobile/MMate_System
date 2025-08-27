import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_response_dto.g.dart';

@JsonSerializable()
class CalendarResponseDto {
  int id;
  String name;

  CalendarResponseDto({required this.id,required  this.name});

  factory CalendarResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarResponseDtoToJson(this);
}
