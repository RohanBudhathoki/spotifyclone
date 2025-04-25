part of 'song_bloc.dart';

@immutable
sealed class SongEvent {}

final class GetSongBloc extends SongEvent {}
