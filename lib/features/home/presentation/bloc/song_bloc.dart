import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/features/home/domain/entity/songs_entity.dart';
import 'package:spotifyclone/features/home/domain/usecases/fetch_song_usecase.dart';

import 'package:spotifyclone/features/home/domain/usecases/pause_audio_usecase.dart';
import 'package:spotifyclone/features/home/domain/usecases/play_audio_usecase.dart';
import 'package:spotifyclone/features/home/domain/usecases/resume_audio_usecase.dart';
import 'package:spotifyclone/features/home/domain/usecases/stop_audio_usecase.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetSongs _getSongs;
  final PlayAudio _playAudio;
  final PauseAudio _pauseAudio;
  final ResumeAudio _resumeAudio;
  final StopAudio _stopAudio;
  SongBloc({
    required GetSongs getSongs,
    required PlayAudio playAudio,
    required PauseAudio pauseAudio,
    required ResumeAudio resumeAudio,
    required StopAudio stopAudio,
  }) : _getSongs = getSongs,
       _pauseAudio = pauseAudio,
       _playAudio = playAudio,
       _resumeAudio = resumeAudio,
       _stopAudio = stopAudio,
       super(SongInitial()) {
    on<SongEvent>((event, emit) {});

    on<GetSongBloc>(_fetchSongs);
    on<PlayAudioBloc>(_playSong);
    on<PauseAudioBloc>(_pauseSong);
    on<StopAudioBloc>(_stopSong);
    on<ResumeAudioBloc>(_resumeSong);
  }
  void _fetchSongs(GetSongBloc event, Emitter<SongState> emit) async {
    emit(SongLoading());

    try {
      await emit.forEach<Either<Failure, List<Song>>>(
        _getSongs(NoParams()),
        onData: (res) {
          return res.fold((l) => SongFailure(l.message), (r) => SongSucess(r));
        },
        onError: (error, _) => SongFailure("Error: ${error.toString()}"),
      );
    } catch (e) {
      emit(SongFailure("Unexpected error: $e"));
    }
  }

  void _playSong(PlayAudioBloc event, Emitter<SongState> emit) async {
    emit(SongLoading());
    final result = await _playAudio(PlayAudioParams(event.songUrl));
    result.fold(
      (failure) => emit(SongFailure(failure.message)),
      (_) => emit(PlayAudioSucess()),
    );
  }

  void _pauseSong(PauseAudioBloc event, Emitter<SongState> emit) async {
    emit(SongLoading());
    final result = await _pauseAudio(PauseAudioParams(event.songUrl));
    result.fold(
      (failure) => emit(SongFailure(failure.message)),
      (_) => emit(PlayAudioSucess()),
    );
  }

  void _stopSong(StopAudioBloc event, Emitter<SongState> emit) async {
    emit(SongLoading());
    final result = await _stopAudio(NoParmsStop());
    result.fold(
      (failure) => emit(SongFailure(failure.message)),
      (_) => emit(PlayAudioSucess()),
    );
  }

  void _resumeSong(ResumeAudioBloc event, Emitter<SongState> emit) async {
    emit(SongLoading());

    final result = await _resumeAudio(NoParmsResume());
    result.fold(
      (failure) => emit(SongFailure(failure.message)),
      (_) => emit(PlayAudioSucess()),
    );
  }
}
