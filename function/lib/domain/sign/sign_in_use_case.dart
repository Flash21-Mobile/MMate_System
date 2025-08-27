import '../../data/fcm/repository/fcm_repository.dart';
import '../../data/login/repository/login_repository.dart';
import '../../data/sign/repository/sign_repository.dart';

class SignInUseCase {
  final SignRepository repository;
  final LoginRepository loginRepository;
  final FcmRepository _fcmRepository;

  SignInUseCase(
      this.repository,
      this.loginRepository,
      this._fcmRepository,
      );

  Future<String> execute(
      String? fcmToken, {
        String? name,
        required String cellphone,
      }) async {
    try {
      final result = await repository.signIn(name, cellphone);
      await repository.setToken(result);

      if (fcmToken != null) {
        await _fcmRepository.putFcm(fcmToken);
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}