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
import 'package:spotifyclone/features/home/presentation/audio_player_screen/cubit/audio_player_cubit.dart';

import 'package:spotifyclone/features/home/presentation/bloc/song_bloc.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<SongBloc>().add(GetSongBloc());
    super.initState();
  }

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
      body: BlocConsumer<SongBloc, SongState>(
        listener: (context, state) {
          if (state is SongDataLoading) {
            Center(child: LoadingOverlay());
          }
        },
        builder: (context, state) {
          if (state is SongSucess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28).r,
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
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 273.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: state.song.length,
                      separatorBuilder:
                          (context, index) => SizedBox(width: 20.w),
                      itemBuilder: (cxt, index) {
                        final song = state.song[index];
                        return GestureDetector(
                          onTap: () async {
                            context.read<AudioPlayerCubit>().loadSong(
                              state.song[index].audioUrl,
                            );

                            context.router.push(AudioPlayerRoute(song: song));
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
                          children: [
                            Row(
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
                                SizedBox(width: 23.w),
                                SizedBox(
                                  width: 100.5.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        overflow: TextOverflow.ellipsis,
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
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
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
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return Center(
            child: Text("Loading...", style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
