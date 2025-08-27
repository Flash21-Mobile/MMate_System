import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:function_system/data/board/response/board_response_dto.dart';

import '../../account/response/account_response_dto.dart';

part 'article_response_dto.g.dart';

@JsonSerializable()
class ArticleResponseDto {
  int id;
  AccountResponseDto? account;
  BoardResponseDto? board;
  String? title;
  String? content;
  DateTime? time;
  int? viewCnt;

  ArticleResponseDto({
    required this.id,
    this.account,
    this.board,
    this.title,
    this.content,
    this.time,
    this.viewCnt,
  });

  factory ArticleResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseDtoToJson(this);
}
