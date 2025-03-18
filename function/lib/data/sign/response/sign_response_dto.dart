import 'package:json_annotation/json_annotation.dart';

part 'sign_response_dto.g.dart';

@JsonSerializable()
class SignResponseDto {
  String? token;

  SignResponseDto(
      {this.token});

  factory SignResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignResponseDtoToJson(this);
}