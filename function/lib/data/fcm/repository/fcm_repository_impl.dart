import '../request/fcm_request_dto.dart';
import '../service/fcm_service.dart';
import 'fcm_repository.dart';

class FcmRepositoryImpl extends FcmRepository {
  FcmService service;

  FcmRepositoryImpl(this.service);

  @override
  Future<FcmRequestDto?> putFcm(String fcmToken) async {
    try {
      final getResult = await service.getFcm();

      if (getResult.fcmToken?.contains(fcmToken) == false) {
        final putResult =
            await service.putFcm(dto: FcmRequestDto(fcmToken: [...getResult.fcmToken??[], fcmToken]));
        return putResult;
      }
      return null;
    } catch (e) {
      print('hello ditto hello $e');
      return null;
    }
  }
}
