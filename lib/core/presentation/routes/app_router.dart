// flutter pub run build_runner watch --delete-conflicting-outputs

import 'package:auto_route/auto_route.dart';

import 'package:repo_viewer/core/presentation/routes/app_router.gr.dart';

//Routes are used as navigators indeed these are navigators 2.0.. this code is wrote
// according to the documentation of Routes pacakage
//https://www.youtube.com/watch?v=c84S_tB-Vz8

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: SignInRoute.page, path: '/sign-In'),
        AutoRoute(page: AuthorizationRoute.page, path: '/auth'),
        AutoRoute(page: StarredReposRoute.page, path: '/starred'),
      ];
}
