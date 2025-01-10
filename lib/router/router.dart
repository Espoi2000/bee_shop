import 'package:auto_route/auto_route.dart';
import 'package:beep_shop/router/router.gr.dart';

// run this command after  the file to generate the routes
// flutter pub run build_runner build

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: HomeTabbsarRoute.page)
      ];
}
