import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotifyclone/features/home/presentation/bloc/song_bloc.dart';
part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  bool get isPlaying => _audioPlayer.playing;

  AudioPlayerCubit() : super(SongLoaded()) {
    initialize();
  }

  void initialize() {
    _audioPlayer.positionStream.listen((p) {
      songPosition = p;
      emit(SongLoaded());
    });
    _audioPlayer.durationStream.listen((d) {
      if (d != null) songDuration = d;
      emit(SongLoaded());
    });
  }

  Future<void> loadSong(String url) async {
    emit(SongLoading());
    try {
      await _audioPlayer.setUrl(url);
      songDuration = _audioPlayer.duration ?? Duration.zero;
      emit(SongLoaded());
    } catch (e) {
      emit(SongPlayerFailure('Failed to load song: $e'));
    }
  }

  void playPauseSong() async {
    try {
      if (_audioPlayer.playing) {
        await _audioPlayer.pause();
        emit(SongPaused());
      } else {
        await _audioPlayer.play();
        emit(SongPlaying());
      }
    } catch (e) {
      emit(SongPlayerFailure("Error during playback: $e"));
    }
  }

  void seek(double value) {
    try {
      _audioPlayer.seek(Duration(seconds: value.toInt()));
      emit(SongLoaded());
    } catch (e) {
      emit(SongPlayerFailure("Error during playback: $e"));
    }
  }

  @override
  Future<void> close() async {
    await _audioPlayer.dispose();
    super.close();
  }
}
