// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileResponseDTO _$FileResponseDTOFromJson(Map<String, dynamic> json) =>
    FileResponseDTO(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      saveName: json['saveName'] as String?,
      path: json['path'] as String?,
      size: (json['size'] as num?)?.toInt(),
      type: json['type'] as String?,
      extension: json['extension'] as String?,
      order: (json['order'] as num?)?.toInt(),
      api: json['api'] as String?,
      pk: (json['pk'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FileResponseDTOToJson(FileResponseDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'saveName': instance.saveName,
      'path': instance.path,
      'size': instance.size,
      'type': instance.type,
      'extension': instance.extension,
      'order': instance.order,
      'api': instance.api,
      'pk': instance.pk,
    };
