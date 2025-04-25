import 'package:fpdart/fpdart.dart';
import 'package:spotifyclone/core/error/failure.dart';
import 'package:spotifyclone/core/usecase/usecases.dart';
import 'package:spotifyclone/features/home/domain/repo/fetch_song_repo.dart';

class ResumeAudio implements UseCase<void, NoParmsResume> {
  final SongRepo songRepo;

  ResumeAudio(this.songRepo);
  @override
  Future<Either<Failure, void>> call(NoParmsResume params) {
    return songRepo.resumeAudio();
  }
}

class NoParmsResume {}
