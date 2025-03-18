import '../request/fcm_request_dto.dart';

abstract class FcmRepository {
  Future<FcmRequestDto?> putFcm(String fcmToken);
}