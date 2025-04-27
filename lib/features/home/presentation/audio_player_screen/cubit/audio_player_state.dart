part of 'audio_player_cubit.dart';

abstract class AudioPlayerState {
  const AudioPlayerState();
}

class SongLoading extends AudioPlayerState {}

class SongLoaded extends AudioPlayerState {
  final Duration position;
  final Duration duration;

  const SongLoaded({required this.position, required this.duration});
}

class SongPlayerInitial extends AudioPlayerState {}

class SongPlaying extends AudioPlayerState {}

class SongPaused extends AudioPlayerState {}

class SongStopped extends AudioPlayerState {}

class SongFailure extends AudioPlayerState {
  final String message;

  const SongFailure(this.message);
}
