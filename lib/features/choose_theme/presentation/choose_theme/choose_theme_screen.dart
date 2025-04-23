import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/core/assets/app_png.dart';
import 'package:spotifyclone/core/assets/app_svg.dart';
import 'package:spotifyclone/core/common/common_button.dart';
import 'package:spotifyclone/core/config/theme/app_colors.dart';
import 'package:spotifyclone/core/router/app_route.gr.dart';
import 'package:spotifyclone/features/choose_theme/presentation/bloc/theme_choose_cubit.dart';

@RoutePage()
class ChooseThemeScreen extends StatelessWidget {
  const ChooseThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppPng.chooseThemeBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(30).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVector.spotifyLogo, height: 60.h),
                  SizedBox(height: 340.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50).r,
                    child: Column(
                      children: [
                        Text(
                          'Choose Mode',
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.lightBackGround,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ThemeChooseCubit>()
                                        .udpateTheme(ThemeMode.dark);
                                  },
                                  child: ClipOval(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 30,
                                        sigmaY: 30,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(19).r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(
                                            0xffFFFFFF,
                                          ).withOpacity(0.1),
                                        ),
                                        height: 73.h,
                                        width: 73.w,
                                        child: SvgPicture.asset(
                                          AppVector.darkThemeLogo,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 17.h),
                                Text(
                                  'Dark Mode',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightBackGround,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(width: 50.w),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ThemeChooseCubit>()
                                        .udpateTheme(ThemeMode.light);
                                  },
                                  child: ClipOval(
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 30,
                                        sigmaY: 30,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.all(19).r,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(
                                            0xffFFFFFF,
                                          ).withOpacity(0.1),
                                        ),
                                        height: 73.h,
                                        width: 73.w,
                                        child: SvgPicture.asset(
                                          AppVector.lightThemeLogo,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 17.h),
                                Text(
                                  'Light Mode',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.lightBackGround,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 37.h),
                  CustomButton(
                    onPressed: () {
                      context.router.push(SignupSigninRoute());
                    },
                    title: 'Continue',
                    height: 92.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
