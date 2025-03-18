import 'package:json_annotation/json_annotation.dart';

part 'fcm_request_dto.g.dart';

@JsonSerializable()
class FcmRequestDto {
  List<String>? fcmToken;

  FcmRequestDto({this.fcmToken});

  factory FcmRequestDto.fromJson(Map<String, dynamic> json) =>
      _$FcmRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FcmRequestDtoToJson(this);
}
