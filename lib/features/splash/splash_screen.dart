import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/core/assets/app_svg.dart';

import 'package:spotifyclone/core/router/app_route.gr.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void waitTime() async {
    final router = context.router;
    await Future.delayed(Duration(seconds: 3));

    if (mounted) {
      router.push(IntroductionRoute());
    }
  }

  @override
  void initState() {
    waitTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(AppVector.spotifyLogo)),
    );
  }
}
