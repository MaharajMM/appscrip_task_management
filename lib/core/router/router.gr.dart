// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

import 'package:appscrip_task_management/features/counter/view/counter_page.dart' deferred as _i1;
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:appscrip_task_management/features/home/view/home_page.dart' as _i2;
import 'package:appscrip_task_management/features/login/view/login_page.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i4;

/// generated route for
/// [_i1.CounterPage]
class CounterRoute extends _i4.PageRouteInfo<void> {
  const CounterRoute({List<_i4.PageRouteInfo>? children})
      : super(
          CounterRoute.name,
          initialChildren: children,
        );

  static const String name = 'CounterRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return _i4.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.CounterPage(),
      );
    },
  );
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}
