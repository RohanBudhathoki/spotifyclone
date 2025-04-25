part of 'song_bloc.dart';

@immutable
sealed class SongEvent {}

final class GetSongBloc extends SongEvent {}

final class PlayAudioBloc extends SongEvent {
  final String songUrl;

  PlayAudioBloc(this.songUrl);
}

final class PauseAudioBloc extends SongEvent {
  final String songUrl;

  PauseAudioBloc(this.songUrl);
}

final class StopAudioBloc extends SongEvent {}

final class ResumeAudioBloc extends SongEvent {}
