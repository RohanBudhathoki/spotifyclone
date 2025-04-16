import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/core/assets/app_png.dart';
import 'package:spotifyclone/core/assets/app_svg.dart';
import 'package:spotifyclone/core/common/common_button.dart';
import 'package:spotifyclone/core/config/theme/app_colors.dart';

@RoutePage()
class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppPng.introBg),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: size.height * 0.04),
                  SvgPicture.asset(
                    AppVector.spotifyLogo,
                    height: size.height * 0.05,
                  ),
                  SizedBox(height: size.height * 0.43),
                  Column(
                    children: [
                      Text(
                        "Enjoy listening to music",
                        style: TextStyle(
                          fontSize: size.width * 0.065,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightBackGround,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: size.height * 0.015),
                      Text(
                        'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit. Sagittis enim \npurus sed phasellus. Cursus ornare id \nscelerisque aliquam.',
                        style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff797979),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.05),
                  CustomButton(
                    onPressed: () {},
                    title: 'Get Started',
                    height: size.height * 0.08,
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
