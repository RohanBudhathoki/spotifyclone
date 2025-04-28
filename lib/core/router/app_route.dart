import 'package:auto_route/auto_route.dart';
import 'package:spotifyclone/core/router/app_route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    ///splashscreen
    AutoRoute(page: SplashRoute.page, initial: true),

    ///onboarding
    AutoRoute(page: IntroductionRoute.page),
    AutoRoute(page: ChooseThemeRoute.page),

    ///Authentication
    AutoRoute(page: SignupSigninRoute.page),
    AutoRoute(page: SignupRoute.page),
    AutoRoute(page: LoginRoute.page),

    ///Homescreen
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: AudioPlayerRoute.page),
  ];
}
