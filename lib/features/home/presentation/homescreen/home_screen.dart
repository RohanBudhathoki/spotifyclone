import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/core/assets/app_png.dart';
import 'package:spotifyclone/core/assets/app_svg.dart';
import 'package:spotifyclone/core/config/loader/loader.dart';
import 'package:spotifyclone/core/config/theme/app_colors.dart';
import 'package:spotifyclone/core/helper/is_dark_mode.dart';
import 'package:spotifyclone/core/router/app_route.gr.dart';

import 'package:spotifyclone/features/home/presentation/bloc/song_bloc.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            context.isDarkMode
                ? AppColors.darkBackGround
                : AppColors.lightBackGround,
        title: SvgPicture.asset(AppVector.spotifyLogoHome),
        leading: SvgPicture.asset(AppVector.searchIcon, fit: BoxFit.scaleDown),
        centerTitle: true,
        actions: [
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
      body: BlocProvider.value(
        value: context.read<SongBloc>()..add(GetSongBloc()),
        child: BlocConsumer<SongBloc, SongState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is SongLoading) {
              Positioned.fill(child: LoadingOverlay());
            }

            if (state is SongSucess) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(
                            horizontal: 28,
                            vertical: 18,
                          ).r,
                      child: SizedBox(
                        height: 180.h,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                padding: EdgeInsets.only(left: 15, top: 15).r,
                                height: 118.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(30.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'New Album',
                                      style: TextStyle(
                                        color: AppColors.lightBackGround,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Happier Than \nEver',
                                      style: TextStyle(
                                        color: AppColors.lightBackGround,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Billie Eilish',
                                      style: TextStyle(
                                        color: AppColors.lightBackGround,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(AppPng.homePattern),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(AppPng.homeBg),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 273.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: state.song.length,
                        separatorBuilder:
                            (context, index) => SizedBox(width: 14.w),
                        itemBuilder: (cxt, index) {
                          final song = state.song[index];
                          return GestureDetector(
                            onTap: () {
                              context.router.push(
                                AudioPlayerRoute(
                                  posterUrl: song.coverArt,
                                  title: song.title,
                                  atrist: song.artist,
                                  audiourl: song.audioUrl,
                                  duration: song.duration,
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 185.h,
                                  width: 145.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30).r,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        state.song[index].coverArt,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomRight,

                                    child: Container(
                                      transform: Matrix4.translationValues(
                                        10,
                                        10,
                                        0,
                                      ),
                                      height: 40.h,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppPng.playButton),
                                        ),
                                        color:
                                            context.isDarkMode
                                                ? Color(0xff2C2C2C)
                                                : Color(0xffE6E6E6),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),

                                Text(
                                  state.song[index].title,
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
                                  state.song[index].artist,
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
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Playlist",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color:
                                  context.isDarkMode
                                      ? Color(0xffDBDBDB)
                                      : AppColors.darkBackGround,
                            ),
                          ),
                          Text(
                            "See More",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color:
                                  context.isDarkMode
                                      ? Color(0xffC6C6C6)
                                      : AppColors.darkBackGround,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28).r,
                      child: ListView.separated(
                        separatorBuilder:
                            (context, index) => SizedBox(height: 15.h),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.song.length,
                        itemBuilder: (ctx, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 40.h,
                                width: 40.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(AppPng.playButton),
                                  ),
                                  color:
                                      context.isDarkMode
                                          ? Color(0xff2C2C2C)
                                          : Color(0xffE6E6E6),
                                  shape: BoxShape.circle,
                                ),
                              ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.song[index].title,
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
                                    state.song[index].artist,
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

                              Text(
                                state.song[index].duration,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      context.isDarkMode
                                          ? Color(0xffE1E1E1)
                                          : AppColors.darkBackGround,
                                ),
                              ),

                              Image.asset(AppPng.favouriteIcon),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return Positioned.fill(child: LoadingOverlay());
          },
        ),
      ),
    );
  }
}
