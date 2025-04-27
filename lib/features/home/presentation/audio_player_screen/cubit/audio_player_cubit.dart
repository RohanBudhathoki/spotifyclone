import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
part 'audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  bool get isPlaying => _audioPlayer.playing;

  AudioPlayerCubit() : super(SongLoading()) {
    _initialize();
  }

  void _initialize() {
    _audioPlayer.positionStream.listen((position) {
      songPosition = position;
      emit(SongLoaded(position: songPosition, duration: songDuration));
    });

    _audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        songDuration = duration;
        emit(SongLoaded(position: songPosition, duration: songDuration));
      }
    });
  }

  Future<void> loadSong(String url) async {
    emit(SongLoading());
    try {
      await _audioPlayer.setUrl(url);
      songDuration = _audioPlayer.duration ?? Duration.zero;
      emit(SongLoaded(duration: songDuration, position: songPosition));
    } catch (e) {
      emit(SongFailure('Failed to load song: $e'));
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
      emit(SongFailure("Error during playback: $e"));
    }
  }

  Future<void> seekToPosition(Duration position) async {
    try {
      await _audioPlayer.seek(position);
      emit(SongPlaying());
    } catch (e) {
      emit(SongFailure("Error seeking to position: $e"));
    }
  }

  @override
  Future<void> close() async {
    await _audioPlayer.dispose();
    super.close();
  }
}
