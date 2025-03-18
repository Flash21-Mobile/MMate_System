import 'package:json_annotation/json_annotation.dart';

part 'sign_request_dto.g.dart';

@JsonSerializable()
class SignRequestDto {
  String? name;
  String? cellphone;

  SignRequestDto({this.name, this.cellphone});

  factory SignRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignRequestDtoToJson(this);
}
