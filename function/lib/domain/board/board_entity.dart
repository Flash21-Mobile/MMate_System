class BoardEntity {
  final int id;
  final String name;
  final BoardType firstInfo;
  final String? secondInfo;

  const BoardEntity(
      {required this.id,
      required this.name,
      required this.firstInfo,
      this.secondInfo});
}

enum BoardType {
  announcement('ANNOUNCEMENT'),
  advertise('ADVERTISE'),
  calendar('CALENDAR'),
  board('BOARD'),
  free('FREE');

  final String type;

  const BoardType(this.type);
}
