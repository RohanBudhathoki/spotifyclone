part of 'song_bloc.dart';

@immutable
sealed class SongEvent {}

final class GetSongBloc extends SongEvent {}

final class LoadSongBloc extends SongEvent {
  final String songUrl;

  LoadSongBloc(this.songUrl);
}
