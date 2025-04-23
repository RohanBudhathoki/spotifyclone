import 'package:auto_route/auto_route.dart';
import 'package:spotifyclone/core/router/app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    ///splashscreen
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: IntroductionRoute.page),
    AutoRoute(page: ChooseThemeRoute.page),
    AutoRoute(page: SignupSigninRoute.page),
  ];
}
