part of 'song_bloc.dart';

@immutable
sealed class SongEvent {}

final class GetSongBloc extends SongEvent {}

final class LoadSongBloc extends SongEvent {
  final String songUrl;

  LoadSongBloc(this.songUrl);
}

final class PlayAudioBloc extends SongEvent {}

final class PauseAudioBloc extends SongEvent {}

final class StopAudioBloc extends SongEvent {}

final class ResumeAudioBloc extends SongEvent {}

final class SeekAudioEvent extends SongEvent {
  final Duration position;

  SeekAudioEvent(this.position);
}

final class UpdateSongPlaying extends SongEvent {
  final bool isPlaying;

  UpdateSongPlaying(this.isPlaying);
}
