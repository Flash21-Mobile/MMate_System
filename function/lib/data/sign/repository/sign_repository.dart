abstract class SignRepository {
  Future setToken(String token);

  Future<String?> getToken();

  Future setCellphone(String cellphone);

  Future<String> getCellphone();

  Future<String> signIn(
    String? name,
    String cellphone,
  );
}
