class ImageBuilderKey {
  final int id;
  final String api;
  final bool isLast;

  ImageBuilderKey(this.id, this.api, this.isLast);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ImageBuilderKey &&
              other.id == id &&
              other.api == api &&
              other.isLast == isLast);

  @override
  int get hashCode => id.hashCode ^ api.hashCode ^ isLast.hashCode;
}