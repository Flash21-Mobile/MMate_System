// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grade_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GradeRequestDto _$GradeRequestDtoFromJson(Map<String, dynamic> json) =>
    GradeRequestDto(
      name: json['name'] as String,
      positionName: json['positionName'] as String,
      order: (json['order'] as num).toInt(),
      groupOrder: (json['groupOrder'] as num).toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$GradeRequestDtoToJson(GradeRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'positionName': instance.positionName,
      'order': instance.order,
      'groupOrder': instance.groupOrder,
      'active': instance.active,
    };
