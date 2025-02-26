abstract class ILoginDbService {
  Future<void> saveLoginToken({required String jwtToken});
  Future<void> deleteLoginTokend();
  String? getLoginToken();
}
