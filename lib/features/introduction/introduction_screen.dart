import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/core/assets/app_png.dart';
import 'package:spotifyclone/core/assets/app_svg.dart';
import 'package:spotifyclone/core/common/common_button.dart';
import 'package:spotifyclone/core/config/theme/app_colors.dart';
import 'package:spotifyclone/core/router/app_route.gr.dart';

@RoutePage()
class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppPng.introBg),
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
                  SizedBox(height: 400.h),
                  Column(
                    children: [
                      Text(
                        "Enjoy listening to music",
                        style: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightBackGround,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 21.h),
                      Text(
                        'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Sagittis enim \npurus sed phasellus. Cursus ornare id \nscelerisque aliquam.',
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff797979),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: 37.h),
                  CustomButton(
                    onPressed: () {
                      context.router.push(ChooseThemeRoute());
                    },
                    title: 'Get Started',
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
