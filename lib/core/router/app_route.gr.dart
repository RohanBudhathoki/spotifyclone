// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:spotifyclone/features/choose_theme/presentation/choose_theme/choose_theme_screen.dart'
    as _i1;
import 'package:spotifyclone/features/introduction/introduction_screen.dart'
    as _i2;
import 'package:spotifyclone/features/splash/splash_screen.dart' as _i3;

/// generated route for
/// [_i1.ChooseThemeScreen]
class ChooseThemeRoute extends _i4.PageRouteInfo<void> {
  const ChooseThemeRoute({List<_i4.PageRouteInfo>? children})
    : super(ChooseThemeRoute.name, initialChildren: children);

  static const String name = 'ChooseThemeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.ChooseThemeScreen();
    },
  );
}

/// generated route for
/// [_i2.IntroductionScreen]
class IntroductionRoute extends _i4.PageRouteInfo<void> {
  const IntroductionRoute({List<_i4.PageRouteInfo>? children})
    : super(IntroductionRoute.name, initialChildren: children);

  static const String name = 'IntroductionRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.IntroductionScreen();
    },
  );
}

/// generated route for
/// [_i3.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.SplashScreen();
    },
  );
}
