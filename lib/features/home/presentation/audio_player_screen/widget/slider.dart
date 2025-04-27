import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotifyclone/core/helper/is_dark_mode.dart';

import 'package:spotifyclone/features/home/presentation/audio_player_screen/cubit/audio_player_cubit.dart';

class SliderAudioPlayer extends StatefulWidget {
  final String songurl;
  const SliderAudioPlayer({super.key, required this.songurl});

  @override
  State<SliderAudioPlayer> createState() => _SliderAudioPlayerState();
}

class _SliderAudioPlayerState extends State<SliderAudioPlayer> {
  @override
  void initState() {
    super.initState();
    context.read<AudioPlayerCubit>().loadSong(widget.songurl);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioPlayerCubit, AudioPlayerState>(
      builder: (context, state) {
        print("Current AudioPlayer State: $state");
        if (state is SongLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SongLoaded ||
            state is SongPlaying ||
            state is SongPaused) {
          return StreamBuilder<Duration>(
            stream: context.read<AudioPlayerCubit>().positionStream,
            builder: (context, snapshot) {
              print("Connection State: ${snapshot.connectionState}");
              print("Snapshot Data: ${snapshot.data}");

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.active) {
                final position = snapshot.data ?? Duration.zero;
                final total = context.read<AudioPlayerCubit>().songDuration;

                return ProgressBar(
                  progressBarColor:
                      context.isDarkMode
                          ? const Color(0xffB7B7B7)
                          : const Color(0xff000000),
                  progress: position,
                  total: total,
                  onSeek: (progress) {
                    context.read<AudioPlayerCubit>().seekToPosition(progress);
                  },
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return const Text("Stream is done.");
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              return const SizedBox.shrink();
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
