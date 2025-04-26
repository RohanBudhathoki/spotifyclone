import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/features/home/domain/entity/songs_entity.dart';
import 'package:spotifyclone/features/home/domain/usecases/fetch_song_usecase.dart';

import 'package:spotifyclone/features/home/presentation/audio_player_screen/logic/audio_player_services.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetSongs _getSongs;

  final AudioPlayerService _audioPlayerService;
  SongBloc({
    required GetSongs getSongs,

    required AudioPlayerService audioPlayerService,
  }) : _getSongs = getSongs,

       _audioPlayerService = audioPlayerService,
       super(SongInitial()) {
    on<SongEvent>((event, emit) {});

    on<GetSongBloc>(_fetchSongs);
    on<LoadSongBloc>(_loadSong);
    on<PlayAudioBloc>(_playSong);
    on<PauseAudioBloc>(_pauseSong);
    on<ResumeAudioBloc>(_resumeSong);
    on<StopAudioBloc>(_stopSong);
  }
  bool isPlaying = false;
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

  void _loadSong(LoadSongBloc event, Emitter<SongState> emit) async {
    try {
      await _audioPlayerService.setUrl(event.songUrl);
      emit(SongLoaded());
    } catch (e) {
      emit(SongFailure("Unexpected error: $e"));
    }
  }

  void _playSong(PlayAudioBloc event, Emitter<SongState> emit) async {
    try {
      await _audioPlayerService.play();
      isPlaying = true;
      emit(SongPlaying());
    } catch (e) {
      emit(SongFailure("Unexpected error: $e"));
    }
  }

  void _pauseSong(PauseAudioBloc event, Emitter<SongState> emit) async {
    try {
      await _audioPlayerService.pause();
      emit(SongPaused());
    } catch (e) {
      emit(SongFailure("Unexpected error: $e"));
    }
  }

  void _resumeSong(ResumeAudioBloc event, Emitter<SongState> emit) async {
    try {
      await _audioPlayerService.resume();
      emit(SongPlaying());
    } catch (e) {
      emit(SongFailure("Unexpected error: $e"));
    }
  }

  void _stopSong(StopAudioBloc event, Emitter<SongState> emit) async {
    try {
      await _audioPlayerService.stop();
      emit(SongStopped());
    } catch (e) {
      emit(SongFailure("Unexpected error: $e"));
    }
  }
}
