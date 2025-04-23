// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:spotifyclone/features/authentication/presentation/login/login.dart'
    as _i3;
import 'package:spotifyclone/features/authentication/presentation/signup/signup_screen.dart'
    as _i4;
import 'package:spotifyclone/features/authentication/presentation/signup_signin/signup_signin_screen.dart'
    as _i5;
import 'package:spotifyclone/features/choose_theme/presentation/choose_theme/choose_theme_screen.dart'
    as _i1;
import 'package:spotifyclone/features/introduction/introduction_screen.dart'
    as _i2;
import 'package:spotifyclone/features/splash/splash_screen.dart' as _i6;

/// generated route for
/// [_i1.ChooseThemeScreen]
class ChooseThemeRoute extends _i7.PageRouteInfo<void> {
  const ChooseThemeRoute({List<_i7.PageRouteInfo>? children})
    : super(ChooseThemeRoute.name, initialChildren: children);

  static const String name = 'ChooseThemeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChooseThemeScreen();
    },
  );
}

/// generated route for
/// [_i2.IntroductionScreen]
class IntroductionRoute extends _i7.PageRouteInfo<void> {
  const IntroductionRoute({List<_i7.PageRouteInfo>? children})
    : super(IntroductionRoute.name, initialChildren: children);

  static const String name = 'IntroductionRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.IntroductionScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}

/// generated route for
/// [_i4.SignupScreen]
class SignupRoute extends _i7.PageRouteInfo<void> {
  const SignupRoute({List<_i7.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.SignupScreen();
    },
  );
}

/// generated route for
/// [_i5.SignupSigninScreen]
class SignupSigninRoute extends _i7.PageRouteInfo<void> {
  const SignupSigninRoute({List<_i7.PageRouteInfo>? children})
    : super(SignupSigninRoute.name, initialChildren: children);

  static const String name = 'SignupSigninRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SignupSigninScreen();
    },
  );
}

/// generated route for
/// [_i6.SplashScreen]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SplashScreen();
    },
  );
}
