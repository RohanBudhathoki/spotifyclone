import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotifyclone/core/assets/app_png.dart';
import 'package:spotifyclone/core/config/theme/app_colors.dart';
import 'package:spotifyclone/core/helper/is_dark_mode.dart';
import 'package:spotifyclone/features/home/domain/entity/songs_entity.dart';
import 'package:spotifyclone/features/home/presentation/audio_player_screen/cubit/audio_player_cubit.dart';
import 'package:spotifyclone/features/home/presentation/audio_player_screen/widget/slider.dart';

@RoutePage()
class AudioPlayerScreen extends StatefulWidget {
  final Song song;

  const AudioPlayerScreen({super.key, required this.song});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            context.isDarkMode
                ? AppColors.darkBackGround
                : AppColors.lightBackGround,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            height: 20.h,
            width: 20.w,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppPng.backIcon)),
              color: context.isDarkMode ? Color(0xff2C2C2C) : Color(0xffE6E6E6),
              shape: BoxShape.circle,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Now Playing',
          style: TextStyle(
            color: AppColors.lightBackGround,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      body: BlocProvider(
        create: (context) => AudioPlayerCubit(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 22.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28).r,
                child: Container(
                  height: 370.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30).r,
                    image: DecorationImage(
                      image: NetworkImage(widget.song.coverArt),
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
                          widget.song.title,
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
                          widget.song.artist,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27.5).r,
                child: SliderAudioPlayer(songurl: widget.song.audioUrl),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 63).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(AppPng.repeate),
                    Image.asset(AppPng.previous),
                    GestureDetector(
                      onTap: () {
                        context.read<AudioPlayerCubit>().playPauseSong();
                      },
                      child: BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
                        builder: (context, state) {
                          return Container(
                            height: 72.h,
                            width: 72.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              image: DecorationImage(
                                image: AssetImage(AppPng.pause),
                              ),
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(AppPng.next),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(AppPng.shuffle),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
