// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardResponseDto _$BoardResponseDtoFromJson(Map<String, dynamic> json) =>
    BoardResponseDto(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BoardResponseDtoToJson(BoardResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
