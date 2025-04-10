import 'package:function_system/domain/board/board_type.dart';

class BoardEntity {
  final int id;
  final String name;
  final BoardType type;
  final String content;

  const BoardEntity({
    required this.id,
    required this.name,
    required this.type,
    required this.content,
  });
}