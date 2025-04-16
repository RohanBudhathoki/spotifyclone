import 'package:flutter/material.dart';
import 'package:spotifyclone/core/config/theme/app_theme.dart';
import 'package:spotifyclone/core/router/app_route.dart';
import 'package:spotifyclone/features/splash/splash_screen.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MaterialApp.router(
      routerConfig: appRouter.config(),
      theme: AppTheme.lightTheme,
    );
  }
}
