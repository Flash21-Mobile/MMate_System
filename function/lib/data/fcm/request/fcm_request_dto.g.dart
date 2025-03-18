// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FcmRequestDto _$FcmRequestDtoFromJson(Map<String, dynamic> json) =>
    FcmRequestDto(
      fcmToken: (json['fcmToken'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FcmRequestDtoToJson(FcmRequestDto instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
    };
