// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleResponseDto _$ArticleResponseDtoFromJson(Map<String, dynamic> json) =>
    ArticleResponseDto(
      id: (json['id'] as num?)?.toInt(),
      account: json['account'] == null
          ? null
          : AccountResponseDto.fromJson(
              json['account'] as Map<String, dynamic>),
      board: json['board'] == null
          ? null
          : BoardRequestDto.fromJson(json['board'] as Map<String, dynamic>),
      title: json['title'] as String?,
      content: json['content'] as String?,
      time: json['time'] as String?,
      viewCnt: (json['viewCnt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArticleResponseDtoToJson(ArticleResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account': instance.account,
      'board': instance.board,
      'title': instance.title,
      'content': instance.content,
      'time': instance.time,
      'viewCnt': instance.viewCnt,
    };
