import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/features/home/data/datasource/song_remote_data_source.dart';
import 'package:spotifyclone/features/home/domain/entity/songs_entity.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';

class FetchSongRepoImple implements SongRepo {
  final SongRemoteDataSource dataSource;

  FetchSongRepoImple(this.dataSource);

  @override
  Stream<Either<Failure, List<Song>>> getSong() async* {
    try {
      final stream = dataSource.getSong();

      await for (final songList in stream) {
        yield right(songList);
      }
    } catch (e) {
      yield left(Failure(message: 'Error fetching songs: ${e.toString()}'));
    }
  }
}
