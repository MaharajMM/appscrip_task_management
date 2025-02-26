import 'package:appscrip_task_management/data/model/login_model.dart';
import 'package:appscrip_task_management/shared/exception/base_exception.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class ILoginRepository {
  Future<Result<LoginModel, APIException>> loginUser({
    required String email,
    required String passWord,
  });
}
