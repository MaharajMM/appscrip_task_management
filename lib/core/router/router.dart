import 'package:appscrip_task_management/core/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';

/// This class used for defined routes and paths na dother properties
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  late final List<AutoRoute> routes = [
    AutoRoute(
      page: CounterRoute.page,
      path: '/counter',
      // initial: true,
    ),
    AutoRoute(
      page: LoginRoute.page,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: HomeRoute.page,
      path: '/home',
    ),
  ];
}
