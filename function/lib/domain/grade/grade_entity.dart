class GradeEntity {
  int id;
  String name;
  String positionName;
  int? order;
  int? groupOrder;
  bool active;

  GradeEntity({
    required this.id,
    required this.name,
    required this.positionName,
    required this.order,
    required this.groupOrder,
    required this.active,
  });
}
