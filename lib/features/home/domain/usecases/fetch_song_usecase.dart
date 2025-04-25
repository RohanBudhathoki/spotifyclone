import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/stream_usecases.dart';
import 'package:spotifyclone/features/home/domain/entity/songs_entity.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';

class GetSongs implements StreamUseCase<List<Song>, NoParams> {
  final SongRepo songRepo;

  GetSongs(this.songRepo);
  @override
  Stream<Either<Failure, List<Song>>> call(NoParams params) {
    return songRepo.getSong();
  }
}

class NoParams {}
