// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardRequestDto _$BoardRequestDtoFromJson(Map<String, dynamic> json) =>
    BoardRequestDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BoardRequestDtoToJson(BoardRequestDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
