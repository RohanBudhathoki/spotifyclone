import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotifyclone/core/config/theme/app_theme.dart';
import 'package:spotifyclone/core/router/app_route.dart';
import 'package:spotifyclone/features/choose_theme/presentation/bloc/theme_choose_cubit.dart';

class SpotifyApp extends StatelessWidget {
  final AppRouter appRouter;
  const SpotifyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return BlocBuilder<ThemeChooseCubit, ThemeMode>(
      builder: (context, mode) {
        return ScreenUtilInit(
          designSize: Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp.router(
              routerConfig: appRouter.config(),
              darkTheme: AppTheme.darkThemData,
              theme: AppTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              themeMode: mode,
            );
          },
        );
      },
    );
  }
}
