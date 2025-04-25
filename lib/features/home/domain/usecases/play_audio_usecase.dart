import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';

class PlayAudio implements UseCase<void, PlayAudioParams> {
  final SongRepo songRepo;

  PlayAudio(this.songRepo);
  @override
  Future<Either<Failure, void>> call(PlayAudioParams params) {
    return songRepo.playAudio(songUrl: params.songUrl);
  }
}

class PlayAudioParams {
  final String songUrl;

  PlayAudioParams(this.songUrl);
}
