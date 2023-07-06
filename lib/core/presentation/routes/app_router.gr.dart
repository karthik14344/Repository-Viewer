// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:repo_viewer/auth/presentation/authorization_page.dart' as _i4;
import 'package:repo_viewer/auth/presentation/sign_in_page.dart' as _i1;
import 'package:repo_viewer/splash/presentation/splash_page.dart' as _i2;
import 'package:repo_viewer/starred_repos/presentation/starred_repos_page.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SignInPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashPage(),
      );
    },
    StarredReposRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.StarredReposPage(),
      );
    },
    AuthorizationRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AuthorizationPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SignInPage]
class SignInRoute extends _i5.PageRouteInfo<void> {
  const SignInRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashPage]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.StarredReposPage]
class StarredReposRoute extends _i5.PageRouteInfo<void> {
  const StarredReposRoute({List<_i5.PageRouteInfo>? children})
      : super(
          StarredReposRoute.name,
          initialChildren: children,
        );

  static const String name = 'StarredReposRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AuthorizationPage]
class AuthorizationRoute extends _i5.PageRouteInfo<void> {
  const AuthorizationRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AuthorizationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthorizationRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
