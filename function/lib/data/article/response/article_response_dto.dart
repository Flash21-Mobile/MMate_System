import 'package:function_system/data/board/response/board_response_dto.dart';
import 'package:function_system/domain/account/entity/account/account_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../domain/aricle/entity/article/article_entity.dart';
import '../../../domain/uri/uri_entity.dart';
import '../../../utilities/date_format.dart';
import '../../account/response/account_response_dto.dart';

part 'article_response_dto.g.dart';

@JsonSerializable()
class ArticleResponseDto {
  int? id;
  AccountResponseDto? account;
  BoardResponseDto? board;
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

}
