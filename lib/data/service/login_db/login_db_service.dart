import 'package:appscrip_task_management/core/local_storage/app_storage.dart';

import 'i_login_db_service.dart';

class LoginDbService implements ILoginDbService {
  final AppStorage appStorage;
  LoginDbService({
    required this.appStorage,
  });
  final loginTokenKey = 'login_jwt_token';
  @override
  Future<void> deleteLoginTokend() async {
    final box = appStorage.appBox;
    await box?.delete(loginTokenKey);
  }

  @override
  String? getLoginToken() {
    final box = appStorage.appBox;
    final token = box?.get(loginTokenKey) as String?;
    if (token != null) {
      return token;
    } else {
      return null;
    }
  }

  @override
  Future<void> saveLoginToken({required String jwtToken}) async {
    final box = appStorage.appBox;
    await box?.put(loginTokenKey, jwtToken);
  }
}
