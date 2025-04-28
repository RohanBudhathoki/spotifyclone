part of 'audio_player_cubit.dart';

abstract class AudioPlayerState {
  const AudioPlayerState();
}

class SongLoading extends AudioPlayerState {}

class SongLoaded extends AudioPlayerState {}

class SongPlayerInitial extends AudioPlayerState {}

class SongPlaying extends AudioPlayerState {}

class SongPaused extends AudioPlayerState {}

class SongStopped extends AudioPlayerState {}

class SongPlayerFailure extends AudioPlayerState {
  final String message;

  const SongPlayerFailure(this.message);
}
