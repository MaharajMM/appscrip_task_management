import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'DEVELOPMENT_BASE_URL')
  static const String developmentBaseUrl = _Env.developmentBaseUrl;

  @EnviedField(varName: 'DEVELOPMENT_TASKS_URL')
  static const String developmentTasksUrl = _Env.developmentTasksUrl;
}
