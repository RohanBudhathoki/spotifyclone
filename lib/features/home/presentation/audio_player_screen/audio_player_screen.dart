import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotifyclone/core/assets/app_png.dart';
import 'package:spotifyclone/core/common/common_button.dart';
import 'package:spotifyclone/core/config/theme/app_colors.dart';
import 'package:spotifyclone/core/helper/is_dark_mode.dart';
import 'package:spotifyclone/features/home/presentation/bloc/song_bloc.dart';

@RoutePage()
class AudioPlayerScreen extends StatelessWidget {
  final String posterUrl;
  final String title;

  final String atrist;
  final String audiourl;
  final String duration;
  const AudioPlayerScreen({
    super.key,
    required this.posterUrl,
    required this.title,
    required this.atrist,
    required this.audiourl,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                GestureDetector(
                  onDoubleTap: () {
                    context.pop();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppPng.backIcon),
                      ),
                      color:
                          context.isDarkMode
                              ? Color(0xff2C2C2C)
                              : Color(0xffE6E6E6),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                Text(
                  'Now Playing',
                  style: TextStyle(
                    color: AppColors.lightBackGround,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color:
                        context.isDarkMode
                            ? AppColors.greyText
                            : AppColors.darkBackGround,
                  ),
                ),
              ],
            ),
            SizedBox(height: 22.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28).r,
              child: Container(
                height: 370.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30).r,
                  image: DecorationImage(
                    image: NetworkImage(posterUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color:
                              context.isDarkMode
                                  ? Color(0xffE1E1E1)
                                  : AppColors.darkBackGround,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        atrist,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color:
                              context.isDarkMode
                                  ? Color(0xffE1E1E1)
                                  : AppColors.darkBackGround,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(AppPng.heart),
                ],
              ),
            ),
            Slider(value: 3, min: 0, max: 3, onChanged: (value) {}),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 63).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppPng.repeate),
                  Image.asset(AppPng.previous),
                  Container(
                    height: 72.h,
                    width: 72.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      image: DecorationImage(image: AssetImage(AppPng.pause)),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Image.asset(AppPng.next),
                  Image.asset(AppPng.shuffle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
