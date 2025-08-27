import 'package:function_system/domain/file/entity/file.dart';
import 'package:json_annotation/json_annotation.dart';

part 'file_response_dto.g.dart';

@JsonSerializable()
class FileResponseDTO {
  int? id;
  String? name;
  String? saveName;
  String? path;
  int? size;
  String? type;
  String? extension;
  int? order;
  String? api;
  int? pk;

  FileResponseDTO(
      {this.id,
      this.name,
      this.saveName,
      this.path,
      this.size,
      this.type,
      this.extension,
      this.order,
      this.api,
      this.pk});

  factory FileResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$FileResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$FileResponseDTOToJson(this);

  File get toEntity => File(
        id: id ?? 0,
        name: name ?? '',
        path: path ?? '',
        extension: extension ?? '',
        order: order,
        api: api ?? '',
        pk: pk,
      );
}
