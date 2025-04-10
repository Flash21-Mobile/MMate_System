// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoardRequestDto _$BoardRequestDtoFromJson(Map<String, dynamic> json) =>
    _BoardRequestDto(
      name: json['name'] as String?,
      type: json['type'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$BoardRequestDtoToJson(_BoardRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'content': instance.content,
    };
