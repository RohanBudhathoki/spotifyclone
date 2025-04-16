import 'package:flutter/material.dart';
import 'package:spotifyclone/features/authentication/presentation/login/login.dart';
import 'package:spotifyclone/features/splash/splash_screen.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen());
  }
}
