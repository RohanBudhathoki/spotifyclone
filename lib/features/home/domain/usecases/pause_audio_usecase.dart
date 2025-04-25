import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';

class PauseAudio implements UseCase<void, PauseAudioParams> {
  final SongRepo songRepo;

  PauseAudio(this.songRepo);
  @override
  Future<Either<Failure, void>> call(PauseAudioParams params) {
    return songRepo.pauseAudio(songUrl: params.songUrl);
  }
}

class PauseAudioParams {
  final String songUrl;

  PauseAudioParams(this.songUrl);
}
