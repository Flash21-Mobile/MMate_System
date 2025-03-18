class FileEntity {
  int id;
  String name;
  String path;
  String extension;
  int? order;
  String api;
  int? pk;

  FileEntity(
      {required this.id,
        required  this.name,
        required this.path,
        required this.extension,
        required this.order,
        required this.api,
        required this.pk});
}