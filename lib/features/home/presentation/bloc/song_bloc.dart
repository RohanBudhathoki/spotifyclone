import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';

import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/features/home/domain/entity/songs_entity.dart';
import 'package:spotifyclone/features/home/domain/usecases/fetch_song_usecase.dart';

part 'song_event.dart';
part 'song_state.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  final GetSongs _getSongs;

  SongBloc({required GetSongs getSongs})
    : _getSongs = getSongs,

      super(SongDataLoading()) {
    on<SongEvent>((event, emit) {});

    on<GetSongBloc>(_fetchSongs);
  }

  void _fetchSongs(GetSongBloc event, Emitter<SongState> emit) async {
    emit(SongDataLoading());

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
}
