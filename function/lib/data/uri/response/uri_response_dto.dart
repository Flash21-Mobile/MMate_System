import 'dart:typed_data';

import 'package:function_system/domain/uri/uri_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';

class UriResponseDTO {
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
  Uint8List? image;

  UriResponseDTO(
      {this.id,
      this.name,
      this.saveName,
      this.path,
      this.size,
      this.type,
      this.extension,
      this.order,
      this.api,
      this.pk,
      this.image});

  UriEntity get toEntity {
    if (image == null) throw MMateException.cannotFormat;

    return UriEntity(
      data: image!,
      extension: extension ?? '',
    );
  }
}
