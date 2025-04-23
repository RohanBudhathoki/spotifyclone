import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/core/assets/app_png.dart';
import 'package:spotifyclone/core/assets/app_svg.dart';
import 'package:spotifyclone/core/common/common_button.dart';

import 'package:spotifyclone/core/helper/is_dark_mode.dart';

@RoutePage()
class SignupSigninScreen extends StatelessWidget {
  const SignupSigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVector.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVector.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppPng.bottomRightBg),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppVector.spotifyLogo, height: 60.h),
                SizedBox(height: 55.h),
                Text(
                  "Enjoy listening to music",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: context.isDarkMode ? Colors.white : Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 21.h),
                Text(
                  'Spotify is a proprietary Swedish audio \nstreaming and media services provider',
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff797979),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25).r,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: CustomButton(
                          title: 'Register',
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 90.w),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 17.sp,

                            color:
                                context.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
