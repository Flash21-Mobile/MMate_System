import 'package:json_annotation/json_annotation.dart';

import '../../../domain/aricle/article_entity.dart';
import '../../../utilities/date_format.dart';
import '../../account/response/account_response_dto.dart';
import '../../board/request/board_request_dto.dart';

part 'article_response_dto.g.dart';

@JsonSerializable()
class ArticleResponseDto {
  int? id;
  AccountResponseDto? account;
  BoardRequestDto? board;
  String? title;
  String? content;
  String? time;
  int? viewCnt;

  ArticleResponseDto(
      {this.id,
      this.account,
      this.board,
      this.title,
      this.content,
      this.time,
      this.viewCnt});

  factory ArticleResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ArticleResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleResponseDtoToJson(this);

  ArticleEntity get toEntity => ArticleEntity(
      id: id ?? 0,
      boardId: board?.id ?? 0,
      boardName: board?.name ?? '',
      content: content,
      title: title,
      viewCnt: viewCnt ?? 0,
      account: account?.toEntity(),
      time: DateFormat.formatStringToDateTime(time));
}
