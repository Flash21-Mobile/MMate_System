import 'package:function_system/domain/account/account_entity.dart';

class ArticleEntity {
  final int id;
  final int boardId;
  final String boardName;   // todo c: 이거 언젠간 지우고 엔티티로 대체하자
  final String? title;
  final String? content;
  final DateTime? time;
  final List<String>? images;

  final int viewCnt;
  final AccountEntity? account;

  ArticleEntity(
      {required this.id,
      required this.boardId,
        required this.boardName,
      required this.title,
      required this.content,
      required this.time,
      this.images,
      required this.viewCnt,
      required this.account});
}
