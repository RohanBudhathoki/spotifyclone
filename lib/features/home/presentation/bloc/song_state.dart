part of 'song_bloc.dart';

@immutable
sealed class SongState {}

final class SongInitial extends SongState {}

final class SongLoading extends SongState {}

final class SongFailure extends SongState {
  final String message;
  SongFailure(this.message);
}

final class SongSucess extends SongState {
  final List<Song> song;

  SongSucess(this.song);
}

final class PlayAudioSucess extends SongState {}
