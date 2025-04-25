// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:spotifyclone/features/authentication/presentation/login/login.dart'
    as _i5;
import 'package:spotifyclone/features/authentication/presentation/signup/signup_screen.dart'
    as _i6;
import 'package:spotifyclone/features/authentication/presentation/signup_signin/signup_signin_screen.dart'
    as _i7;
import 'package:spotifyclone/features/choose_theme/presentation/choose_theme/choose_theme_screen.dart'
    as _i2;
import 'package:spotifyclone/features/home/presentation/audio_player_screen/audio_player_screen.dart'
    as _i1;
import 'package:spotifyclone/features/home/presentation/homescreen/home_screen.dart'
    as _i3;
import 'package:spotifyclone/features/introduction/introduction_screen.dart'
    as _i4;
import 'package:spotifyclone/features/splash/splash_screen.dart' as _i8;

/// generated route for
/// [_i1.AudioPlayerScreen]
class AudioPlayerRoute extends _i9.PageRouteInfo<AudioPlayerRouteArgs> {
  AudioPlayerRoute({
    _i10.Key? key,
    required String posterUrl,
    required String title,
    required String atrist,
    required String audiourl,
    required String duration,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         AudioPlayerRoute.name,
         args: AudioPlayerRouteArgs(
           key: key,
           posterUrl: posterUrl,
           title: title,
           atrist: atrist,
           audiourl: audiourl,
           duration: duration,
         ),
         initialChildren: children,
       );

  static const String name = 'AudioPlayerRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AudioPlayerRouteArgs>();
      return _i1.AudioPlayerScreen(
        key: args.key,
        posterUrl: args.posterUrl,
        title: args.title,
        atrist: args.atrist,
        audiourl: args.audiourl,
        duration: args.duration,
      );
    },
  );
}

class AudioPlayerRouteArgs {
  const AudioPlayerRouteArgs({
    this.key,
    required this.posterUrl,
    required this.title,
    required this.atrist,
    required this.audiourl,
    required this.duration,
  });

  final _i10.Key? key;

  final String posterUrl;

  final String title;

  final String atrist;

  final String audiourl;

  final String duration;

  @override
  String toString() {
    return 'AudioPlayerRouteArgs{key: $key, posterUrl: $posterUrl, title: $title, atrist: $atrist, audiourl: $audiourl, duration: $duration}';
  }
}

/// generated route for
/// [_i2.ChooseThemeScreen]
class ChooseThemeRoute extends _i9.PageRouteInfo<void> {
  const ChooseThemeRoute({List<_i9.PageRouteInfo>? children})
    : super(ChooseThemeRoute.name, initialChildren: children);

  static const String name = 'ChooseThemeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChooseThemeScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.IntroductionScreen]
class IntroductionRoute extends _i9.PageRouteInfo<void> {
  const IntroductionRoute({List<_i9.PageRouteInfo>? children})
    : super(IntroductionRoute.name, initialChildren: children);

  static const String name = 'IntroductionRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.IntroductionScreen();
    },
  );
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginScreen();
    },
  );
}

/// generated route for
/// [_i6.SignupScreen]
class SignupRoute extends _i9.PageRouteInfo<void> {
  const SignupRoute({List<_i9.PageRouteInfo>? children})
    : super(SignupRoute.name, initialChildren: children);

  static const String name = 'SignupRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.SignupScreen();
    },
  );
}

/// generated route for
/// [_i7.SignupSigninScreen]
class SignupSigninRoute extends _i9.PageRouteInfo<void> {
  const SignupSigninRoute({List<_i9.PageRouteInfo>? children})
    : super(SignupSigninRoute.name, initialChildren: children);

  static const String name = 'SignupSigninRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i7.SignupSigninScreen();
    },
  );
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.SplashScreen();
    },
  );
}
