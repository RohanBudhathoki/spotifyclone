import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';

class StopAudio implements UseCase<void, NoParmsStop> {
  final SongRepo songRepo;

  StopAudio(this.songRepo);
  @override
  Future<Either<Failure, void>> call(NoParmsStop params) {
    return songRepo.stopAudio();
  }
}

class NoParmsStop {}
