import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/features/choose_theme/presentation/bloc/theme_choose_cubit.dart';

extension IsDarkMode on BuildContext {
  bool get isDarkMode {
    final themeMode = BlocProvider.of<ThemeChooseCubit>(this).state;
    if (themeMode == ThemeMode.system) {
      return Theme.of(this).brightness == Brightness.dark;
    }
    return themeMode == ThemeMode.dark;
  }
}
