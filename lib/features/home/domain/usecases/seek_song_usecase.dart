import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';

class SeekAudio implements UseCase<void, SeekAudioParams> {
  final SongRepo songRepo;

  SeekAudio(this.songRepo);

  @override
  Future<Either<Failure, void>> call(SeekAudioParams params) {
    return songRepo.seekAudio(postiton: params.position);
  }
}

class SeekAudioParams {
  final Duration position;

  SeekAudioParams(this.position);
}
